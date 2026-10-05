#include "credits.h"
#include "colours.h"
#include <math.h>
void credits_create_generator(void *context,int scene,int g,int beat) {
    Credits *a=context; (void)beat;
    switch (scene) {
    case SC_CLEAR: canvas_clear(&a->canvas); break;
    case SC_OCEAN_B:
        if (!g) {
            Ocean *o=&a->oceans[0]; credits_ocean_begin(a,o); o->glitch=1; o->colour=BRIGHT BLUE;
        } else *credits_typer(a,scene,g)=(Typewriter){0};
        break;
    case SC_WIPE: case SC_CLEAR_WIPE: break;
    default: credits_fail("scene not implemented in P2");
    }
}
static void noise(Credits *a,int b,int wipe) {
    int count=(int)pow(b,wipe ? 1.4:2.2);
    int white=b,normal=70-b,black=4*(40-b);
    if (normal<0) normal=0;
    if (black<0) black=0;
    static const char *chars[]={"##","@@","  "};
    for (int n=0;n<count;n++) {
        int x=random_int(&a->random,0,79),y=random_int(&a->random,0,23);
        const char *ch=chars[wipe ? random_below(&a->random,3):2];
        /* choice of a one-element tuple still consumes rejection-sampling bits. */
        if (!wipe) (void)random_below(&a->random,1);
        uint64_t selection=random_below(&a->random,wipe ? (uint64_t)(white+normal+black):1);
        const char *colour=WHITE BRIGHT;
        if (wipe) colour=selection<(uint64_t)white ? BRIGHT WHITE:selection<(uint64_t)(white+normal) ? NORMAL WHITE:BRIGHT BLACK;
        canvas_char(&a->canvas,x,y,ch,colour);
    }
}
void credits_request_generator(void *context,int scene,int g,int beat) {
    Credits *a=context;
    switch (scene) {
    case SC_CLEAR: break;
    case SC_WIPE: noise(a,beat,1); break;
    case SC_CLEAR_WIPE: noise(a,beat,0); break;
    case SC_OCEAN_B:
        if (!g) credits_ocean_update(a,&a->oceans[0]);
        else credits_type_characters(a,credits_typer(a,scene,g),1,1,BRIGHT WHITE,1);
        break;
    default: credits_fail("scene request not implemented in P2");
    }
}
