#include "player.h"
#include <math.h>
double player_delay(void) { return 60.0/179.0/8.0; }
void player_init(Player *p,Credits *a,int jump,double now) {
    static const int amounts[]={0,1000,1770,3040,3780,5420};
    credits_jump(a,jump);
    *p=(Player){.animation=a,.position=jump==1 ? 0:5.492+player_delay()*amounts[jump-1],
        .last_time=now,.last_update=now,.beat=-60+amounts[jump-1],.active=1};
}
int player_step(Player *p,double now,unsigned keys,int active) {
    if (!isfinite(now) || now<p->last_time) credits_fail("player requires finite monotonic time");
    if (!p->active) return 0;
    if (!p->paused) p->position+=now-p->last_time;
    p->last_time=now;
    if (!active) {
        p->active=0;
        for (int i=0;i<CANVAS_CELLS;i++) p->animation->canvas.cells[i]=cell_pack(32,39,49,0);
        p->animation->canvas.background=49;
        return 2;
    }
    int render=(p->position-5.492) > ((p->beat-1)*player_delay());
    int update=now-(1.0/30)>p->last_update;
    if (render) { credits_next(p->animation,1); p->beat++; }
    if (update) {
        if (keys&KEY_PAUSE) {
            if (!p->pause_latch) { p->paused=!p->paused; p->pause_latch=1; }
        } else p->pause_latch=0;
        const unsigned forward[]={KEY_COMMA,KEY_PERIOD,KEY_SLASH};
        const int amounts[]={3,7,15};
        for (int i=0;i<3;i++) if (keys&forward[i]) {
            if (!p->fast_latch) p->fast_latch=1;
            else p->position+=player_delay()*amounts[i];
        }
        /* Deliberately sticky: the source's key-release reset is commented out. */
        p->last_update=now;
    }
    return render;
}

int player_sync(Player *p,double now,double media,unsigned keys,int active,int last) {
    if (!isfinite(media) || media<0) credits_fail("invalid media position");
    /* Suppress wall integration; retain the reference input cadence and latches. */
    p->position=media;
    double elapsed=now-p->last_time;
    if (elapsed<0) credits_fail("nonmonotonic host time");
    if (!p->paused) p->position-=elapsed;
    int result=player_step(p,now,keys,active);
    if (result==2 || !p->active) return result;
    while (p->animation->scheduler.beat<last &&
           p->position-5.492>(p->beat-1)*player_delay()) {
        credits_next(p->animation,1); p->beat++; result=1;
    }
    return result;
}
