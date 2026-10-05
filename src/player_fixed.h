#ifndef CREDITS_PLAYER_FIXED_H
#define CREDITS_PLAYER_FIXED_H
#include "credits.h"
#include <stdint.h>
/* Signed Q32.32 seconds: 2^-32 s resolution, nonnegative input up to 2^31-1 s. */
typedef int64_t FixedTime;
#define FIXED_SECOND (INT64_C(1)<<32)
enum FixedPlayerKey { FP_PAUSE=1,FP_COMMA=2,FP_PERIOD=4,FP_SLASH=8 };
typedef struct {
    Credits *animation;
    FixedTime position,last_time,last_update,next_beat;
    uint32_t beat_remainder,seek_remainder;
    int beat,paused,pause_latch,fast_latch,active;
} FixedPlayer;
/* Convert counter/sample ratio directly, rounding down by less than one LSB. */
FixedTime fixed_time_ratio(uint64_t count,uint32_t frequency);
FixedTime fixed_beat_deadline(int beat);
void fixed_player_init(FixedPlayer *p,Credits *a,int jump,FixedTime now);
int fixed_player_step(FixedPlayer *p,FixedTime now,unsigned keys,int active);
int fixed_player_sync(FixedPlayer *p,FixedTime now,FixedTime media,unsigned keys,int active,int last);
#endif
