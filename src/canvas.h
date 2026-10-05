#ifndef CREDITS_CANVAS_H
#define CREDITS_CANVAS_H
#include "memory.h"
#include <stdint.h>
#define CANVAS_WIDTH 80
#define CANVAS_HEIGHT 24
#define CANVAS_CELLS (CANVAS_WIDTH * CANVAS_HEIGHT)
typedef struct { uint32_t *data; int size, capacity; } Characters;
typedef struct { Characters text; int start, length, end; const char *code; } Section;
typedef struct {
    Memory *memory;
    Section *groups;
    int count, capacity, peak_groups, peak_string, background;
    uint32_t cells[CANVAS_CELLS];
} Canvas;
void canvas_init(Canvas *c, Memory *memory);
void canvas_destroy(Canvas *c);
void canvas_string(Canvas *c, double x, int y, const char *utf8, const char *code);
void canvas_chars(Canvas *c, double x, int y, const uint32_t *text, int length, const char *code);
void canvas_char(Canvas *c, double x, int y, const char *utf8, const char *code);
void canvas_clear(Canvas *c);
void canvas_render(Canvas *c);
uint32_t cell_pack(uint32_t ch, int fg, int bg, int style);
#endif
