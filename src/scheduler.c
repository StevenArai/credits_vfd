#include "scheduler.h"
#include "memory.h"
#include <string.h>
void scheduler_init(Scheduler *s, const SceneDefinition *defs, SceneState *states,
                    int scene_count, int *active, int active_capacity) {
    memset(s,0,sizeof(*s));
    s->definitions=defs; s->states=states; s->scene_count=scene_count;
    s->active=active; s->capacity=active_capacity; s->beat=-1;
    memset(states,0,(size_t)scene_count*sizeof(*states));
}
void scheduler_frame(Scheduler *s,int scene,int render) {
    SceneState *state=&s->states[scene];
    const SceneDefinition *def=&s->definitions[scene];
    int beat=state->internal;
    if (render) for (int g=0;g<def->count;g++) {
        if (beat < def->starts[g] || !s->condition(scene,g,beat)) continue;
        if (beat != state->start && beat != def->starts[g]) s->clear(s->context,scene,g,beat-1);
        s->request(s->context,scene,g,beat);
    }
    state->internal++;
}
void scheduler_start(Scheduler *s,int scene,int at,int layer) {
    if (scene<0 || scene>=s->scene_count) credits_fail("unknown scene");
    if (layer || !s->count) {
        if (s->count==s->capacity) credits_fail("active scene capacity exceeded");
        s->active[s->count++]=scene;
    } else s->active[0]=scene;
    const SceneDefinition *def=&s->definitions[scene];
    for (int g=0;g<def->count;g++) s->create(s->context,scene,g,0);
    s->states[scene].start=at; s->states[scene].internal=at;
    scheduler_frame(s,scene,1);
}
void scheduler_remove(Scheduler *s,int scene) {
    for (int i=0;i<s->count;i++) if (s->active[i]==scene) {
        memmove(s->active+i,s->active+i+1,(size_t)(s->count-i-1)*sizeof(int)); s->count--; break;
    }
}
void scheduler_next(Scheduler *s,int render) {
    for (int i=0;i<s->count;i++) scheduler_frame(s,s->active[i],render);
    s->beat++;
    if (s->events) s->events(s->context,s->beat);
}
