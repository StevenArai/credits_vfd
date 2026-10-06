/* Host-only before/after numeric comparison; stdout is a stream of six u64s. */
#include "credits.h"
#include "framebuffer.h"
#include <stdio.h>
#include <stdlib.h>
#ifdef _WIN32
#include <fcntl.h>
#include <io.h>
#endif
static uint64_t hash(const void *data,size_t n) {
    uint64_t h=UINT64_C(14695981039346656037);
    const unsigned char *p=data;
    for(size_t i=0;i<n;i++) h=(h^p[i])*UINT64_C(1099511628211);
    return h;
}
int main(int argc,char **argv) {
#ifdef _WIN32
    _setmode(_fileno(stdout),_O_BINARY);
#endif
    static Credits a;
    Framebuffer fb;
    credits_init(&a,argc>1 ? strtoull(argv[1],NULL,10):1);
    credits_jump(&a,argc>2 ? atoi(argv[2]):1);
    while(a.scheduler.beat<6508) {
        credits_next(&a,1); framebuffer_render60(&fb,a.canvas.cells,1);
        int state[38]={a.scheduler.beat,a.scheduler.count,(int)a.events_executed,a.access_block,a.access_counter};
        for(int i=0;i<14;i++) { state[5+i*2]=a.typers[i].line; state[6+i*2]=a.typers[i].offset; }
        double weather[25];
        for(int i=0;i<5;i++) {
            weather[i*5]=a.weather[i].precip; weather[i*5+1]=a.weather[i].temp;
            weather[i*5+2]=a.weather[i].wind; weather[i*5+3]=a.weather[i].gust;
            weather[i*5+4]=a.weather[i].humidity;
        }
        uint64_t row[]={(uint64_t)a.scheduler.beat,hash(state,sizeof(state)),hash(&a.random,sizeof(a.random)),hash(a.canvas.cells,sizeof(a.canvas.cells)),hash(fb.bits,sizeof(fb.bits)),hash(weather,sizeof(weather))};
        if(fwrite(row,sizeof(row),1,stdout)!=1) return 2;
    }
    credits_destroy(&a); return a.memory.live!=0;
}
