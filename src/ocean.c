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
    int column=0;
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
        /* Reduce 10 rows to 8 without dropping the one-cell shoreline.
           Row groups are [0],[1],[2],[3],[4,5],[6],[7],[8,9]. Keep '#'
           if either rendered source cell has it; otherwise use the last cell.
           Apply this after glitches, without synthesizing lost/randomized '#'. */
        int source_y=i/80,source_x=i%80;
        if (!source_x) column=0;
        if (column<60 && source_x==column*79/59) {
            int row=(source_y*7+8)/9;
            int first=source_y==0 || ((source_y-1)*7+8)/9!=row;
            uint32_t previous=a->canvas.cells[(12+row)*60+column]&65535;
            if (first || ch=='#' || previous!='#')
                canvas60_put(&a->canvas,column,12+row,style|ch);
            column++;
        }
#else
        output[i]=ch;
#endif
    }
#ifndef CREDITS_DIRECT60
    canvas_chars(&a->canvas,0,14,output,800,o->colour);
#endif
}
