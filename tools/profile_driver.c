/* Headless core only: no terminal rendering, SDL, audio or platform event loop. */
#include "credits.h"
#include "layout60.h"
#include "framebuffer.h"
#include "host_time.h"
#include <stdio.h>
#include <stdlib.h>
#ifdef PROFILE_COUNTS
#include "profile.h"
#endif
static unsigned long long digest=14695981039346656037ULL;
static void hash(const void *data,size_t size) {
    const unsigned char *p=data;
    for (size_t i=0;i<size;i++) digest=(digest^p[i])*1099511628211ULL;
}
int main(int argc,char **argv) {
    Credits *a=malloc(sizeof(*a)); if (!a) return 1;
    Framebuffer frame;
#ifndef CREDITS_DIRECT60
    Layout60 layout;
    size_t layout_size=sizeof(layout);
#else
    size_t layout_size=0;
#endif
    unsigned seed=argc>1 ? (unsigned)strtoul(argv[1],NULL,10):1;
    credits_init(a,seed); credits_jump(a,1);
    size_t init_live=a->memory.live,init_calls=a->memory.calls;
    double animation=0,flow=0,pixels=0;
    for (int beat=0;beat<=6508;beat++) {
#ifdef PROFILE_COUNTS
        profile_beat=beat;
#endif
        double start=host_seconds(); credits_next(a,1); double next=host_seconds();
#ifndef CREDITS_DIRECT60
        layout60_render(&layout,a);
        const uint32_t *cells=layout.cells;
        double drawn=host_seconds();
#else
        const uint32_t *cells=a->canvas.cells;
        double drawn=next;
#endif
        framebuffer_render60(&frame,cells,1); double end=host_seconds();
        animation+=next-start; flow+=drawn-next; pixels+=end-drawn;
        hash(a->canvas.cells,sizeof(a->canvas.cells)); hash(frame.bits,sizeof(frame.bits));
        hash(&a->random,sizeof(a->random)); /* Catch hidden RNG drift in experiments. */
    }
    printf("{\"seed\":%u,\"frames\":6509,\"digest\":\"%016llx\",\"credits\":%zu,\"layout\":%zu,\"framebuffer\":%zu,\"init_live\":%zu,\"init_calls\":%zu,\"dynamic_peak\":%zu,\"allocations\":%zu,\"animation_ms\":%.6f,\"layout_ms\":%.6f,\"pixels_ms\":%.6f",
        seed,digest,sizeof(*a),layout_size,sizeof(frame),init_live,init_calls,a->memory.peak,a->memory.calls,animation*1000,flow*1000,pixels*1000);
    credits_destroy(a); if (a->memory.live) return 2;
#ifdef PROFILE_COUNTS
    profile_report();
#endif
    puts("}"); free(a); return 0;
}
