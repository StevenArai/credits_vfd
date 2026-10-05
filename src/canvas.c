#include "canvas.h"
#include <stdlib.h>
#include <string.h>

/* The reference Layer doubles width a second time for its backing bound. */
enum { LAYER_BOUND = CANVAS_CELLS * 2 };
static int min_int(int a, int b) { return a < b ? a : b; }
static int slice_index(int index, int length) {
    if (index < 0) index += length;
    return index < 0 ? 0 : min_int(index, length);
}
static void reserve(Canvas *c, Characters *s, int size) {
    if (size < 0) credits_fail("negative character capacity");
    if (size > s->capacity) {
        int capacity = size + size/2 + 16;
        s->data = mem_resize(c->memory, s->data, (size_t)s->capacity*sizeof(uint32_t), (size_t)capacity*sizeof(uint32_t));
        s->capacity = capacity;
    }
}
static void append(Canvas *c, Characters *s, const uint32_t *text, int size) {
    if (size < 0) credits_fail("negative append size");
    reserve(c, s, s->size + size);
    if (size) memcpy(s->data+s->size, text, (size_t)size*sizeof(uint32_t));
    s->size += size;
    if (s->size > c->peak_string) c->peak_string=s->size;
}
static void append_slice(Canvas *c, Characters *dst, const Characters *src, int begin, int end) {
    begin = slice_index(begin, src->size); end = slice_index(end, src->size);
    if (end > begin) append(c, dst, src->data+begin, end-begin);
}
static void free_text(Canvas *c, Characters *s) {
    mem_free(c->memory, s->data, (size_t)s->capacity*sizeof(uint32_t));
    *s = (Characters){0};
}
static Section section(Canvas *c, const uint32_t *text, int size, int start, const char *code) {
    Section s = { .start=start, .length=size, .end=start+size, .code=code };
    append(c, &s.text, text, size);
    return s;
}
static Section subsection(Canvas *c, const Section *s, int begin, int end, int start) {
    begin=slice_index(begin,s->text.size); end=slice_index(end,s->text.size);
    return section(c, s->text.data+begin, end>begin ? end-begin : 0, start, s->code);
}
static int bisect(const Canvas *c, int location) {
    int lo=0, hi=c->count;
    while (lo < hi) {
        int mid=(lo+hi)/2;
        if (location < c->groups[mid].start) hi=mid; else lo=mid+1;
    }
    return lo;
}
static void insert(Canvas *c, int index, Section s) {
    if (index > c->count) index=c->count; /* Python list.insert clamps. */
    if (index < 0) credits_fail("negative section insertion");
    if (c->count == c->capacity) {
        int cap = c->capacity*2+16;
        c->groups=mem_resize(c->memory,c->groups,(size_t)c->capacity*sizeof(Section),(size_t)cap*sizeof(Section));
        c->capacity=cap;
    }
    memmove(c->groups+index+1,c->groups+index,(size_t)(c->count-index)*sizeof(Section));
    c->groups[index]=s;
    c->count++;
    if (c->count > c->peak_groups) c->peak_groups=c->count;
}
static void remove_group(Canvas *c, int index) {
    free_text(c,&c->groups[index].text);
    memmove(c->groups+index,c->groups+index+1,(size_t)(c->count-index-1)*sizeof(Section));
    c->count--;
}
static void replace_below(Canvas *c, Section *add, const Section *old) {
    Characters text={0};
    int diff=add->start-old->start;
    append_slice(c,&text,&old->text,0,diff);
    append(c,&text,add->text.data,add->text.size);
    append_slice(c,&text,&old->text,diff+add->length,old->text.size);
    free_text(c,&add->text); add->text=text;
    add->start=min_int(add->start,old->start);
    add->length=text.size; add->end=add->start+add->length;
}
static void set_string(Canvas *c, int loc, const uint32_t *text, int length, const char *code) {
    if (loc < 0 || loc >= LAYER_BOUND) return; /* Deliberate Python clipping. */
    int start=bisect(c,loc)-1;
    if (start < 0) start=0;
    while (start >= 1 && c->groups[start-1].start == loc) start--;
    Section add=section(c,text,min_int(length,LAYER_BOUND-loc),loc,code);
    Section left={0}, right={0};
    int has_left=0, has_right=0;
    for (int i=start; i<c->count;) {
        Section *old=&c->groups[i];
        if (old->start >= add.end) break;
        if (old->end <= add.start) { i++; continue; }
        if (!(old->start >= add.start && old->end <= add.end)) {
            if (strcmp(old->code,add.code)==0) replace_below(c,&add,old);
            else {
                if (add.start > old->start) {
                    if (has_left) free_text(c,&left.text);
                    left=subsection(c,old,0,add.start-old->start,old->start); has_left=1;
                }
                if (add.end < old->end) {
                    if (has_right) free_text(c,&right.text);
                    right=subsection(c,old,old->length-(old->end-add.end),old->text.size,add.end); has_right=1;
                }
            }
        }
        remove_group(c,i);
    }
    /* Preserve the reference's start_i + bisect insertion, even if unsorted. */
    int at=start+bisect(c,loc);
    if (has_left) insert(c,at++,left);
    insert(c,at++,add);
    if (has_right) insert(c,at,right);
}
static Characters decode(Canvas *c, const char *utf8) {
    Characters s={0};
    const unsigned char *p=(const unsigned char *)utf8;
    reserve(c,&s,(int)strlen(utf8));
    while (*p) {
        uint32_t value=*p++;
        if (value >= 0xc2 && value <= 0xdf && p[0] >= 0x80 && p[0] <= 0xbf) value=((value&31)<<6)|(*p++&63);
        else if (value >= 0x80) credits_fail("unsupported or invalid UTF-8 in project text");
        s.data[s.size++]=value;
    }
    return s;
}
void canvas_chars(Canvas *c, double x, int y, const uint32_t *text, int length, const char *code) {
    set_string(c,(int)(x*2)+y*80,text,length,code);
}
void canvas_string(Canvas *c, double x, int y, const char *utf8, const char *code) {
    Characters text=decode(c,utf8);
    canvas_chars(c,x,y,text.data,text.size,code);
    free_text(c,&text);
}
void canvas_string_cursor(Canvas *c, double x, int y, const char *utf8, const char *code, int cursor_index) {
    Characters text=decode(c,utf8);
    int index=cursor_index==-1 ? text.size-1:cursor_index;
    if (index<0 || index>=text.size) credits_fail("cursor outside decoded string");
    text.data[index]|=CELL_CURSOR;
    canvas_chars(c,x,y,text.data,text.size,code);
    free_text(c,&text);
}
void canvas_char(Canvas *c, double x, int y, const char *utf8, const char *code) {
    Characters text=decode(c,utf8);
    int loc=(int)(x*2)+y*80, i=bisect(c,loc)-1;
    if (loc < -LAYER_BOUND || loc >= LAYER_BOUND) credits_fail("set_char outside Python backing array");
    while (i >= 1 && c->groups[i-1].start == loc) i--;
    if (i >= 0 && c->groups[i].end >= loc) {
        Section *old=&c->groups[i];
        if (strcmp(old->code,code)==0) {
            if (loc == old->end) {
                append(c,&old->text,text.data,text.size); old->end+=2; old->length+=2;
            } else {
                Characters joined={0};
                /* mod_char uses absolute loc as a Python string slice index. */
                append_slice(c,&joined,&old->text,0,loc);
                append(c,&joined,text.data,text.size);
                append_slice(c,&joined,&old->text,loc+2,old->text.size);
                free_text(c,&old->text); old->text=joined;
            }
            free_text(c,&text); return;
        }
        Section left={0},right={0};
        int l=loc>old->start, r=loc<old->end;
        if (l) left=subsection(c,old,0,loc-old->start,old->start);
        /* subtract_char uses end-loc, not loc-start+2. */
        if (r) right=subsection(c,old,old->end-loc,old->text.size,loc+2);
        remove_group(c,i);
        if (l) insert(c,bisect(c,left.start),left);
        if (r) insert(c,bisect(c,right.start),right);
    }
    insert(c,bisect(c,loc),section(c,text.data,text.size,loc,code));
    free_text(c,&text);
}
uint32_t cell_pack(uint32_t ch,int fg,int bg,int style) { return ch | (uint32_t)fg<<16 | (uint32_t)bg<<22 | (uint32_t)style<<28; }
void canvas_init(Canvas *c, Memory *m) {
    memset(c,0,sizeof(*c)); c->memory=m; c->background=49;
    for (int i=0; i<CANVAS_CELLS; i++) c->cells[i]=cell_pack(32,39,49,0);
}
void canvas_clear(Canvas *c) {
    uint32_t spaces[CANVAS_CELLS];
    for (int i=0;i<CANVAS_CELLS;i++) spaces[i]=32;
    set_string(c,0,spaces,CANVAS_CELLS,"");
}
static void colour(const char *code, int *fg, int *bg, int *style) {
    const char *p=code;
    while (*p) {
        if (*p++ != '\033' || *p++ != '[') credits_fail("invalid colour code");
        for (;;) {
            int n=0;
            while (*p >= '0' && *p <= '9') n=n*10+(*p++-'0');
            if (n==0) { *fg=39; *bg=49; *style=0; }
            else if (n==1 || n==2 || n==22) *style=n==22 ? 0:n;
            else if (n>=30 && n<=39) *fg=n;
            else if (n>=40 && n<=49) *bg=n;
            else credits_fail("unsupported SGR");
            if (*p==';') { p++; continue; }
            if (*p++ != 'm') credits_fail("invalid SGR terminator");
            break;
        }
    }
}
void canvas_render(Canvas *c) {
    int fg=39,bg=c->background,style=1;
    for (int i=0;i<c->count;i++) {
        Section *s=&c->groups[i];
        int line=s->start/80, offset=s->start%80;
        if (offset<0) { offset+=80; line--; }
        int row=line<0 ? 0:line, col=offset;
        colour(s->code,&fg,&bg,&style);
        int split=0,stop=0;
        while (stop<=s->length) {
            if (line>=24) break;
            stop=80-offset+split;
            int end=min_int(stop,s->text.size);
            for (int j=split;j<end;j++) {
                uint32_t raw=s->text.data[j],ch=raw&65535;
                if (ch=='\n') { row++; col=0; }
                else if (ch=='\r') col=0;
                else {
                    if (col>=80) { row++; col=0; }
                    if (row>=0 && row<24) {
                        c->cells[row*80+col]=cell_pack(ch,fg,bg,style);
                        c->cursor[row*80+col]=(raw&CELL_CURSOR)!=0;
                    }
                    col++;
                }
            }
            if (stop<=s->length) { row++; col=0; }
            offset=0; line++; split=stop;
        }
        free_text(c,&s->text);
    }
    c->count=0; c->background=bg;
}
void canvas_destroy(Canvas *c) {
    for (int i=0;i<c->count;i++) free_text(c,&c->groups[i].text);
    mem_free(c->memory,c->groups,(size_t)c->capacity*sizeof(Section));
    c->groups=NULL; c->count=c->capacity=0;
}
