#include "player_fixed.h"
#include <limits.h>
/* 5.492 + (beat-1)*15/358 = (1373*179 + (beat-1)*1875)/44750.
   Carry the exact rational remainder; never accumulate a rounded beat period. */
enum { DEADLINE_DEN=44750 };
#define BEAT_NUM (UINT64_C(1875)<<32)
static FixedTime deadline(int beat,uint32_t *remainder) {
    int64_t n=INT64_C(1373)*179+((int64_t)beat-1)*1875;
    int64_t whole=n/DEADLINE_DEN,part=n%DEADLINE_DEN;
    if(part<0) { whole--; part+=DEADLINE_DEN; }
    uint64_t fraction=(uint64_t)part<<32;
    *remainder=(uint32_t)(fraction%DEADLINE_DEN);
    return whole*FIXED_SECOND+(FixedTime)(fraction/DEADLINE_DEN);
}
FixedTime fixed_beat_deadline(int beat) {
    uint32_t remainder; return deadline(beat,&remainder);
}
FixedTime fixed_time_ratio(uint64_t count,uint32_t frequency) {
    if(!frequency) credits_fail("zero time frequency");
    uint64_t whole=count/frequency,part=count%frequency;
    if(whole>INT32_MAX) credits_fail("Q32.32 time range");
    return (FixedTime)((whole<<32)+((part<<32)/frequency));
}
static FixedTime add_time(FixedTime a,FixedTime b) {
    if(b<0 || a<0 || a>INT64_MAX-b) credits_fail("Q32.32 time overflow");
    return a+b;
}
static void next_beat(FixedPlayer *p) {
    credits_next(p->animation,1);
    if(p->beat==INT_MAX) credits_fail("beat range");
    p->beat++;
    uint32_t r=p->beat_remainder+(uint32_t)(BEAT_NUM%DEADLINE_DEN);
    p->next_beat+=(FixedTime)(BEAT_NUM/DEADLINE_DEN)+(r>=DEADLINE_DEN);
    p->beat_remainder=r>=DEADLINE_DEN ? r-DEADLINE_DEN:r;
}
void fixed_player_init(FixedPlayer *p,Credits *a,int jump,FixedTime now) {
    static const int amounts[]={0,1000,1770,3040,3780,5420};
    if(now<0) credits_fail("negative clock");
    credits_jump(a,jump); /* Also validates jump before indexing. */
    *p=(FixedPlayer){.animation=a,.last_time=now,.last_update=now,
        .beat=-60+amounts[jump-1],.active=1};
    p->position=jump==1 ? 0:fixed_beat_deadline(amounts[jump-1]+1);
    p->next_beat=deadline(p->beat,&p->beat_remainder);
}
static int step(FixedPlayer *p,FixedTime now,unsigned keys,int active,int integrate) {
    if(now<0 || now<p->last_time) credits_fail("nonmonotonic fixed clock");
    if(!p->active) return 0;
    if(integrate && !p->paused) p->position=add_time(p->position,now-p->last_time);
    p->last_time=now;
    if(!active) {
        p->active=0;
        for(int i=0;i<CANVAS_CELLS;i++) p->animation->canvas.cells[i]=cell_pack(32,39,49,0);
        p->animation->canvas.background=49;
        return 2;
    }
    int render=p->position>p->next_beat;
    if(render) next_beat(p);
    if(now-p->last_update>FIXED_SECOND/30) {
        if(keys&FP_PAUSE) {
            if(!p->pause_latch) { p->paused=!p->paused; p->pause_latch=1; }
        } else p->pause_latch=0;
        const unsigned forward[]={FP_COMMA,FP_PERIOD,FP_SLASH};
        const unsigned amounts[]={3,7,15};
        for(int i=0;i<3;i++) if(keys&forward[i]) {
            if(!p->fast_latch) p->fast_latch=1;
            else {
                uint64_t n=((uint64_t)amounts[i]*15<<32)+p->seek_remainder;
                p->position=add_time(p->position,(FixedTime)(n/358));
                p->seek_remainder=(uint32_t)(n%358);
            }
        }
        p->last_update=now;
    }
    return render;
}
int fixed_player_step(FixedPlayer *p,FixedTime now,unsigned keys,int active) {
    return step(p,now,keys,active,1);
}
int fixed_player_sync(FixedPlayer *p,FixedTime now,FixedTime media,unsigned keys,int active,int last) {
    if(media<0) credits_fail("negative media clock");
    p->position=media; p->seek_remainder=0;
    int result=step(p,now,keys,active,0);
    if(result==2 || !p->active) return result;
    while(p->animation->scheduler.beat<last && p->position>p->next_beat) {
        next_beat(p); result=1;
    }
    return result;
}
