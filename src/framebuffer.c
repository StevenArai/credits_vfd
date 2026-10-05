#include "framebuffer.h"
#include <string.h>
static const uint16_t font[95]={
#include "font_generated.inc"
};
int framebuffer_pixel(const Framebuffer *f,int x,int y) {
    if (x<0 || x>=FB_WIDTH || y<0 || y>=FB_HEIGHT) return 0;
    return (f->bits[y*FB_STRIDE+x/8]>>(7-x%8))&1;
}
unsigned framebuffer_render(Framebuffer *f,const uint32_t cells[CANVAS_CELLS]) {
    unsigned missing=0;
    memset(f,0,sizeof(*f));
    for (int i=0;i<CANVAS_CELLS;i++) {
        uint32_t cell=cells[i],ch=cell&65535;
        if (ch==160) ch=32; /* NBSP has space semantics. */
        if (ch<32 || ch>126) { ch='?'; missing++; }
        unsigned fg=(cell>>16)&63,bg=(cell>>22)&63,style=cell>>28;
        /* Nonblack colors become on; bright black remains visible. */
        int ink=fg!=30 || style==1, paper=bg!=40 && bg!=49;
        for (int y=0;y<5;y++) for (int x=0;x<3;x++) {
            int stroke=(font[ch-32]>>(14-y*3-x))&1;
            if (stroke ? ink:paper) {
                int px=8+(i%80)*3+x,py=4+(i/80)*5+y;
                f->bits[py*FB_STRIDE+px/8]|=(uint8_t)(128>>(px%8));
            }
        }
    }
    return missing;
}
