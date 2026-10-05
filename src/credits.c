#include "credits.h"
#include "colours.h"
#include <math.h>
#include <string.h>
enum EventKind { EV_SWAP,EV_LAYER,EV_REMOVE,EV_HISTORY_RESET,EV_REFRESH,EV_TEXT,EV_OFFSET,EV_LINENO,EV_OCEAN_GLITCH,EV_COLOUR,EV_RANDOM_COLOUR };
typedef struct { enum EventKind kind; int scene,generator,number; const char *text; } EventAction;
typedef struct { int beat,index,first,count; } TimelineEvent;
#include "events_generated.inc"

Typewriter *credits_typer(Credits *a,int scene,int g) {
    int i=-1;
    switch (scene) {
    case SC_OCEAN_B: if (g==1) i=0; break;
    case SC_OCEAN_C: if (g>=1 && g<=4) i=g; break;
    case SC_TYPEWRITE: if (g==0) i=5; break;
    case SC_FUNDING: if (g==0) i=6; break;
    case SC_LOADINGBAR: if (g==6) i=7; break;
    case SC_FUNDINGX2: if (g==0) i=8; else if (g==1) i=9; else if (g==3) i=10; break;
    case SC_FDG_SINGLE: if (g==1) i=11; break;
    case SC_FDG_DOWN: if (g>=0 && g<=1) i=12+g; break;
    default: break;
    }
    if (i<0) credits_fail("generator has no typewriter state");
    return &a->typers[i];
}
char *credits_scratch(Credits *a,size_t size) {
    if (size>a->scratch_capacity) {
        size_t cap=size+size/2+32;
        a->scratch=mem_resize(&a->memory,a->scratch,a->scratch_capacity,cap);
        a->scratch_capacity=cap;
    }
    return a->scratch;
}
static void apply_event(Credits *a,const EventAction *e) {
    switch (e->kind) {
    case EV_SWAP: scheduler_start(&a->scheduler,e->scene,e->number,0); break;
    case EV_LAYER: scheduler_start(&a->scheduler,e->scene,e->number,1); break;
    case EV_REMOVE: scheduler_remove(&a->scheduler,e->scene); break;
    case EV_TEXT: {
        Typewriter *t=credits_typer(a,e->scene,e->generator);
        if (e->number>=0) {
            t->words=&a->texts[e->number]; t->characters=t->words->raw;
        } else if (e->number==-1) { t->characters=e->text; t->words=NULL; }
        else {
            static WordLine lines[]={{"",0,1},{"",0,1}};
            static const Text empty={"",0,2,1,lines};
            t->words=&empty; t->characters=empty.raw;
        }
        break;
    }
    case EV_OFFSET: credits_typer(a,e->scene,e->generator)->offset=e->number; break;
    case EV_LINENO: credits_typer(a,e->scene,e->generator)->line=e->number; break;
    case EV_OCEAN_GLITCH: a->oceans[e->scene-SC_OCEAN_B].glitch=e->number; break;
    case EV_COLOUR: a->oceans[e->scene-SC_OCEAN_B].colour=e->text; break;
    case EV_RANDOM_COLOUR: a->oceans[e->scene-SC_OCEAN_B].colour=random_below(&a->random,2)==0 ? BRIGHT BLACK:NORMAL BLACK; break;
    case EV_HISTORY_RESET: a->history[0].count=0; break;
    case EV_REFRESH: a->refresh=e->number; break;
    }
}
static void timeline(void *context,int beat) {
    Credits *a=context;
    for (int i=0;i<TIMELINE_EVENTS;i++) {
        const TimelineEvent *e=&timeline_events[i];
        if (e->beat!=beat) continue;
        if (a->trace_event) a->trace_event(a->trace_context,beat,e->index);
        a->events_executed++;
        for (int j=0;j<e->count;j++) apply_event(a,&event_actions[e->first+j]);
    }
    if (a->jump==3 && (beat==1849 || beat==1860)) {
        if (a->trace_event) a->trace_event(a->trace_context,beat,0);
        a->events_executed++;
        if (beat==1849) scheduler_start(&a->scheduler,SC_REDRAW_UI,0,1);
        else scheduler_remove(&a->scheduler,SC_REDRAW_UI);
    }
}
static void no_clear(void *context,int scene,int generator,int beat) {
    (void)context;(void)scene;(void)generator;(void)beat;
    /* All 79 source generators currently use no_request as request_clear. */
}
#ifdef CREDITS_DIRECT60
static int native_scene_due(int scene,int generator,int beat) {
    /* Redraw transient sea noise every tick; motion retains its own cadence. */
    if (!generator && (scene==SC_OCEAN_B || scene==SC_OCEAN_C)) return 1;
    return scene_due(scene,generator,beat);
}
#endif
void credits_init(Credits *a,uint64_t seed) {
    memset(a,0,sizeof(*a));
    canvas_init(&a->canvas,&a->memory);
    random_seed(&a->random,seed);
    a->ocean_time=(int)floor(random_unit(&a->random)*2000);
    data_init(a->texts,&a->memory,&a->random);
    weather_init(a->weather);
    scheduler_init(&a->scheduler,scene_definitions,a->scenes,SC_COUNT,a->active,SC_COUNT);
    a->scheduler.context=a; a->scheduler.condition=scene_due;
#ifdef CREDITS_DIRECT60
    a->scheduler.condition=native_scene_due;
#endif
    a->scheduler.create=credits_create_generator; a->scheduler.clear=no_clear;
    a->scheduler.request=credits_request_generator; a->scheduler.events=timeline;
}
void credits_jump(Credits *a,int jump) {
    static const int amounts[]={0,1000,1770,3040,3780,5420};
    if (jump<1 || jump>6) credits_fail("startup jump must be 1..6");
    if (a->frames || a->scheduler.beat!=-1) credits_fail("jump only valid before playback");
    a->jump=jump; a->scheduler.beat+=amounts[jump-1];
}
void credits_next(Credits *a,int render) {
    scheduler_next(&a->scheduler,render);
    canvas_render(&a->canvas); a->frames++;
}
void credits_destroy(Credits *a) {
    canvas_destroy(&a->canvas);
    data_destroy(a->texts,&a->memory);
    credits_history_destroy(a);
    mem_free(&a->memory,a->scratch,a->scratch_capacity);
    a->scratch=NULL; a->scratch_capacity=0;
}
