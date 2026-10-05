#ifndef CREDITS_FRAMEBUFFER_H
#define CREDITS_FRAMEBUFFER_H
#include "canvas.h"
#define FB_WIDTH 256
#define FB_HEIGHT 128
#define FB_STRIDE 32
typedef struct { uint8_t bits[FB_HEIGHT*FB_STRIDE]; } Framebuffer;
/* MSB first, (8,4) origin, 3x5 cell advance. Returns missing glyph count. */
unsigned framebuffer_render(Framebuffer *f,const uint32_t cells[CANVAS_CELLS]);
int framebuffer_pixel(const Framebuffer *f,int x,int y);
#endif
