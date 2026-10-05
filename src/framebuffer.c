#include "framebuffer.h"
#include <string.h>
static const uint16_t font[95]={
#include "font_generated.inc"
};
static const struct { uint16_t code,bits; } extra_font[]={
#include "font_extra_generated.inc"
};
static uint16_t glyph_bits(uint32_t ch,unsigned *missing) {
    if (ch>=32 && ch<=126) return font[ch-32];
    for (int i=0;extra_font[i].code;i++) if (extra_font[i].code==ch) return extra_font[i].bits;
    (*missing)++; return font['?'-32];
}
int framebuffer_pixel(const Framebuffer *f,int x,int y) {
    if (x<0 || x>=FB_WIDTH || y<0 || y>=FB_HEIGHT) return 0;
    return (f->bits[y*FB_STRIDE+x/8]>>(7-x%8))&1;
}
unsigned framebuffer_render(Framebuffer *f,const uint32_t cells[CANVAS_CELLS]) {
    return framebuffer_render_case(f,cells,0);
}
static unsigned render_grid(Framebuffer *f,const uint32_t *cells,int width,int height,int step_x,int step_y,int uppercase);
unsigned framebuffer_render_case(Framebuffer *f,const uint32_t cells[CANVAS_CELLS],int uppercase) {
#ifdef CREDITS_DIRECT60
    return render_grid(f,cells,60,20,4,6,uppercase);
#else
    return render_grid(f,cells,80,24,3,5,uppercase);
#endif
}
unsigned framebuffer_render60(Framebuffer *f,const uint32_t cells[1200],int uppercase) {
    return render_grid(f,cells,60,20,4,6,uppercase);
}
static unsigned render_grid(Framebuffer *f,const uint32_t *cells,int width,int height,int step_x,int step_y,int uppercase) {
    unsigned missing=0;
    memset(f,0,sizeof(*f));
    for (int i=0;i<width*height;i++) {
        uint32_t cell=cells[i],ch=cell&65535;
        if (uppercase && ch>='a' && ch<='z') ch=ch-'a'+'A';
        if (ch==160) ch=32; /* NBSP has space semantics. */
        uint16_t glyph=glyph_bits(ch,&missing);
        unsigned fg=(cell>>16)&63,bg=(cell>>22)&63,style=(cell>>28)&3;
        /* Nonblack colors become on; bright black remains visible. */
        int ink=fg!=30 || style==1, paper=bg!=40 && bg!=49;
        int cursor=step_x==4 && step_y==6 && (cell&CELL_CURSOR);
        for (int y=0;y<(cursor ? 6:5);y++) for (int x=0;x<(cursor ? 4:3);x++) {
            int stroke=cursor ? 1:(glyph>>(14-y*3-x))&1;
            if (cursor || (stroke ? ink:paper)) {
                int px=8+(i%width)*step_x+x,py=4+(i/width)*step_y+y;
                f->bits[py*FB_STRIDE+px/8]|=(uint8_t)(128>>(px%8));
            }
        }
    }
    return missing;
}
