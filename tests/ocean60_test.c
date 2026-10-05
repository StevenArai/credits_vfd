#include "credits.h"
#include "colours.h"
#include "framebuffer.h"
#include <stdio.h>
#include <string.h>
#define CHECK(v) do { if (!(v)) { fprintf(stderr,"ocean motion line %d\n",__LINE__); return 1; } } while (0)
int main(void) {
    static Credits a,b;
    const int glitches[]={0,1,16,100,2500};
    const uint64_t seeds[]={0,1,42};
    unsigned translations=0;
    for (int seed=0;seed<3;seed++) {
        credits_init(&a,seeds[seed]); credits_init(&b,seeds[seed]);
        Ocean *o=&a.oceans[0],*repeat=&b.oceans[0];
        credits_ocean_begin(&a,o); credits_ocean_begin(&b,repeat);
        o->colour=repeat->colour=WHITE BRIGHT;
        Random before=a.random;
        size_t calls=a.memory.calls;
        for (int step=0;step<1600;step++) {
            o->glitch=repeat->glitch=glitches[step/320];
            uint8_t previous[480]; memcpy(previous,o->cells,sizeof(previous));
            int phase=o->phase;
            Framebuffer previous_pixels,current_pixels;
            int check_pixels=step>0 && step%16==0 && step%320!=0;
            if (check_pixels) framebuffer_render60(&previous_pixels,a.canvas.cells,1);
            credits_ocean_update(&a,o); credits_ocean_update(&b,repeat);
            if (check_pixels) {
                framebuffer_render60(&current_pixels,a.canvas.cells,1);
                for (int y=76;y<124;y++) for (int x=8;x<244;x++)
                    CHECK(framebuffer_pixel(&current_pixels,x,y)==framebuffer_pixel(&previous_pixels,x+4,y));
            }
            CHECK(o->phase==phase+1);
            CHECK(!memcmp(o->cells,repeat->cells,sizeof(o->cells)));
            CHECK(o->noise==repeat->noise);
            for (int y=0;y<8;y++) for (int x=0;x<60;x++) {
                if (x<59) { CHECK(o->cells[y*60+x]==previous[y*60+x+1]); translations++; }
                uint32_t ch=a.canvas.cells[(12+y)*60+x]&65535;
                CHECK(a.canvas.cells[(12+y)*60+x]==b.canvas.cells[(12+y)*60+x]);
                if (!o->glitch) CHECK(ch==o->cells[y*60+x]);
                if (o->glitch>=500) CHECK(ch>='a' && ch<='z');
            }
            /* The underlying wave is intact even under full corruption. */
            for (int x=0;x<60;x++) {
                int surface=-1;
                for (int y=0;y<8;y++) if (o->cells[y*60+x]=='#') { CHECK(surface==-1); surface=y; }
                CHECK(surface>=0);
                for (int y=0;y<8;y++) CHECK(o->cells[y*60+x]==(y<surface ? 160:y==surface ? '#':'.'));
            }
        }
        /* A sudden strength change must affect the LEFT edge too, on its
           first update; no 60-column propagation delay in either direction. */
        const int transitions[]={0,500,0,2500,0};
        for (int i=0;i<5;i++) {
            o->glitch=transitions[i]; credits_ocean_update(&a,o);
            for (int j=0;j<480;j++) {
                uint32_t ch=a.canvas.cells[12*60+j]&65535;
                CHECK(o->glitch ? (ch>='a' && ch<='z'):ch==o->cells[j]);
            }
        }
        CHECK(!memcmp(&before,&a.random,sizeof(before))); /* Updates cannot perturb other effects' RNG. */
        CHECK(a.memory.calls==calls && !a.canvas.clipped_cells);
        /* Two seas can advance independently, without phase jumps. */
        credits_ocean_begin(&a,&a.oceans[1]); a.oceans[1].colour=WHITE BRIGHT;
        int phase=o->phase;
        credits_ocean_update(&a,&a.oceans[1]); CHECK(o->phase==phase);
        credits_destroy(&a); credits_destroy(&b);
        CHECK(!a.memory.live && !b.memory.live);
    }
    printf("4800 updates; %u exact one-column translations; continuous eight-row coast; repeatable glitches; no frame allocations\n",translations);
    return 0;
}
