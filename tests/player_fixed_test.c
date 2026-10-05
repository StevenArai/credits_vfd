#include "player_fixed.h"
#include "player.h"
#include <math.h>
#include <stdio.h>
#include <string.h>
#define CHECK(x) do { if(!(x)) { fprintf(stderr,"fixed player line %d\n",__LINE__); return 1; } } while(0)
static double seconds(FixedTime t) { return (double)t/4294967296.0; }
int main(void) {
    static Credits a,b;
    for(int jump=1;jump<=6;jump++) {
        credits_init(&a,42); credits_init(&b,42);
        FixedPlayer p; Player r;
        fixed_player_init(&p,&a,jump,0); player_init(&r,&b,jump,0);
        FixedTime media=p.position,now=0;
        for(int i=0;i<650;i++) {
            FixedTime dt=fixed_time_ratio(i%17==0 ? 2000:13,1000);
            now+=dt; if(!p.paused && i%13)media+=dt;
            unsigned keys=i>=40 && i<45 ? FP_PAUSE:i>=70 && i<75 ? FP_PAUSE:i>=90 && i<98 ? FP_SLASH:0;
            int actual=fixed_player_sync(&p,now,media,keys,1,6508);
            int expected=player_sync(&r,seconds(now),seconds(media),keys,1,6508);
            CHECK(actual==expected && p.beat==r.beat && p.paused==r.paused);
            CHECK(p.fast_latch==r.fast_latch && p.pause_latch==r.pause_latch);
            CHECK(fabs(seconds(p.position)-r.position)<2e-9);
            CHECK(!memcmp(a.canvas.cells,b.canvas.cells,sizeof(a.canvas.cells)));
            CHECK(!memcmp(&a.random,&b.random,sizeof(Random)));
            CHECK(a.events_executed==b.events_executed);
            CHECK(p.next_beat==fixed_beat_deadline(p.beat));
            if(p.position>media) media=p.position;
        }
        CHECK(fixed_player_sync(&p,now,media,0,0,6508)==2);
        credits_destroy(&a);credits_destroy(&b);CHECK(!a.memory.live && !b.memory.live);
    }
    credits_init(&a,1); FixedPlayer p; fixed_player_init(&p,&a,1,0);
    CHECK(!fixed_player_step(&p,FIXED_SECOND/30,FP_PAUSE,1) && !p.paused);
    CHECK(!fixed_player_step(&p,FIXED_SECOND/30+1,FP_PAUSE,1) && p.paused);
    credits_destroy(&a);
    credits_init(&a,1); fixed_player_init(&p,&a,1,0);
    for(int i=0;i<6509;i++) {
        FixedTime due=p.next_beat;
        unsigned frames=a.frames;
        fixed_player_sync(&p,due,due,0,1,6508); CHECK(a.frames==frames);
        fixed_player_sync(&p,due+1,due+1,0,1,6508); CHECK(a.frames==frames+1);
        CHECK(p.next_beat==fixed_beat_deadline(p.beat));
        fixed_player_sync(&p,due+1,due+1,0,1,6508); CHECK(a.frames==frames+1);
    }
    credits_destroy(&a);CHECK(!a.memory.live);
    /* Long-horizon rational deadlines: no accumulated per-tick rounding. */
    for(int beat=0;beat<=10000000;beat+=997) {
        long double exact=5.492L+((long double)beat-1)*15/358;
        long double value=(long double)fixed_beat_deadline(beat)/4294967296.0L;
        CHECK(value<=exact+1e-12L && exact-value<1.0L/4294967296.0L+1e-12L);
    }
    const unsigned rates[]={44100,48000,1000000,10000000};
    for(unsigned i=0;i<4;i++) for(unsigned t=0;t<86400;t+=137) {
        uint64_t count=(uint64_t)t*rates[i]+rates[i]-1;
        long double exact=(long double)count/rates[i];
        long double value=(long double)fixed_time_ratio(count,rates[i])/4294967296.0L;
        CHECK(value<=exact && exact-value<1.0L/4294967296.0L+1e-14L);
    }
    puts("3900 legacy jitter/input comparisons; 6509 exact/one-LSB boundaries; 10 million-beat horizon and sample conversion precision passed");
    return 0;
}
