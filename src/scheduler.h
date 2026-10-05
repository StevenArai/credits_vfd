#ifndef CREDITS_SCHEDULER_H
#define CREDITS_SCHEDULER_H
#include <stddef.h>
typedef int (*Condition)(int scene, int generator, int beat);
typedef void (*GeneratorAction)(void *context, int scene, int generator, int beat);
typedef struct { const char *name; int count; const int *starts; } SceneDefinition;
typedef struct { int start, internal; } SceneState;
typedef struct {
    const SceneDefinition *definitions;
    SceneState *states;
    int scene_count;
    int *active;
    int count, capacity, beat;
    void *context;
    Condition condition;
    GeneratorAction create, clear, request;
    void (*events)(void *, int);
} Scheduler;
void scheduler_init(Scheduler *s, const SceneDefinition *defs, SceneState *states,
                    int scene_count, int *active, int active_capacity);
void scheduler_start(Scheduler *s, int scene, int at, int layer);
void scheduler_remove(Scheduler *s, int scene);
void scheduler_next(Scheduler *s, int render);
void scheduler_frame(Scheduler *s, int scene, int render);
#endif
