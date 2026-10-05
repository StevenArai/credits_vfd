#include "credits.h"
#include "framebuffer.h"
#include "colours.h"
#include "player_fixed.h"
#include <stdio.h>
#include <string.h>
#define CHECK(v) do { if (!(v)) { fprintf(stderr,"direct check line %d\n",__LINE__); return 1; } } while (0)
int main(void) {
    Memory m={0};
    struct { uint32_t before; Canvas c; uint32_t after; } guarded={.before=123,.after=456};
    Canvas *c=&guarded.c; canvas_init(c,&m);
    CHECK(sizeof(c->cells)==4800);
    canvas_string_cursor(c,57,19,"\xc2\xb0__",WHITE BRIGHT,-1);
    CHECK((c->cells[1197]&65535)==176 && !(c->cells[1198]&CELL_CURSOR) && (c->cells[1199]&CELL_CURSOR));
    Framebuffer fb; framebuffer_render60(&fb,c->cells,1);
    for (int y=118;y<124;y++) for (int x=244;x<248;x++) CHECK(framebuffer_pixel(&fb,x,y));
    canvas_string(c,59,19,"_",WHITE BRIGHT); CHECK(!(c->cells[1199]&CELL_CURSOR));
    canvas_string(c,60,20,"AB",WHITE BRIGHT); CHECK(c->clipped_cells==2);
    TextFlow f=canvas60_flow(c,(TextRegion){2,3,5,2},1);
    canvas60_line(&f,"AB CD EF",WHITE BRIGHT,0);
    CHECK((c->cells[3*60+2]&65535)=='A' && (c->cells[4*60+2]&65535)=='E');
    canvas60_newline(&f); canvas60_line(&f,"GH",GREEN NORMAL,0);
    CHECK((c->cells[3*60+2]&65535)=='E' && (c->cells[4*60+2]&65535)=='G');
    CHECK((c->cells[1199]&65535)=='_');
    canvas_clear(c); CHECK(!(c->cells[1199]&CELL_CURSOR));
    CHECK(guarded.before==123 && guarded.after==456 && !m.calls && !m.live);
    static Credits a; credits_init(&a,1);
    for (int beat=0;beat<=1843;beat++) {
        credits_next(&a,1);
        if (beat==1600) {
            const char *labels[]={"Modded by StevenArai","On the GU256X128C-3900 VFD Panel"};
            for (int row=0;row<2;row++) for (size_t i=0;labels[row][i];i++)
                CHECK((a.canvas.cells[(4+row)*60+2+i]&65535)==(unsigned char)labels[row][i]);
            CHECK(a.canvas.cells[19*60+4]&CELL_CURSOR);
            for (int y=7;y<11;y++) for (int x=26;x<34;x++) CHECK((a.canvas.cells[y*60+x]&65535)!=' ');
        }
    }
    credits_destroy(&a);
    credits_init(&a,1); FixedPlayer p; fixed_player_init(&p,&a,1,0);
    canvas_string_cursor(&a.canvas,0,0,"_",WHITE BRIGHT,0);
    fixed_player_step(&p,FIXED_SECOND,0,0);
    for (int i=0;i<1200;i++) CHECK(a.canvas.cells[i]==cell_pack(' ',39,49,0));
    credits_destroy(&a); CHECK(!a.memory.live);
    for (int scene=0;scene<SC_COUNT;scene++) {
        credits_init(&a,42); a.scheduler.events=NULL;
        scheduler_start(&a.scheduler,scene,0,0);
        for (int frame=0;frame<24;frame++) credits_next(&a,1);
        CHECK(!a.canvas.clipped_cells);
        credits_destroy(&a); CHECK(!a.memory.live);
    }
    puts("native char_buf bounds, wrap, scroll, cursor, title and stop passed; zero canvas allocations");
    return 0;
}
