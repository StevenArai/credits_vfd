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
    uint32_t n=o->noise;
    n^=n<<13; n^=n>>17; n^=n<<5;
    o->noise=n; return n;
}
/* Python's probability, expressed as a rational to avoid per-cell doubles.
   Always draw, including at saturation, to keep the replay stream explicit. */
static int chance(Ocean *o,uint64_t numerator,uint32_t denominator) {
    uint32_t n=noise(o);
    return numerator>=denominator || (uint64_t)n*denominator<=(numerator<<32);
}
static uint8_t letter(Ocean *o) {
    return (uint8_t)('a'+(((uint64_t)noise(o)*26)>>32));
}
static void column(Ocean *o,int x,int glitch) {
    int height=surface(o->phase++);
    for (int y=0;y<SEA_HEIGHT;y++) {
        uint8_t ch=(uint8_t)(y==height ? '#':y>height ? '.':160);
        if (chance(o,(uint64_t)(glitch>0 ? glitch:0),500)) ch=letter(o);
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
    credits_ocean_render(a,o);
}
void credits_ocean_render(Credits *a,Ocean *o) {
    uint32_t style=canvas60_style(o->colour);
    for (int y=0;y<SEA_HEIGHT;y++) for (int x=0;x<SEA_WIDTH;x++) {
        uint32_t ch=o->cells[y*SEA_WIDTH+x];
        /* Python mutate_text: fresh transient corruption each render, only
           for normal water. Never write this layer back into the moving cells. */
        if ((ch=='#' || ch=='.' || ch==160) && chance(o,
                (uint64_t)(240+o->phase%1200)*(uint32_t)(o->glitch>0 ? o->glitch:0),1200000))
            ch=letter(o);
        canvas60_put(&a->canvas,x,SEA_TOP+y,style|ch);
    }
}
