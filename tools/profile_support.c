/* Compiled only by profile_core.py, against copied/instrumented sources. */
#include "profile.h"
#include <stdio.h>
#include <stdlib.h>
static const char *names[]={PROFILE_NAMES};
static const char *libnames[]={PROFILE_LIBNAMES};
unsigned long long profile_libcalls[sizeof(libnames)/sizeof(*libnames)];
static const char *sites[]={PROFILE_SITES};
static const struct { size_t host,arm; } scales[]={PROFILE_SCALES};
unsigned long long profile_calls[sizeof(names)/sizeof(*names)];
typedef struct { void *ptr; size_t size,arm_size; int site; } Allocation;
typedef struct { size_t calls,initial,grown,total,live,peak,at_peak; } Site;
static Allocation allocations[4096];
static Site stats[sizeof(sites)/sizeof(*sites)];
static size_t live,peak;
static size_t arm_live,arm_peak;
static int arm_peak_beat;
static int peak_beat;
int profile_beat=-1;
static const char *hotnames[]={PROFILE_HOTNAMES};
static struct { unsigned long long total,initial,current,peak; int last,peak_beat; } hotstats[sizeof(hotnames)/sizeof(*hotnames)];
void profile_hit(int site) {
    if (hotstats[site].last!=profile_beat) {
        hotstats[site].last=profile_beat; hotstats[site].current=0;
    }
    hotstats[site].total++;
    if (profile_beat<0) { hotstats[site].initial++; return; }
    hotstats[site].current++;
    if (hotstats[site].current>hotstats[site].peak) {
        hotstats[site].peak=hotstats[site].current;
        hotstats[site].peak_beat=profile_beat;
    }
}
static int find(void *p) {
    for (int i=0;i<4096;i++) if (allocations[i].ptr==p) return i;
    fputs("profile allocation table exhausted or unknown pointer\n",stderr); abort();
}
void *profile_resize(int site,Memory *m,void *p,size_t old,size_t size) {
    int index=find(p);
    if (p) {
        if (allocations[index].size!=old) abort();
        stats[allocations[index].site].live-=old;
        arm_live-=allocations[index].arm_size;
    }
    if (size%scales[site].host) abort();
    size_t arm_size=size/scales[site].host*scales[site].arm;
    arm_live+=arm_size;
    if (arm_live>arm_peak) { arm_peak=arm_live; arm_peak_beat=profile_beat; }
    Site *s=&stats[site]; s->calls++; s->initial+=p==NULL; s->grown+=p!=NULL;
    s->total+=size; s->live+=size;
    if (s->live>s->peak) s->peak=s->live;
    live=live-old+size;
    if (live>peak) {
        peak=live; peak_beat=profile_beat;
        for (size_t i=0;i<sizeof(stats)/sizeof(*stats);i++) stats[i].at_peak=stats[i].live;
    }
    p=mem_resize(m,p,old,size);
    allocations[index]=(Allocation){p,size,arm_size,site}; return p;
}
void profile_free(Memory *m,void *p,size_t size) {
    if (p) {
        int index=find(p); if (allocations[index].size!=size) abort();
        stats[allocations[index].site].live-=size; live-=size;
        arm_live-=allocations[index].arm_size;
        allocations[index]=(Allocation){0};
    } else if (size) abort();
    mem_free(m,p,size);
}
void profile_report(void) {
    if (arm_live) abort();
    printf(",\"arm_projected_heap_peak\":%zu,\"arm_projected_peak_beat\":%d",arm_peak,arm_peak_beat);
    printf(",\"allocation_peak_beat\":%d,\"tracked_live_after_destroy\":%zu,\"sites\":[",peak_beat,live);
    for (size_t i=0;i<sizeof(stats)/sizeof(*stats);i++) {
        Site *s=&stats[i];
        printf("%s{\"site\":\"%s\",\"calls\":%zu,\"initial\":%zu,\"realloc\":%zu,\"requested_bytes\":%zu,\"peak\":%zu,\"at_global_peak\":%zu}",
            i ? ",":"",sites[i],s->calls,s->initial,s->grown,s->total,s->peak,s->at_peak);
    }
    printf("],\"calls\":{");
    for (size_t i=0;i<sizeof(names)/sizeof(*names);i++)
        printf("%s\"%s\":%llu",i ? ",":"",names[i],profile_calls[i]);
    printf("},\"library_calls\":{");
    for (size_t i=0;i<sizeof(libnames)/sizeof(*libnames);i++)
        printf("%s\"%s\":%llu",i ? ",":"",libnames[i],profile_libcalls[i]);
    printf("},\"hotspots\":[");
    for (size_t i=0;i<sizeof(hotnames)/sizeof(*hotnames);i++)
        printf("%s{\"site\":\"%s\",\"total\":%llu,\"initial\":%llu,\"max_per_frame\":%llu,\"peak_frame\":%d}",
            i ? ",":"",hotnames[i],hotstats[i].total,hotstats[i].initial,hotstats[i].peak,hotstats[i].peak_beat);
    printf("]");
}
