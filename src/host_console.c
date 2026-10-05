#include "host_console.h"
#include "host_time.h"
#include "terminal.h"
#include <stdio.h>
#if defined(_WIN32)
#include <windows.h>
typedef struct {
    HANDLE input,output;
    DWORD input_mode,output_mode;
    UINT codepage;
    unsigned held,pressed;
    int menu;
} Console;
static volatile LONG interrupted;
static BOOL WINAPI stop_handler(DWORD event) {
    if (event==CTRL_C_EVENT || event==CTRL_BREAK_EVENT || event==CTRL_CLOSE_EVENT) {
        InterlockedExchange(&interrupted,1); return TRUE;
    }
    return FALSE;
}
static void clear_screen(void) { fputs("\033[0m\033[2J\033[1;1H",stdout); fflush(stdout); }
static int begin(Console *c) {
    c->input=GetStdHandle(STD_INPUT_HANDLE); c->output=GetStdHandle(STD_OUTPUT_HANDLE);
    if (!GetConsoleMode(c->input,&c->input_mode) || !GetConsoleMode(c->output,&c->output_mode)) {
        fputs("Interactive playback requires a Windows terminal; use --replay for files.\n",stderr); return 0;
    }
    CONSOLE_SCREEN_BUFFER_INFO info;
    if (!GetConsoleScreenBufferInfo(c->output,&info) || info.srWindow.Right-info.srWindow.Left+1<80 || info.srWindow.Bottom-info.srWindow.Top+1<28) {
        fputs("Please enlarge the terminal to at least 80 columns and 28 rows.\n",stderr); return 0;
    }
    c->codepage=GetConsoleOutputCP();
    if (!SetConsoleMode(c->output,c->output_mode|ENABLE_VIRTUAL_TERMINAL_PROCESSING)) return 0;
    if (!SetConsoleMode(c->input,(c->input_mode|ENABLE_WINDOW_INPUT|ENABLE_EXTENDED_FLAGS)&~(ENABLE_LINE_INPUT|ENABLE_ECHO_INPUT|ENABLE_QUICK_EDIT_MODE))) {
        SetConsoleMode(c->output,c->output_mode); return 0;
    }
    SetConsoleOutputCP(CP_UTF8); SetConsoleCtrlHandler(stop_handler,TRUE);
    fputs("\033[?25l",stdout); clear_screen(); return 1;
}
static void poll(Console *c) {
    DWORD count=0;
    if (!GetNumberOfConsoleInputEvents(c->input,&count)) { InterlockedExchange(&interrupted,1); return; }
    while (count--) {
        INPUT_RECORD record; DWORD read;
        if (!ReadConsoleInputW(c->input,&record,1,&read) || !read) break;
        if (record.EventType!=KEY_EVENT) continue;
        KEY_EVENT_RECORD *key=&record.Event.KeyEvent;
        unsigned bit=0;
        switch (key->wVirtualKeyCode) {
        case 'P': bit=KEY_PAUSE; break;
        case VK_OEM_COMMA: bit=KEY_COMMA; break;
        case VK_OEM_PERIOD: bit=KEY_PERIOD; break;
        case VK_OEM_2: bit=KEY_SLASH; break;
        default: break;
        }
        if (key->bKeyDown) {
            c->held|=bit; c->pressed|=bit;
            if (key->uChar.UnicodeChar>='1' && key->uChar.UnicodeChar<='6') {
                int choice=key->uChar.UnicodeChar-'0';
                if (!c->menu || choice<c->menu) c->menu=choice;
            }
        } else c->held&=~bit;
    }
}
int host_play(Credits *a,int jump,int menu,int last) {
    Console c={0}; interrupted=0;
    if (!begin(&c)) return 2;
    if (menu) {
        fputs("skips\n\n1 | start\n2 | title\n3 | funding\n4 | loading\n5 | break\n6 | final\n\np pause/resume  , . / forward  Ctrl+C stop\n",stdout); fflush(stdout);
        double until=host_seconds()+2;
        while (!interrupted && host_seconds()<until && !c.menu) { poll(&c); Sleep(1); }
        if (c.menu) jump=c.menu;
    }
    clear_screen(); Player p; player_init(&p,a,jump,host_seconds());
    while (p.active) {
        poll(&c);
        double update=p.last_update;
        int result=player_step(&p,host_seconds(),c.held|c.pressed,!interrupted && a->scheduler.beat<last);
        if (p.last_update!=update) c.pressed=0;
        if (result==1) { terminal_render(stdout,a->canvas.cells); fflush(stdout); }
        else if (result==2) clear_screen();
        else Sleep(1);
    }
    fputs("\033[?25h",stdout); fflush(stdout);
    SetConsoleCtrlHandler(stop_handler,FALSE);
    SetConsoleOutputCP(c.codepage); SetConsoleMode(c.input,c.input_mode); SetConsoleMode(c.output,c.output_mode);
    return 0;
}
#else
int host_play(Credits *a,int jump,int menu,int last) {
    (void)a;(void)jump;(void)menu;(void)last;
    fputs("Interactive adapter is currently implemented for Windows only.\n",stderr); return 2;
}
#endif
