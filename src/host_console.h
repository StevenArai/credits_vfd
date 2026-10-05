#ifndef CREDITS_HOST_CONSOLE_H
#define CREDITS_HOST_CONSOLE_H
#include "player.h"
/* Windows terminal adapter. No Windows types leak into the animation API. */
int host_play(Credits *animation,int jump,int menu,int last);
#endif
