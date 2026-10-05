#include "credits.h"
#include <math.h>
#include <string.h>
static int surface(int time) {
    double x=time/5.0;
    double c=cos(0.2*x)+sin(0.3*x)*sin(0.23*x);
    return -(int)floor(2*c*sin(x))+3;
}
static uint32_t sample(Credits *a,int row,int height,int glitch) {
    if (random_unit(&a->random)<=0.002*glitch)
        return (uint32_t)('a'+(int)floor(random_unit(&a->random)*26));
    return row==height ? '#':row>height ? '.':160;
}
void credits_ocean_begin(Credits *a,Ocean *o) {
    for (int x=0;x<80;x++) {
        int height=surface(a->ocean_time+x);
        for (int y=0;y<10;y++) o->cells[y*80+x]=sample(a,y,height,1);
    }
    a->ocean_time+=80;
}
void credits_ocean_update(Credits *a,Ocean *o) {
    uint32_t slice[10];
#ifdef CREDITS_DIRECT60
    int destination=0;
    uint32_t style=canvas60_style(o->colour);
#else
    uint32_t output[800];
#endif
    int height=surface(a->ocean_time);
    for (int y=0;y<10;y++) slice[y]=sample(a,y,height,o->glitch);
    a->ocean_time++;
    for (int y=0;y<10;y++) {
        memmove(o->cells+y*80,o->cells+y*80+1,79*sizeof(uint32_t));
        o->cells[y*80+79]=slice[y];
    }
    double chance=(0.0002+(a->ocean_time%1200)/1200000.0)*o->glitch;
    for (int i=0;i<800;i++) {
        uint32_t ch=o->cells[i];
        if ((ch=='#' || ch=='.' || ch==160) && random_unit(&a->random)<=chance)
            ch=(uint32_t)('a'+(int)floor(random_unit(&a->random)*26));
#ifdef CREDITS_DIRECT60
        /* Keep every simulation/RNG step; sample directly into the 60x8 region. */
        if (destination<480 && i==(destination/60*9/7)*80+destination%60*79/59) {
            canvas60_put(&a->canvas,destination%60,12+destination/60,style|ch);
            destination++;
        }
#else
        output[i]=ch;
#endif
    }
#ifndef CREDITS_DIRECT60
    canvas_chars(&a->canvas,0,14,output,800,o->colour);
#endif
}
