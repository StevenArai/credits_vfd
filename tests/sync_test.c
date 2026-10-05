#include "player.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#define CHECK(x) do { if (!(x)) { fprintf(stderr,"failed line %d\n",__LINE__); return 1; } } while (0)
int main(void) {
    Credits *reference=malloc(sizeof(*reference)),*synced=malloc(sizeof(*synced));
    CHECK(reference && synced);
    for (int jump=1;jump<=6;jump++) {
        credits_init(reference,42); credits_init(synced,42);
        Player r,p; player_init(&r,reference,jump,0); player_init(&p,synced,jump,0);
        double media=p.position,now=0;
        for (int i=0;i<650;i++) {
            /* Device clock stalls, 2s presenter stalls, pause and forward. */
            double dt=i%17==0 ? 2.0:0.013;
            now+=dt; if (!p.paused && i%13) media+=dt;
            unsigned keys=i>=40 && i<45 ? KEY_PAUSE:i>=70 && i<75 ? KEY_PAUSE:i>=90 && i<98 ? KEY_SLASH:0;
            r.position=media-(r.paused ? 0:now-r.last_time);
            player_step(&r,now,keys,1);
            while (reference->scheduler.beat<6508 && r.position-5.492>(r.beat-1)*player_delay())
                player_step(&r,now,0,1);
            player_sync(&p,now,media,keys,1,6508);
            CHECK(r.beat==p.beat && r.paused==p.paused && fabs(r.position-p.position)<1e-9);
            CHECK(!memcmp(reference->canvas.cells,synced->canvas.cells,sizeof(reference->canvas.cells)));
            CHECK(!memcmp(&reference->random,&synced->random,sizeof(Random)));
            CHECK(reference->events_executed==synced->events_executed);
            if (p.position>media) media=p.position;
        }
        credits_destroy(reference); credits_destroy(synced);
        CHECK(!reference->memory.live && !synced->memory.live);
    }
    free(reference); free(synced); puts("3900 jitter/pause/seek samples match drained reference player, cells, RNG and events"); return 0;
}
