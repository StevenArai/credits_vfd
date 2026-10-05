#include "terminal.h"
void terminal_render(FILE *stream,const uint32_t *cells) {
    uint32_t previous=UINT32_MAX;
    for (int y=0;y<CANVAS_HEIGHT;y++) {
        fprintf(stream,"\033[%d;1H",y+1);
        for (int x=0;x<CANVAS_WIDTH;x++) {
            uint32_t cell=cells[y*CANVAS_WIDTH+x], style=cell&0xffff0000U, ch=cell&65535;
            if (style!=previous) {
                fprintf(stream,"\033[%u;%u;%um",(cell>>28)==0 ? 22:cell>>28,(cell>>16)&63,(cell>>22)&63);
                previous=style;
            }
            if (ch<128) fputc((int)ch,stream);
            else if (ch<2048) { fputc((int)(0xc0|(ch>>6)),stream); fputc((int)(0x80|(ch&63)),stream); }
            else { fputc((int)(0xe0|(ch>>12)),stream); fputc((int)(0x80|((ch>>6)&63)),stream); fputc((int)(0x80|(ch&63)),stream); }
        }
    }
    fputs("\033[27;1H",stream);
}
