#include "credits.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int main(int argc,char **argv) {
    if (argc!=6) return 2;
    int scene=-1;
    for (int i=0;i<SC_COUNT;i++) if (!strcmp(argv[1],scene_definitions[i].name)) scene=i;
    if (scene<0) return 2;
    Credits *a=malloc(sizeof(*a)); if (!a) return 2;
    credits_init(a,strtoull(argv[2],NULL,10)); a->scheduler.events=NULL;
    FILE *out=fopen(argv[5],"wb"); if (!out) return 2;
    scheduler_start(&a->scheduler,scene,atoi(argv[3]),0); canvas_render(&a->canvas);
    for (int i=0;i<atoi(argv[4]);i++) {
        if (i) credits_next(a,1);
        int32_t frame=i; fwrite(&frame,4,1,out); fwrite(a->canvas.cells,4,CANVAS_CELLS,out);
    }
    fclose(out); credits_destroy(a); size_t live=a->memory.live; free(a); return live ? 1:0;
}
