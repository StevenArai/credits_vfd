#include "credits.h"
#include "framebuffer.h"
#include "colours.h"
#include "player_fixed.h"
#include <stdio.h>
#include <string.h>
#define CHECK(v) do { if (!(v)) { fprintf(stderr,"direct check line %d\n",__LINE__); return 1; } } while (0)
/* Full timeline: the Sending layer must not erase the access status footer. */
static int access_footer(void) {
    const char *status[]={"No access points are broadcasting.","Manual search in progress.","Last search 27.02.2019 (532 days ago)"};
    static Credits a;
    unsigned checked=0,dot_frames=0,changes=0,scrolls=0;
    for(int seed=0;seed<3;seed++) {
        credits_init(&a,seed==2 ? 42:(uint64_t)seed);
        /* Every complete Sending line must fit without scrolling or clipping. */
        const Text *sending=&a.texts[TEXT_FDG_SINGLE_0];
        for(int line=0;line<sending->line_count;line++) {
            const char *text=sending->lines[line].value; int visible=0;
            for(int i=0;text[i];i++) if(text[i]!='#' && text[i]!='~') visible++;
            CHECK(visible<=48);
        }
        uint32_t previous[48]={0};
        Canvas expected; canvas_init(&expected,&a.memory);
        for(int row=0;row<3;row++) canvas_string(&expected,2,13+row,status[row],BLACK BRIGHT);
        Framebuffer target,actual; framebuffer_render60(&target,expected.cells,1);
        for(int beat=0;beat<5500;beat++) {
            credits_next(&a,1);
            if(beat<4460) continue;
            if(beat==4460) scrolls=a.canvas.scrolled_rows;
            CHECK(a.canvas.scrolled_rows==scrolls);
            for(int row=0;row<3;row++) for(size_t x=0;status[row][x];x++) {
                if(a.canvas.cells[(13+row)*60+2+x]!=expected.cells[(13+row)*60+2+x]) {
                    fprintf(stderr,"status overwritten: seed=%d beat=%d x=%zu row=%d actual=%u expected=%u\n",seed,beat,x+2,row+13,a.canvas.cells[(13+row)*60+2+x],expected.cells[(13+row)*60+2+x]);
                    return 1;
                }
            }
            framebuffer_render60(&actual,a.canvas.cells,1);
            for(int y=82;y<100;y++) for(int x=0;x<256;x++)
                CHECK(framebuffer_pixel(&actual,x,y)==framebuffer_pixel(&target,x,y));
            /* Three rows of six PBS tiles, with blank rows between sections. */
            if(beat>=4480) for(int block=0;block<18;block++) {
                char label[8]; snprintf(label,sizeof(label),"PBS #%02d",block+1);
                for(int i=0;i<7;i++) CHECK((a.canvas.cells[(2+4*(block/6))*60+2+10*(block%6)+i]&65535)==(unsigned char)label[i]);
            }
            if(beat>=5428) {
                CHECK((a.canvas.cells[9*60+14]&65535)=='@');
                CHECK((a.canvas.cells[11*60+13]&65535)=='A');
            }
            const int gaps[]={0,4,8,12,16,19};
            for(size_t i=0;i<sizeof(gaps)/sizeof(gaps[0]);i++) for(int x=0;x<60;x++)
                CHECK((a.canvas.cells[gaps[i]*60+x]&65535)==' ');
            for(int row=0;row<20;row++) {
                char line[61];
                for(int x=0;x<60;x++) line[x]=(char)(a.canvas.cells[row*60+x]&65535);
                line[60]=0;
                for(int id=19;id<=24;id++) {
                    char label[8]; snprintf(label,sizeof(label),"PBS #%02d",id);
                    CHECK(!strstr(line,label));
                }
            }
            checked++;
            if(beat>=4460) {
                const char *label="Sending > ";
                for(size_t x=0;label[x];x++) CHECK((a.canvas.cells[18*60+2+x]&65535)==(unsigned char)label[x]);
                uint32_t now[48]; int dot=0;
                for(int x=0;x<48;x++) {
                    now[x]=a.canvas.cells[18*60+12+x];
                    dot|=(now[x]&65535)=='.';
                }
                dot_frames+=dot; changes+=memcmp(previous,now,sizeof(now))!=0;
                memcpy(previous,now,sizeof(now));
            }
            CHECK(!a.canvas.clipped_cells);
        }
        credits_destroy(&a); CHECK(!a.memory.live);
    }
    CHECK(dot_frames>0 && changes>10);
    printf("access footer: %u frames preserve text/pixels; %u dot frames, %u animation changes\n",checked,dot_frames,changes);
    return 0;
}
int main(void) {
    CHECK(!access_footer());
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
