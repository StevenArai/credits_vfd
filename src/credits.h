#ifndef CREDITS_H
#define CREDITS_H
#include "canvas.h"
#include "data.h"
#include "random.h"
#include "scheduler.h"
#include "weather.h"
typedef struct { const Text *words; const char *characters; int offset,line; const char *colour; } Typewriter;
#ifdef CREDITS_DIRECT60
/* Persistent water moves one column per update; noise drives both corruption layers. */
typedef struct { uint8_t cells[60*8]; int glitch; const char *colour; int phase; uint32_t noise; } Ocean;
#else
typedef struct { uint32_t cells[800]; int glitch; const char *colour; } Ocean;
#endif
typedef struct { const WordLine *line; const char *colour; const char *prefix; } HistoryEntry;
typedef struct { HistoryEntry *entries; int count,capacity,peak; } History;
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
    Weather weather[5];
    History history[3];
    int refresh, progress[SC_COUNT], access_counter, access_block;
    int beat_toggle[2][2];
    int jump;
    char *scratch;
    size_t scratch_capacity;
    unsigned frames, events_executed;
    void (*trace_event)(void *context,int beat,int index);
    void *trace_context;
#ifdef CREDITS_DIRECT60
    int draw_scene,draw_generator; /* Native text region selected by the scene. */
#endif
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
#ifdef CREDITS_DIRECT60
void credits_ocean_render(Credits *a,Ocean *o);
#endif
void credits_type_words(Credits *a,Typewriter *t,int x,int y,int history);
void credits_write_history(Credits *a,int x,int y,int stop,int history);
void credits_history_destroy(Credits *a);
void credits_multiline(Credits *a,int x,int y,const char *text,const char *colour);
void credits_jump(Credits *a,int jump);
#endif
