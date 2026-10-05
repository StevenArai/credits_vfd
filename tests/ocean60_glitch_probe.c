#include "credits.h"
#include "colours.h"
#include <stdio.h>
#include <stdlib.h>
static void dump(Credits *a,Ocean *o,int glitch) {
    printf("%d %u %d ",o->phase,(unsigned)o->noise,glitch);
    for (int i=0;i<480;i++) printf("%02x",o->cells[i]);
    putchar(' ');
    for (int i=0;i<480;i++) printf("%02x",(unsigned)(a->canvas.cells[720+i]&255));
    putchar('\n');
}
int main(int argc,char **argv) {
    static Credits a;
    const int levels[]={0,1,3,6,13,102,230,500,760,1600,2500,0};
    credits_init(&a,argc>1 ? strtoul(argv[1],NULL,10):1);
    /* Exercise the probability phase wrap as well as every event strength. */
    a.ocean_time=1100;
    Ocean *o=&a.oceans[0]; credits_ocean_begin(&a,o); o->colour=WHITE BRIGHT;
    dump(&a,o,0);
    for (int level=0;level<12;level++) for (int frame=0;frame<70;frame++) {
        o->glitch=levels[level]; credits_ocean_update(&a,o); dump(&a,o,o->glitch);
        credits_ocean_render(&a,o); dump(&a,o,o->glitch);
    }
    credits_destroy(&a); return a.memory.live!=0;
}
