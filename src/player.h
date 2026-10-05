#ifndef CREDITS_PLAYER_H
#define CREDITS_PLAYER_H
#include "credits.h"
enum PlayerKey { KEY_PAUSE=1,KEY_COMMA=2,KEY_PERIOD=4,KEY_SLASH=8 };
typedef struct {
    Credits *animation; /* borrowed; caller controls allocation and destruction */
    double position,last_time,last_update;
    int beat,paused,pause_latch,fast_latch,active;
} Player;
double player_delay(void);
void player_init(Player *p,Credits *animation,int jump,double now);
/* Returns 1 for a rendered beat, 2 for stop/clear, 0 for no visible update. */
int player_step(Player *p,double now,unsigned keys,int active);
#endif
