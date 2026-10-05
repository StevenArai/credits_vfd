#include "layout60.h"
#include "framebuffer.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define CHECK(c) do { if (!(c)) { fprintf(stderr,"layout check line %d\n",__LINE__); return 1; } } while (0)
int main(int argc,char **argv) {
    Credits *a=malloc(sizeof(*a)); CHECK(a);
    Layout60 layout; Framebuffer f;
    /* Last cell fits; all 1px inter-character/inter-line gutters stay dark. */
    for (int i=0;i<1200;i++) layout.cells[i]=cell_pack('M',39,49,0);
    framebuffer_render60(&f,layout.cells,1);
    for (int y=0;y<128;y++) for (int x=0;x<256;x++) {
        if (x<8 || x>=247 || y<4 || y>=123 || (x-8)%4==3 || (y-4)%6==5)
            CHECK(!framebuffer_pixel(&f,x,y));
    }
    credits_init(a,1);
    for (int i=0;i<1920;i++) a->canvas.cells[i]=cell_pack(' ',39,49,0);
    a->scheduler.count=0;
    const char *word="HELLO ";
    for (int i=0;i<6;i++) a->canvas.cells[i]=cell_pack((unsigned char)word[i],39,49,0);
    for (int i=6;i<61;i++) a->canvas.cells[i]=cell_pack('A',39,49,0);
    layout60_render(&layout,a);
    CHECK((layout.cells[0]&65535)=='H' && (layout.cells[60]&65535)=='A');
    CHECK((layout.cells[60+54]&65535)=='A' && !layout.scrolled_rows);
    a->scheduler.count=1; a->scheduler.active[0]=SC_OCEAN_B;
    a->canvas.cells[1919]=cell_pack('Z',39,49,0);
    layout60_render(&layout,a); CHECK((layout.cells[1199]&65535)=='Z');
    a->scheduler.active[0]=SC_FUNDING;
    a->canvas.cells[20*80+79]=cell_pack('W',39,49,0);
    layout60_render(&layout,a); CHECK((layout.cells[17*60+59]&65535)=='W');
    credits_destroy(a);
    /* Real title timeline: verify all 32 block cells through both blink modes,
       and labels only once the original scene has revealed each line. */
    credits_init(a,1);
    unsigned labels_seen=0;
    for (int beat=0;beat<=1843;beat++) {
        credits_next(a,1);
        if (beat<1080) continue;
        layout60_render(&layout,a);
        for (int y=0;y<4;y++) for (int x=0;x<8;x++)
            CHECK(layout.cells[(7+y)*60+26+x]==a->canvas.cells[(11+y)*80+36+x]);
        const char *old[]={"running pure Python 3.6","in the command line"};
        const char *updated[]={"Modded by StevenArai","On the GU256X128C-3900 VFD Panel"};
        for (int line=0;line<2;line++) {
            int row=4+line,visible=1;
            for (size_t i=0;old[line][i];i++)
                if ((a->canvas.cells[row*80+2+i]&65535)!=(unsigned char)old[line][i]) visible=0;
            if (visible) {
                labels_seen|=1u<<line;
                for (size_t i=0;updated[line][i];i++)
                    CHECK((layout.cells[row*60+2+i]&65535)==(unsigned char)updated[line][i]);
                CHECK((layout.cells[row*60+2+strlen(updated[line])]&65535)==' ');
            }
        }
    }
    CHECK(labels_seen==3); credits_destroy(a);
    unsigned peak=0; FILE *previews=argc==2 ? fopen(argv[1],"wb"):NULL;
    for (int seed=0;seed<3;seed++) {
        credits_init(a,(uint64_t)seed);
        for (int beat=0;beat<=6508;beat++) {
            credits_next(a,1);
            Random before=a->random;
            layout60_render(&layout,a);
            CHECK(!memcmp(&before,&a->random,sizeof(before)));
            if (layout.scrolled_rows>peak) peak=layout.scrolled_rows;
            framebuffer_render60(&f,layout.cells,1);
            if (previews && seed==1 && (beat==250 || beat==1600 || beat==2200 || beat==3400 || beat==4200 || beat==5600)) {
                fwrite(&beat,sizeof(beat),1,previews); fwrite(f.bits,1,sizeof(f.bits),previews);
            }
        }
        credits_destroy(a); CHECK(a->memory.live==0);
    }
    if (previews) fclose(previews);
    free(a);
    printf("19527 layout frames; max scrolled rows=%u; layout=%zu bytes; gutters and bounds passed\n",peak,sizeof(layout));
    return 0;
}
