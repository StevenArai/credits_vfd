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
/* Hash a water cell's world coordinate, not its screen position or frame.
   This keeps corruption attached to the moving water without another buffer. */
static uint32_t cell_noise(const Ocean *o,int x,int y) {
    uint32_t n=o->noise+(uint32_t)(o->phase-SEA_WIDTH+x)*UINT32_C(0x9e3779b9)
        +(uint32_t)y*UINT32_C(0x85ebca6b);
    n^=n>>16; n*=UINT32_C(0x7feb352d);
    n^=n>>15; n*=UINT32_C(0x846ca68b);
    return n^(n>>16);
}
static void column(Ocean *o,int x) {
    int height=surface(o->phase++);
    for (int y=0;y<SEA_HEIGHT;y++) {
        uint8_t ch=(uint8_t)(y==height ? '#':y>height ? '.':160);
        o->cells[y*SEA_WIDTH+x]=ch;
    }
}
void credits_ocean_begin(Credits *a,Ocean *o) {
    o->phase=a->ocean_time;
    o->noise=random_u32(&a->random);
    if (!o->noise) o->noise=UINT32_C(0x9e3779b9);
    for (int x=0;x<SEA_WIDTH;x++) column(o,x);
    a->ocean_time=o->phase;
}
void credits_ocean_update(Credits *a,Ocean *o) {
    for (int y=0;y<SEA_HEIGHT;y++)
        memmove(o->cells+y*SEA_WIDTH,o->cells+y*SEA_WIDTH+1,SEA_WIDTH-1);
    column(o,SEA_WIDTH-1);
    uint32_t style=canvas60_style(o->colour);
    for (int y=0;y<SEA_HEIGHT;y++) for (int x=0;x<SEA_WIDTH;x++) {
        uint32_t ch=o->cells[y*SEA_WIDTH+x];
        if (o->glitch>0) {
            uint32_t n=cell_noise(o,x,y);
            /* Strength changes affect the entire visible sea immediately.
               At fixed strength both the mask and letters translate exactly. */
            if (o->glitch>=500 || n%500<(uint32_t)o->glitch)
                ch='a'+(n/500)%26;
        }
        canvas60_put(&a->canvas,x,SEA_TOP+y,style|ch);
    }
}
