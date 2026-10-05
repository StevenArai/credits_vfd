#include "credits.h"
#include "colours.h"
#include <math.h>
#include <stdio.h>
#include <string.h>
static void init_typer(Credits *a,int scene,int g,const char *colour) {
    *credits_typer(a,scene,g)=(Typewriter){.colour=colour};
}
void credits_create_generator(void *context,int scene,int g,int beat) {
    Credits *a=context; (void)beat;
    switch (scene) {
    case SC_CLEAR: canvas_clear(&a->canvas); break;
    case SC_OCEAN_B: case SC_OCEAN_C: case SC_OCEAN_D:
        if (!g) {
            Ocean *o=&a->oceans[scene-SC_OCEAN_B]; credits_ocean_begin(a,o);
            o->glitch=scene==SC_OCEAN_B ? 1:scene==SC_OCEAN_C ? 16:100;
            o->colour=scene==SC_OCEAN_B ? BRIGHT BLUE:scene==SC_OCEAN_C ? BRIGHT BLACK:NORMAL MAGENTA;
        } else if (scene!=SC_OCEAN_D) init_typer(a,scene,g,NULL);
        break;
    case SC_TYPEWRITE: init_typer(a,scene,g,BRIGHT WHITE); break;
    case SC_FUNDING:
        if (!g) {
            init_typer(a,scene,g,WHITE BRIGHT);
#ifdef CREDITS_DIRECT60
            canvas60_clear_region(&a->canvas,(TextRegion){0,0,60,11});
            canvas60_clear_region(&a->canvas,(TextRegion){0,11,32,7});
#endif
        }
        break;
    case SC_BEATS: case SC_BEATS_LR: a->beat_toggle[scene-SC_BEATS][g]=1; break;
    case SC_LOADINGBAR:
        if (g<2) a->progress[scene]=0;
        if (g==6) init_typer(a,scene,g,BLACK BRIGHT);
        break;
    case SC_FASTLOAD: case SC_ERROR: if (g<2) a->progress[scene]=0; break;
    case SC_FUNDINGX2:
        if (g==0) init_typer(a,scene,g,RED NORMAL);
        if (g==1) init_typer(a,scene,g,CYAN BRIGHT);
        if (g==3) init_typer(a,scene,g,YELLOW BRIGHT);
        break;
    case SC_ACCESSPOINTS: if (g==3) { a->access_counter=0; a->access_block=0; } break;
    case SC_FDG_SINGLE: if (!g) a->progress[scene]=0; else init_typer(a,scene,g,YELLOW NORMAL); break;
    case SC_FDG_DOWN: init_typer(a,scene,g,YELLOW NORMAL); break;
    default: break; /* Remaining on_create callbacks are all no_create. */
    }
}
