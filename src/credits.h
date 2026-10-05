#ifndef CREDITS_H
#define CREDITS_H
#include "canvas.h"
#include "data.h"
#include "random.h"
#include "scheduler.h"
typedef struct { const Text *words; const char *characters; int offset,line; const char *colour; } Typewriter;
typedef struct { uint32_t cells[800]; int glitch; const char *colour; } Ocean;
typedef struct Credits {
    Memory memory;
    Canvas canvas;
    Random random;
    Scheduler scheduler;
    SceneState scenes[SC_COUNT];
    int active[SC_COUNT];
    Text texts[TEXT_COUNT];
    Typewriter typers[14];
    Ocean oceans[3];
    int ocean_time;
    char *scratch;
    size_t scratch_capacity;
    unsigned frames, events_executed;
    void (*trace_event)(void *context,int beat,int index);
    void *trace_context;
} Credits;
void credits_init(Credits *a,uint64_t seed);
void credits_next(Credits *a,int render);
void credits_destroy(Credits *a);
Typewriter *credits_typer(Credits *a,int scene,int generator);
char *credits_scratch(Credits *a,size_t size);
void credits_create_generator(void *context,int scene,int generator,int beat);
void credits_request_generator(void *context,int scene,int generator,int beat);
void credits_type_characters(Credits *a,Typewriter *t,int x,int y,const char *colour,int render);
void credits_ocean_begin(Credits *a,Ocean *o);
void credits_ocean_update(Credits *a,Ocean *o);
#endif
