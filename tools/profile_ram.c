/* Diagnostic executable only; these counters/metadata are not linked into the library. */
#include "animator.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define scene_due ram_scene_due
#define scene_definitions ram_scene_definitions
#include "data_generated.inc"
#undef scene_due
#undef scene_definitions

static size_t scratch_peak;
void ram_scratch_request(size_t bytes) { if(bytes>scratch_peak) scratch_peak=bytes; }
static unsigned long long digest;
static void hash(const void *data,size_t n) {
    const unsigned char *p=data;
    for(size_t i=0;i<n;i++) digest=(digest^p[i])*1099511628211ULL;
}
int main(int argc,char **argv) {
    static Credits a;
    Framebuffer fb;
    int seed=argc>1 ? atoi(argv[1]):1,jump=argc>2 ? atoi(argv[2]):1;
    credits_init(&a,(uint64_t)seed); credits_jump(&a,jump);
    size_t reservations=a.memory.calls,used=a.memory.used;
    printf("{\"seed\":%d,\"jump\":%d,\"texts\":[",seed,jump);
    for(int i=0;i<TEXT_COUNT;i++) {
        const Text *t=&a.texts[i]; const TextDefinition *d=&text_definitions[i];
        size_t mutable_segment_bytes=0;
        for(int j=0;j<d->count;j++) if(d->segments[j].chance)
            mutable_segment_bytes+=strlen(d->segments[j].text);
        printf("%s{\"name\":\"%s\",\"raw_bytes\":%d,\"lines\":%d,\"randomized_segment_bytes\":%zu,\"raw_offset\":%zu,\"lines_offset\":%zu}",
            i ? ",":"",d->name,t->bytes+1,t->line_count,mutable_segment_bytes,
            (size_t)((unsigned char *)t->raw-a.memory.arena),
            t->lines ? (size_t)((unsigned char *)t->lines-a.memory.arena):0);
    }
    printf("],\"workspace_capacity\":%zu,\"workspace_used\":%zu,\"reserved_payload\":%zu,\"reservations\":%zu,\"scratch_capacity\":%zu,\"history_capacity\":[%d,%d,%d]",
        a.memory.capacity,used,a.memory.live,reservations,a.scratch_capacity,
        a.history[0].capacity,a.history[1].capacity,a.history[2].capacity);
    digest=14695981039346656037ULL;
    int concurrent_peak=0,concurrent_beat=-1,history_at_peak[3]={0};
    while(a.scheduler.beat<6508) {
        credits_next(&a,1); framebuffer_render60(&fb,a.canvas.cells,1);
        hash(a.canvas.cells,sizeof(a.canvas.cells)); hash(fb.bits,sizeof(fb.bits));
        hash(&a.random,sizeof(a.random));
        int sum=0;
        for(int i=0;i<3;i++) sum+=a.history[i].count;
        if(sum>concurrent_peak) {
            concurrent_peak=sum; concurrent_beat=a.scheduler.beat;
            for(int i=0;i<3;i++) history_at_peak[i]=a.history[i].count;
        }
        if(a.memory.calls!=reservations || a.memory.used!=used) return 2;
    }
    printf(",\"digest\":\"%016llx\",\"frames\":%u,\"scratch_requested_peak\":%zu,\"history_peak\":[%d,%d,%d],\"history_concurrent_peak\":%d,\"history_concurrent_beat\":%d,\"history_at_concurrent_peak\":[%d,%d,%d]",
        digest,a.frames,scratch_peak,a.history[0].peak,a.history[1].peak,a.history[2].peak,
        concurrent_peak,concurrent_beat,history_at_peak[0],history_at_peak[1],history_at_peak[2]);
    credits_destroy(&a);
    printf(",\"live_after_destroy\":%zu}\n",a.memory.live);
    return a.memory.live!=0;
}
