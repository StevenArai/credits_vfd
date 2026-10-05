/* Compile-only ABI probe: no SDK, runtime, startup code or board is implied. */
#include "credits.h"
#include "layout60.h"
#include "framebuffer.h"
#include "player_fixed.h"
#include "animator.h"
#define SIZE(t) const unsigned size_##t=sizeof(t)
SIZE(Credits); SIZE(Canvas); SIZE(WordLine);
#ifndef CREDITS_DIRECT60
SIZE(Section); SIZE(Characters);
#endif
SIZE(HistoryEntry); SIZE(Text); SIZE(Random); SIZE(Ocean); SIZE(Weather);
SIZE(Layout60); SIZE(Framebuffer);

SIZE(FixedPlayer);

SIZE(CreditsAnimator);
