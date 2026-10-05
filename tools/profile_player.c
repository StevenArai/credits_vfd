/* Deterministic polling benchmark; excludes SDL, rasterization and device I/O. */
#include "player_fixed.h"
#include "host_time.h"
#include <stdio.h>
#include <stdlib.h>
int main(int argc,char **argv) {
    static Credits a;
    FixedPlayer p;
    int hz=argc>1 ? atoi(argv[1]):1000;
    if (hz<24 || hz>10000) return 1;
    credits_init(&a,1); fixed_player_init(&p,&a,1,0);
    unsigned calls=0,draws=0;
    double start=host_seconds();
    while (a.scheduler.beat<6508) {
        FixedTime now=fixed_time_ratio(++calls,(unsigned)hz);
        draws+=fixed_player_sync(&p,now,now,0,1,6508)!=0;
    }
    double elapsed=host_seconds()-start;
    unsigned long long hash=14695981039346656037ULL;
    for (int i=0;i<CANVAS_CELLS;i++) hash=(hash^a.canvas.cells[i])*1099511628211ULL;
    printf("{\"hz\":%d,\"polls\":%u,\"updates\":%u,\"frames\":%llu,\"cpu_wall_ms\":%.6f,\"canvas_hash\":\"%016llx\"}\n",
        hz,calls,draws,(unsigned long long)a.frames,elapsed*1000,hash);
    credits_destroy(&a); return a.memory.live!=0;
}
