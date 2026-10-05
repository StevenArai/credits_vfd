#include "framebuffer.h"
#include <stdio.h>
int main(int argc,char **argv) {
    if (argc!=3 && argc!=4) return 2;
    FILE *in=fopen(argv[1],"rb"),*out=fopen(argv[2],"wb");
    if (!in || !out) return 2;
    uint32_t cells[CANVAS_CELLS]; Framebuffer f; int32_t beat;
    while (fread(&beat,4,1,in)==1) {
        if (fread(cells,4,CANVAS_CELLS,in)!=CANVAS_CELLS) return 2;
        framebuffer_render_case(&f,cells,argc==4);
        if (fwrite(f.bits,1,sizeof(f.bits),out)!=sizeof(f.bits)) return 2;
        if (framebuffer_pixel(&f,-1,0) || framebuffer_pixel(&f,256,0) || framebuffer_pixel(&f,0,128)) return 1;
    }
    fclose(in); fclose(out); return 0;
}
