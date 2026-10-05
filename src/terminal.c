#include "terminal.h"
void terminal_render(FILE *stream,const uint32_t *cells) {
    /* Per cell: <=12 ANSI bytes + 3 UTF-8 bytes; row cursor escapes <=8.
       The larger bound below also reserves the final cursor escape. */
    char buffer[CANVAS_CELLS*20+256]; size_t used=0;
    uint32_t previous=UINT32_MAX;
    for (int y=0;y<CANVAS_HEIGHT;y++) {
        used+=(size_t)snprintf(buffer+used,sizeof(buffer)-used,"\033[%d;1H",y+1);
        for (int x=0;x<CANVAS_WIDTH;x++) {
            uint32_t cell=cells[y*CANVAS_WIDTH+x], style=cell&0xffff0000U, ch=cell&65535;
            if (style!=previous) {
                used+=(size_t)snprintf(buffer+used,sizeof(buffer)-used,"\033[%u;%u;%um",(cell>>28)==0 ? 22:cell>>28,(cell>>16)&63,(cell>>22)&63);
                previous=style;
            }
            if (ch<128) buffer[used++]=(char)ch;
            else if (ch<2048) { buffer[used++]=(char)(0xc0|(ch>>6)); buffer[used++]=(char)(0x80|(ch&63)); }
            else { buffer[used++]=(char)(0xe0|(ch>>12)); buffer[used++]=(char)(0x80|((ch>>6)&63)); buffer[used++]=(char)(0x80|(ch&63)); }
        }
    }
    used+=(size_t)snprintf(buffer+used,sizeof(buffer)-used,"\033[27;1H");
    if (used>=sizeof(buffer)) credits_fail("terminal buffer capacity");
    if (fwrite(buffer,1,used,stream)!=used) credits_fail("terminal write failed");
}
