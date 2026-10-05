#include "scheduler.h"
#include <stdio.h>
static void create(void *ctx,int scene,int gen,int beat) { (void)ctx;(void)beat;printf("create %d %d\n",scene,gen); }
static void clear(void *ctx,int scene,int gen,int beat) { (void)ctx;printf("clear %d %d %d\n",scene,gen,beat); }
static void request(void *ctx,int scene,int gen,int beat) { (void)ctx;printf("request %d %d %d\n",scene,gen,beat); }
static int condition(int scene,int gen,int beat) { (void)scene; return !gen || beat%2==0; }
static void events(void *ctx,int beat) {
    Scheduler *s=ctx;
    printf("event %d\n",beat);
    if (beat==0) { scheduler_start(s,0,0,0); scheduler_start(s,1,2,1); scheduler_start(s,0,1,0); }
    if (beat==2) scheduler_remove(s,0);
    if (beat==3) scheduler_start(s,0,0,1);
}
int main(void) {
    const int starts[]={0,2};
    const SceneDefinition defs[]={{"a",2,starts},{"b",2,starts}};
    SceneState states[2]; int active[4]; Scheduler s;
    scheduler_init(&s,defs,states,2,active,4);
    s.context=&s; s.condition=condition; s.create=create; s.clear=clear; s.request=request; s.events=events;
    for (int i=0;i<8;i++) scheduler_next(&s,i!=2 && i!=5);
    for (int i=0;i<s.count;i++) printf("active %d %d %d\n",s.active[i],s.states[s.active[i]].start,s.states[s.active[i]].internal);
    return 0;
}
