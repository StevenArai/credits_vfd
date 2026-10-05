/* Native character coordinates. No 80x24 rendering or post-layout pass. */
#include "credits.h"
#include "colours.h"
#include "math_lookup.h"
#include <stdio.h>
#include <string.h>
static void ui(Credits *a,int part,int title) {
    switch (part) {
    case 0: canvas_string(&a->canvas,2,1,"animation | plaaosert",CYAN BRIGHT); break;
    case 1: canvas_string(&a->canvas,2,2,"bgm       | Frums - Credits",CYAN BRIGHT); break;
    case 2: canvas_string(&a->canvas,2,4,"Modded by StevenArai",CYAN NORMAL); break;
    case 3: canvas_string(&a->canvas,2,5,"On the GU256X128C-3900 VFD Panel",CYAN NORMAL); break;
    case 4: canvas_string(&a->canvas,0,18,"------------------------------------------------------------",WHITE BRIGHT); break;
    case 5: canvas_string_cursor(&a->canvas,2,19,"> _ ",WHITE BRIGHT,2); break;
    case 6: credits_multiline(a,32,11,
        "----------------------------\n"
        "|                          |\n|                          |\n|                          |\n"
        "|                          |\n|                          |\n|                          |\n",WHITE BRIGHT); break;
    case 7: credits_multiline(a,34,12,"22.10.2009",YELLOW BRIGHT); break;
    case 8: credits_multiline(a,32,13,"----------------------------",WHITE BRIGHT); break;
    case 9: credits_multiline(a,34,14,title ? "43\xc2\xb0" "F      Wind 13 mph W \n                        ":"43\xc2\xb0" "F      Wind 13 mph W ",CYAN BRIGHT); break;
    case 10: credits_multiline(a,44,16,"Precipitation \n    20.3%     ",BLUE BRIGHT); break;
    case 11: credits_multiline(a,52,12,"Cloudy",YELLOW NORMAL); break;
    }
}
static void toggle(Credits *a,int scene,int g) {
    int state=scene-SC_BEATS;
    int x=scene==SC_BEATS ? 26:g==0 ? 26:30;
    int width=scene==SC_BEATS ? 8:4;
    char text[9]; memset(text,a->beat_toggle[state][g] ? (g==0 ? '@':'#'):'.',(size_t)width); text[width]=0;
    for (int y=7;y<11;y++) canvas_string(&a->canvas,x,y,text,g==0 ? BRIGHT YELLOW:BRIGHT GREEN);
    a->beat_toggle[state][g]=!a->beat_toggle[state][g];
}
static void date_ticker(Credits *a,int g,int b) {
    char text[32];
    switch (g) {
    case 0: credits_date(text,b,0); break;
    case 1: credits_date(text,512+(b-512)*2,0); break;
    case 2: strcpy(text,"??.??.????"); break;
    case 3: credits_date(text,random_int(&a->random,768+b*8,768+b*24),0); break;
    default: credits_date(text,1024+b*64-1024*32,0); break;
    }
    canvas_string(&a->canvas,34,12,text,YELLOW BRIGHT);
}
static void weather_scene(Credits *a,int g,int b) {
    switch (g) {
    case 0: credits_weather(a,&a->weather[b/64<2 ? b/64:2],b<128 ? 0:1,0); break;
    case 1: credits_weather(a,&a->weather[2],1,0); break;
    case 2: credits_weather(a,&a->weather[4],1,0); break;
    case 3: credits_weather(a,&a->weather[2],14,0); break;
    case 4: credits_weather(a,&a->weather[3],1,b>1080 ? (b-1080)*2.2:0); break;
    }
}
static void fatal_error(Credits *a) {
    char text[256]="The system has encountered a fatal error. Please wait.\n\n[ERR: 801]\n\n";
    size_t length=strlen(text);
    for (int y=0;y<4;y++) for (int x=0;x<8;x++) {
        unsigned value=(unsigned)random_below(&a->random,65536);
        int n=snprintf(text+length,sizeof(text)-length,"%04x%s",value,x<7 ? " ":y<3 ? "\n":"");
        if (n<0 || (size_t)n>=sizeof(text)-length) credits_fail("fatal error text capacity");
        length+=(size_t)n;
    }
    credits_multiline(a,2,1,text,BRIGHT RED);
}
static void loading(Credits *a,int scene,int g) {
    int fast=scene==SC_FASTLOAD;
    if (g==0) credits_multiline(a,13,7,"----------------------------------\n|                                |\n----------------------------------",WHITE BRIGHT);
    else if (g==1) credits_multiline(a,15,8,fast ? "        Please wait...        \n":"          Loading...          \n",BLACK BRIGHT);
    else if (g==2) a->progress[scene]+=fast ? random_int(&a->random,4,6):1;
    else if (!fast && g==3) a->progress[scene]+=random_int(&a->random,40,70);
    else if (g==(fast ? 3:4) || (!fast && g==5)) {
        int length=a->progress[scene];
        if (length<0) credits_fail("negative loading progress");
        char *text=credits_scratch(a,(size_t)length+1); memset(text,'#',(size_t)length); text[length]=0;
        if (!fast && g==5) corrupt_text(&a->random,text,400,"");
        if (length>32) text[32]=0; /* Keep progress inside the frame. */
        canvas_string(&a->canvas,15,8,text,fast ? GREEN BRIGHT:g==5 ? RED BRIGHT:YELLOW BRIGHT);
    } else if (g==6) credits_type_words(a,credits_typer(a,scene,g),6,11,0);
}
static void access_grid(Credits *a,int b,int randomize) {
    int limit=randomize ? math_access_limit(b):1;
    for (int block=0;block<4;block++) {
        for (int line=0;line<3;line++) {
            char text[58]; int offset=0;
            for (int x=0;x<6;x++) {
                int visible=!randomize || random_int(&a->random,0,limit)<4;
                char item[8];
                if (!visible) strcpy(item,"       ");
                else if (line==1) snprintf(item,sizeof(item),"PBS #%02d",block*6+x+1);
                else strcpy(item,line==0 ? "  ###  ":"Unknown");
                memcpy(text+offset,item,7); offset+=7;
                if (x<5) { memcpy(text+offset,"   ",3); offset+=3; }
            }
            text[offset]=0; canvas_string(&a->canvas,2,1+block*4+line,text,randomize ? BLACK BRIGHT:RED NORMAL);
        }
        if (block<3) canvas_string(&a->canvas,2,1+block*4+3,"",randomize ? BLACK BRIGHT:RED NORMAL);
    }
}
static void access_ping(Credits *a) {
    char text[64]; int block=a->access_block,counter=a->access_counter;
    int x=10*(block%6)+2,y=4*(block/6)+1;
    if (counter<8) {
        snprintf(text,sizeof(text),"  ###  \nPBS #%02d\nPing  %d",block+1,counter+1);
        credits_multiline(a,x,y,text,YELLOW NORMAL); a->access_counter++;
    } else {
        snprintf(text,sizeof(text),"  ...  \nPBS #%02d\n-------",block+1);
        credits_multiline(a,x,y,text,BLACK BRIGHT);
        snprintf(text,sizeof(text),"  ###  \nPBS #%02d\nPing  1",block+2);
        credits_multiline(a,10*((block+1)%6)+2,4*((block+1)/6)+1,text,YELLOW NORMAL);
        a->access_counter=1; a->access_block++;
    }
}
static void poweroff(Credits *a,int g,int b) {
    int adjusted=b-2+g,height=math_poweroff_height(adjusted);
    if (height<0 || height>20) credits_fail("poweroff height");
    const char *colours[]={BLACK NORMAL,BLACK BRIGHT,WHITE NORMAL,WHITE BRIGHT};
    uint32_t row[60]; for (int x=0;x<60;x++) row[x]='#';
    for (int y=0;y<height;y++) canvas_chars(&a->canvas,0,10-height/2+y,row,60,colours[g]);
}
static void noise(Credits *a,int b,int wipe) {
    int count=math_noise_count(b,wipe);
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
        canvas_char(&a->canvas,x*58/79,y*19/23,ch,colour);
    }
}
void credits_request_generator(void *context,int scene,int g,int beat) {
    Credits *a=context;
    a->draw_scene=scene; a->draw_generator=g;
    switch (scene) {
    case SC_CLEAR: break;
    case SC_WIPE: noise(a,beat,1); break;
    case SC_CLEAR_WIPE: noise(a,beat,0); break;
    case SC_OCEAN_B: case SC_OCEAN_C: case SC_OCEAN_D:
        if (!g) {
            Ocean *o=&a->oceans[scene-SC_OCEAN_B];
            if (scene==SC_OCEAN_D || beat%2==0) credits_ocean_update(a,o);
            else credits_ocean_render(a,o);
        }
        else if (scene==SC_OCEAN_D) fatal_error(a);
        else {
            int render=1;
            if (scene==SC_OCEAN_C) {
                render=math_ocean_text(beat,g);
            }
            credits_type_characters(a,credits_typer(a,scene,g),2,1,scene==SC_OCEAN_B ? BRIGHT WHITE:BRIGHT RED,render);
        }
        break;
    case SC_TYPEWRITE: credits_type_characters(a,credits_typer(a,scene,g),2,1,BRIGHT WHITE,1); break;
    case SC_TITLE: ui(a,g,1); break;
    case SC_REDRAW_UI: ui(a,g+4,0); break;
    case SC_BEATS: case SC_BEATS_LR: toggle(a,scene,g); break;
    case SC_DATES: date_ticker(a,g,beat); break;
    case SC_WEATHER: weather_scene(a,g,beat); break;
    case SC_FUNDING:
        if (!g) credits_type_words(a,credits_typer(a,scene,g),4,19,0);
        else credits_write_history(a,2,17,0,0);
        break;
    case SC_LOADINGBAR: case SC_FASTLOAD: loading(a,scene,g); break;
    case SC_ERROR:
        if (!g) credits_multiline(a,0,11,"------------------------------------------------------------\n\n\n\n\n\n\n\n  $ ",WHITE BRIGHT);
        else credits_multiline(a,2,1,"Automatic diagnosis unsuccessful. Please wait.\n> ",BLACK BRIGHT);
        break;
    case SC_FUNDINGX2:
        if (g==0) credits_type_words(a,credits_typer(a,scene,g),4,2,0);
        if (g==1) credits_type_words(a,credits_typer(a,scene,g),4,19,1);
        if (g==2) credits_write_history(a,2,18,12,1);
        if (g==3) credits_type_words(a,credits_typer(a,scene,g),8,5,2);
        break;
    case SC_ACCESSPOINTS:
        if (g<2) access_grid(a,beat,g==0);
        if (g==2) credits_multiline(a,2,17,"No access points are broadcasting.\nManual search in progress.\nLast search 27.02.2019 (532 days ago)",BLACK BRIGHT);
        if (g==3) access_ping(a);
        if (g==4) credits_multiline(a,12,9,"  @@@  \nPBS #14\n Active",GREEN BRIGHT);
        break;
    case SC_FDG_SINGLE:
        if (!g) credits_multiline(a,0,16,"------------------------------------------------------------\n  Sending > ",WHITE BRIGHT);
        else credits_type_words(a,credits_typer(a,scene,g),12,17,0);
        break;
    case SC_FDG_DOWN: {
        Typewriter *t=credits_typer(a,scene,g); credits_type_words(a,t,2,g ? 16:1,0); break;
    }
    case SC_POWEROFF: poweroff(a,g,beat); break;
    default: credits_fail("unknown scene request");
    }
}
