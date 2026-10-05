#include "credits.h"
#include "colours.h"
#include <stdio.h>
#include <stdlib.h>
static uint64_t rng_hash(const Random *r) {
    uint64_t hash=UINT64_C(14695981039346656037);
    const unsigned char *p=(const unsigned char *)r;
    for (size_t i=0;i<sizeof(*r);i++) hash=(hash^p[i])*UINT64_C(1099511628211);
    return hash;
}
int main(int argc,char **argv) {
    if (argc!=3) return 2;
    FILE *out=fopen(argv[2],"wb"); if (!out) return 3;
    static Credits a; credits_init(&a,strtoull(argv[1],NULL,10));
    Ocean *o=&a.oceans[0]; o->colour=WHITE BRIGHT;
    /* Synthetic shorelines at EVERY height, including both discarded rows.
       Update shifts left; the final column is a real newly generated wave. */
    for (int test=0;test<330;test++) {
        if (test<10) {
            o->glitch=0;
            for (int y=0;y<10;y++) for (int x=0;x<80;x++)
                o->cells[y*80+x]=y==test ? '#':y>test ? '.':160;
        } else if (test==10) {
            credits_ocean_begin(&a,o);
        }
        if (test>=10) {
            const int glitches[]={0,1,16,100,2500};
            o->glitch=glitches[(test-10)/64];
        }
        credits_ocean_update(&a,o); canvas_render(&a.canvas);
        uint64_t hash=rng_hash(&a.random); fwrite(&hash,8,1,out);
#ifdef CREDITS_DIRECT60
        fwrite(a.canvas.cells+12*60,4,480,out);
#else
        fwrite(a.canvas.cells+14*80,4,800,out);
#endif
    }
    credits_destroy(&a); fclose(out);
    return a.memory.live ? 4:0;
}
