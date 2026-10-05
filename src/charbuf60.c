#include "canvas.h"
#include <string.h>

uint32_t cell_pack(uint32_t ch,int fg,int bg,int style) {
    return ch | (uint32_t)fg<<16 | (uint32_t)bg<<22 | (uint32_t)style<<28;
}
uint32_t canvas60_style(const char *code) {
    int fg=39,bg=49,style=1;
    const char *p=code;
    while (*p) {
        if (*p++!='\033' || *p++!='[') credits_fail("invalid SGR");
        for (;;) {
            int n=0;
            while (*p>='0' && *p<='9') n=n*10+(*p++-'0');
            if (!n) { fg=39; bg=49; style=0; }
            else if (n==1 || n==2 || n==22) style=n==22 ? 0:n;
            else if (n>=30 && n<=39) fg=n;
            else if (n>=40 && n<=49) bg=n;
            else credits_fail("unsupported SGR");
            if (*p==';') { p++; continue; }
            if (*p++!='m') credits_fail("invalid SGR terminator");
            break;
        }
    }
    return cell_pack(0,fg,bg,style);
}
static uint32_t decode(const char **text) {
    const unsigned char *p=(const unsigned char *)*text;
    uint32_t ch=*p++;
    if (ch>=0xc2 && ch<=0xdf && p[0]>=0x80 && p[0]<=0xbf) ch=((ch&31)<<6)|(*p++&63);
    else if (ch>=0x80) credits_fail("unsupported UTF-8");
    *text=(const char *)p; return ch;
}
void canvas60_put(Canvas *c,int x,int y,uint32_t cell) {
    /* Clipping is explicit for effects; text uses bounded, scrolling regions. */
    if (x<0 || x>=60 || y<0 || y>=20) { c->clipped_cells++; return; }
    c->cells[y*60+x]=cell;
}
void canvas_chars(Canvas *c,int x,int y,const uint32_t *chars,int length,const char *code) {
    uint32_t style=canvas60_style(code);
    for (int i=0;i<length;i++) canvas60_put(c,x+i,y,style|chars[i]);
}
void canvas_string_cursor(Canvas *c,int x,int y,const char *text,const char *code,int cursor_index) {
    uint32_t style=canvas60_style(code); int i=0,origin=x;
    while (*text) {
        uint32_t ch=decode(&text);
        int cursor=i==cursor_index || (cursor_index==-1 && !*text); i++;
        if (ch=='\n') { y++; x=origin; }
        else if (ch=='\r') x=origin;
        else canvas60_put(c,x++,y,style|ch|(cursor ? CELL_CURSOR:0));
    }
}
void canvas_string(Canvas *c,int x,int y,const char *text,const char *code) {
    canvas_string_cursor(c,x,y,text,code,-2);
}
void canvas_char(Canvas *c,int x,int y,const char *text,const char *code) { canvas_string(c,x,y,text,code); }
static void valid_region(TextRegion r) {
    if (r.x<0 || r.y<0 || r.w<=0 || r.h<=0 || r.x+r.w>60 || r.y+r.h>20)
        credits_fail("invalid 60x20 text region");
}
void canvas60_clear_region(Canvas *c,TextRegion r) {
    valid_region(r);
    for (int y=r.y;y<r.y+r.h;y++) for (int x=r.x;x<r.x+r.w;x++) c->cells[y*60+x]=cell_pack(' ',39,49,0);
}
void canvas_clear(Canvas *c) { canvas60_clear_region(c,(TextRegion){0,0,60,20}); c->background=49; }
void canvas_init(Canvas *c,Memory *memory) { (void)memory; memset(c,0,sizeof(*c)); canvas_clear(c); }
void canvas_render(Canvas *c) { (void)c; } /* Writes are already committed. */
void canvas_destroy(Canvas *c) { (void)c; }
TextFlow canvas60_flow(Canvas *c,TextRegion r,int clear) {
    valid_region(r); if (clear) canvas60_clear_region(c,r);
    return (TextFlow){c,r,0,0};
}
void canvas60_newline(TextFlow *f) {
    f->col=0;
    if (++f->row<f->region.h) return;
    TextRegion r=f->region;
    for (int y=0;y<r.h-1;y++) memmove(f->canvas->cells+(r.y+y)*60+r.x,
        f->canvas->cells+(r.y+y+1)*60+r.x,(size_t)r.w*sizeof(uint32_t));
    canvas60_clear_region(f->canvas,(TextRegion){r.x,r.y+r.h-1,r.w,1});
    f->row=r.h-1; f->canvas->scrolled_rows++;
}
static int whitespace(uint32_t ch) { return ch==' ' || ch==160; }
void canvas60_line(TextFlow *f,const char *text,const char *code,int cursor_last) {
    uint32_t style=canvas60_style(code);
    const char *end=text+strlen(text);
    while (end>text && end[-1]==' ') end--;
    while (text<end) {
        const char *word=text; int length=0;
        uint32_t first=decode(&word);
        if (first=='\n') { canvas60_newline(f); text=word; continue; }
        if (first=='\r') { f->col=0; text=word; continue; }
        if (whitespace(first) && f->col==f->region.w) { text=word; continue; }
        length=1;
        if (!whitespace(first)) {
            while (word<end) {
                const char *next=word; uint32_t ch=decode(&next);
                if (whitespace(ch) || ch=='\n' || ch=='\r') break;
                length++; word=next;
            }
            if (length<=f->region.w && f->col+length>f->region.w) canvas60_newline(f);
        }
        while (text<word) {
            uint32_t ch=decode(&text);
            if (f->col==f->region.w) canvas60_newline(f);
            canvas60_put(f->canvas,f->region.x+f->col++,f->region.y+f->row,
                style|ch|((cursor_last && text==end) ? CELL_CURSOR:0));
        }
    }
}
