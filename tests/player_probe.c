#include "player.h"
#include <stdio.h>
#include <stdlib.h>
int main(int argc,char **argv) {
    if (argc!=6) return 2;
    FILE *input=fopen(argv[3],"r"),*frames=fopen(argv[4],"wb"),*states=fopen(argv[5],"w");
    if (!input || !frames || !states) return 2;
    Credits *a=malloc(sizeof(*a)); if (!a) return 2;
    credits_init(a,strtoull(argv[1],NULL,10)); Player p; player_init(&p,a,atoi(argv[2]),0);
    double now; unsigned keys; int active,index=0;
    while (fscanf(input,"%lf %u %d",&now,&keys,&active)==3) {
        int result=player_step(&p,now,keys,active);
        fprintf(states,"%d %d %d %d %d %d %d %a %a\n",index,result,p.beat,a->scheduler.beat,p.paused,p.pause_latch,p.fast_latch,p.position,p.last_update);
        if (result) { int32_t step=index; fwrite(&step,4,1,frames); fwrite(a->canvas.cells,4,CANVAS_CELLS,frames); }
        index++;
    }
    credits_destroy(a); size_t live=a->memory.live; free(a);
    fclose(input); fclose(frames); fclose(states); return live ? 1:0;
}
