#include "credits.h"
#include <math.h>
#include <string.h>

enum { SEA_WIDTH=60, SEA_HEIGHT=8, SEA_TOP=12 };
static int surface(int phase) {
    double x=phase/5.0;
    double wave=cos(0.2*x)+sin(0.3*x)*sin(0.23*x);
    /* Quantize the curve directly onto eight rows, never resample a grid. */
    int height=(int)floor((3.0-2.0*wave*sin(x))*7.0/9.0+0.5);
    return height<0 ? 0:height>=SEA_HEIGHT ? SEA_HEIGHT-1:height;
}
static uint32_t noise(Ocean *o) {
    uint32_t x=o->noise;
    x^=x<<13; x^=x>>17; x^=x<<5;
    o->noise=x; return x;
}
static void column(Ocean *o,int x,int glitch) {
    int height=surface(o->phase++);
    for (int y=0;y<SEA_HEIGHT;y++) {
        uint8_t ch=(uint8_t)(y==height ? '#':y>height ? '.':160);
        /* A cell's corruption is decided once when it enters the water.
           Later frames translate that SAME cell, rather than repainting noise. */
        if (glitch>0 && (glitch>=500 || noise(o)%500<(uint32_t)glitch))
            ch=(uint8_t)('a'+noise(o)%26);
        o->cells[y*SEA_WIDTH+x]=ch;
    }
}
void credits_ocean_begin(Credits *a,Ocean *o) {
    o->phase=a->ocean_time;
    o->noise=random_u32(&a->random);
    if (!o->noise) o->noise=UINT32_C(0x9e3779b9);
    for (int x=0;x<SEA_WIDTH;x++) column(o,x,1);
    a->ocean_time=o->phase;
}
void credits_ocean_update(Credits *a,Ocean *o) {
    for (int y=0;y<SEA_HEIGHT;y++)
        memmove(o->cells+y*SEA_WIDTH,o->cells+y*SEA_WIDTH+1,SEA_WIDTH-1);
    column(o,SEA_WIDTH-1,o->glitch);
    uint32_t style=canvas60_style(o->colour);
    for (int y=0;y<SEA_HEIGHT;y++) for (int x=0;x<SEA_WIDTH;x++)
        canvas60_put(&a->canvas,x,SEA_TOP+y,style|o->cells[y*SEA_WIDTH+x]);
}
