/* Compile-only ABI probe: no SDK, runtime, startup code or board is implied. */
#include "credits.h"
#include "layout60.h"
#include "framebuffer.h"
#define SIZE(t) const unsigned size_##t=sizeof(t)
SIZE(Credits); SIZE(Canvas); SIZE(Section); SIZE(Characters); SIZE(WordLine);
SIZE(HistoryEntry); SIZE(Text); SIZE(Random); SIZE(Ocean); SIZE(Weather);
SIZE(Layout60); SIZE(Framebuffer);
