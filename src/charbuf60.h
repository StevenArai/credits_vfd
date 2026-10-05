#ifndef CREDITS_CHARBUF60_H
#define CREDITS_CHARBUF60_H
/* Included by canvas.h only in the native 60x20 build. No Section or heap. */
#define CANVAS_WIDTH 60
#define CANVAS_HEIGHT 20
#define CANVAS_CELLS 1200
typedef struct {
    uint32_t cells[CANVAS_CELLS];
    unsigned scrolled_rows,clipped_cells;
    int background;
} Canvas;
typedef struct { int x,y,w,h; } TextRegion;
typedef struct { Canvas *canvas; TextRegion region; int row,col; } TextFlow;
void canvas_init(Canvas *c,Memory *memory);
void canvas_destroy(Canvas *c);
void canvas_clear(Canvas *c);
void canvas_render(Canvas *c);
void canvas_string(Canvas *c,int x,int y,const char *utf8,const char *code);
void canvas_string_cursor(Canvas *c,int x,int y,const char *utf8,const char *code,int cursor_index);
void canvas_chars(Canvas *c,int x,int y,const uint32_t *chars,int length,const char *code);
void canvas_char(Canvas *c,int x,int y,const char *utf8,const char *code);
uint32_t cell_pack(uint32_t ch,int fg,int bg,int style);
uint32_t canvas60_style(const char *code);
void canvas60_put(Canvas *c,int x,int y,uint32_t cell);
void canvas60_clear_region(Canvas *c,TextRegion region);
TextFlow canvas60_flow(Canvas *c,TextRegion region,int clear);
void canvas60_newline(TextFlow *flow);
void canvas60_line(TextFlow *flow,const char *text,const char *code,int cursor_last);
#endif
