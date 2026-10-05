#include "credits.h"
#include "framebuffer.h"
#include "host_time.h"
#ifndef CREDITS_DIRECT60
#include "layout60.h"
#endif
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
static uint64_t digest;
static void bytes(const void *data,size_t n) {
    const unsigned char *p=data;
    for (size_t i=0;i<n;i++) digest=(digest^p[i])*UINT64_C(1099511628211);
}
static void string(const char *s) { if (s) bytes(s,strlen(s)+1); else bytes("",1); }
#define HASH(v) bytes(&(v),sizeof(v))
static uint64_t controls(const Credits *a) {
    digest=UINT64_C(14695981039346656037);
    /* Native sea now uses its own RNG/geometry. Compare deterministic controls,
       not the intentionally different ocean, weather, or random progress. */
    HASH(a->scheduler.beat); HASH(a->scheduler.count);
    bytes(a->active,(size_t)a->scheduler.count*sizeof(int)); HASH(a->scenes);
    HASH(a->access_counter); HASH(a->access_block); HASH(a->beat_toggle);
    HASH(a->refresh); HASH(a->events_executed);
    for (int i=0;i<14;i++) { HASH(a->typers[i].offset); HASH(a->typers[i].line); string(a->typers[i].characters); string(a->typers[i].colour); }
    for (int i=0;i<3;i++) {
        HASH(a->history[i].count);
        for (int j=0;j<a->history[i].count;j++) {
            const HistoryEntry *e=&a->history[i].entries[j];
            string(e->line->value); string(e->colour); string(e->prefix);
        }
    }
    return digest;
}
static uint64_t region(const uint32_t *cells,int x,int y,int w,int h) {
    digest=UINT64_C(14695981039346656037);
    for (int row=y;row<y+h;row++) bytes(cells+row*60+x,(size_t)w*4);
    return digest;
}
int main(int argc,char **argv) {
    if (argc<3) return 2;
    static Credits a; static Framebuffer fb;
#ifndef CREDITS_DIRECT60
    Layout60 layout;
#endif
    FILE *dump=argc>3 ? fopen(argv[3],"wb"):NULL;
    if (argc>3 && !dump) return 3;
    credits_init(&a,strtoull(argv[1],NULL,10)); credits_jump(&a,atoi(argv[2]));
    double compute=0,pixels=0;
    while (a.scheduler.beat<6508) {
        double start=host_seconds(); credits_next(&a,1);
#ifdef CREDITS_DIRECT60
        const uint32_t *cells=a.canvas.cells;
#else
        layout60_render(&layout,&a); const uint32_t *cells=layout.cells;
#endif
        double mid=host_seconds(); framebuffer_render60(&fb,cells,1);
        compute+=mid-start; pixels+=host_seconds()-mid;
        printf("%d %016llx %016llx %016llx %016llx %016llx",a.scheduler.beat,
            (unsigned long long)controls(&a),(unsigned long long)region(cells,0,0,60,20),
            (unsigned long long)region(cells,0,12,60,8),(unsigned long long)region(cells,32,11,28,7),
            (unsigned long long)region(cells,26,7,8,4));
        digest=UINT64_C(14695981039346656037); bytes(fb.bits,sizeof(fb.bits));
        printf(" %016llx\n",(unsigned long long)digest);
        if (dump) fwrite(cells,4,1200,dump);
    }
    fprintf(stderr,"state=%zu canvas=%zu heap_peak=%zu calls=%zu animation_layout_ms=%.3f pixels_ms=%.3f",
        sizeof(a),sizeof(a.canvas),a.memory.peak,a.memory.calls,compute*1000,pixels*1000);
#ifdef CREDITS_DIRECT60
    fprintf(stderr," scrolled=%u clipped=%u",a.canvas.scrolled_rows,a.canvas.clipped_cells);
#endif
    credits_destroy(&a); fprintf(stderr," live=%zu\n",a.memory.live);
    if (dump) fclose(dump);
    return a.memory.live ? 4:0;
}
