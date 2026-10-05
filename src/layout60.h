#ifndef CREDITS_LAYOUT60_H
#define CREDITS_LAYOUT60_H
#include "credits.h"
#define LAYOUT_WIDTH 60
#define LAYOUT_HEIGHT 20
typedef struct {
    uint32_t cells[LAYOUT_WIDTH*LAYOUT_HEIGHT];
    unsigned scrolled_rows; /* Rows displaced by wrapping; exposed for visual review. */
} Layout60;
/* Presentation only: does not modify source canvas, scenes, timing or RNG. */
void layout60_render(Layout60 *out,const Credits *animation);
#endif
