/* Real Windows ConPTY integration: menu input, ANSI output, stop and mode cleanup. */
#define _WIN32_WINNT 0x0A00
#include <windows.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
typedef struct { HANDLE pipe; FILE *log; unsigned long bytes; } Reader;
static DWORD WINAPI drain(void *arg) {
    Reader *r=arg; char buffer[4096]; DWORD count;
    while (ReadFile(r->pipe,buffer,sizeof(buffer),&count,NULL) && count) {
        fwrite(buffer,1,count,r->log); r->bytes+=count;
    }
    return 0;
}
static int run(const char *exe,const char *logpath,int stop) {
    HANDLE input_read,input_write,output_read,output_write;
    if (!CreatePipe(&input_read,&input_write,NULL,0) || !CreatePipe(&output_read,&output_write,NULL,0)) return 2;
    HPCON console; COORD size={80,30};
    if (FAILED(CreatePseudoConsole(size,input_read,output_write,0,&console))) return 2;
    CloseHandle(input_read); CloseHandle(output_write);
    SIZE_T bytes=0;
    InitializeProcThreadAttributeList(NULL,1,0,&bytes);
    STARTUPINFOEXW startup={0}; startup.StartupInfo.cb=sizeof(startup);
    startup.lpAttributeList=malloc(bytes); if (!startup.lpAttributeList) return 2;
    if (!InitializeProcThreadAttributeList(startup.lpAttributeList,1,0,&bytes) ||
        !UpdateProcThreadAttribute(startup.lpAttributeList,0,PROC_THREAD_ATTRIBUTE_PSEUDOCONSOLE,console,sizeof(console),NULL,NULL)) return 2;
    wchar_t path[2048],command[2200];
    MultiByteToWideChar(CP_UTF8,0,exe,-1,path,2048);
    swprintf(command,2200,L"\"%ls\" --play --last %d",path,stop ? 6508:5501);
    PROCESS_INFORMATION process={0};
    Reader reader={output_read,fopen(logpath,"wb"),0}; if (!reader.log) return 2;
    HANDLE thread=CreateThread(NULL,0,drain,&reader,0,NULL);
    /* This harness itself may be launched with redirected standard handles.
       Let ConPTY supply the child's handles instead of inheriting those pipes. */
    HANDLE old_input=GetStdHandle(STD_INPUT_HANDLE),old_output=GetStdHandle(STD_OUTPUT_HANDLE),old_error=GetStdHandle(STD_ERROR_HANDLE);
    SetStdHandle(STD_INPUT_HANDLE,NULL); SetStdHandle(STD_OUTPUT_HANDLE,NULL); SetStdHandle(STD_ERROR_HANDLE,NULL);
    BOOL created=CreateProcessW(NULL,command,NULL,NULL,FALSE,EXTENDED_STARTUPINFO_PRESENT,NULL,NULL,&startup.StartupInfo,&process);
    SetStdHandle(STD_INPUT_HANDLE,old_input); SetStdHandle(STD_OUTPUT_HANDLE,old_output); SetStdHandle(STD_ERROR_HANDLE,old_error);
    if (!created) return 2;
    Sleep(150); DWORD written; WriteFile(input_write,"6",1,&written,NULL);
    if (stop) {
        Sleep(250); WriteFile(input_write,"p",1,&written,NULL);
        Sleep(100); WriteFile(input_write,"p",1,&written,NULL);
        Sleep(100); WriteFile(input_write,",./",3,&written,NULL);
        Sleep(200); WriteFile(input_write,"\003",1,&written,NULL);
    }
    DWORD wait=WaitForSingleObject(process.hProcess,10000),exit_code=0;
    if (wait!=WAIT_OBJECT_0) { TerminateProcess(process.hProcess,3); exit_code=3; }
    else GetExitCodeProcess(process.hProcess,&exit_code);
    CloseHandle(input_write); ClosePseudoConsole(console);
    WaitForSingleObject(thread,3000); CloseHandle(output_read); CloseHandle(thread);
    fclose(reader.log); CloseHandle(process.hProcess); CloseHandle(process.hThread);
    DeleteProcThreadAttributeList(startup.lpAttributeList); free(startup.lpAttributeList);
    if (exit_code || reader.bytes<2000) {
        fprintf(stderr,"ConPTY failure: stop=%d exit=%lu bytes=%lu\n",stop,exit_code,reader.bytes); return 1;
    }
    printf("ConPTY stop=%d: exit=0, captured %lu ANSI bytes\n",stop,reader.bytes);
    return 0;
}
int main(int argc,char **argv) {
    if (argc!=4) return 2;
    if (run(argv[1],argv[2],0)) return 1;
    return run(argv[1],argv[3],1);
}
