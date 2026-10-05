#include "layout60.h"
#include <string.h>
typedef struct { int x,y,w,h; } Rect;
static uint32_t blank(void) { return cell_pack(' ',39,49,0); }
static int space(uint32_t cell) { unsigned c=cell&65535; return c==' ' || c==160; }
static int active(const Credits *a,int scene) {
    for (int i=0;i<a->scheduler.count;i++) if (a->scheduler.active[i]==scene) return 1;
    return 0;
}
static void next_row(Layout60 *out,Rect dst,int *row) {
    (*row)++;
    if (*row<dst.h) return;
    for (int y=0;y<dst.h-1;y++)
        memmove(out->cells+(dst.y+y)*60+dst.x,out->cells+(dst.y+y+1)*60+dst.x,(size_t)dst.w*4);
    for (int x=0;x<dst.w;x++) out->cells[(dst.y+dst.h-1)*60+dst.x+x]=blank();
    *row=dst.h-1; out->scrolled_rows++;
}
/* Word-wrap each explicit source line. Overflow scrolls the region upward,
   so ongoing typing and the newest history remain visible. No font shrinking. */
static void flow(Layout60 *out,const uint32_t *cells,Rect src,Rect dst) {
    int last=-1,row=0;
    for (int y=0;y<src.h;y++) for (int x=0;x<src.w;x++)
        if (!space(cells[(src.y+y)*80+src.x+x])) last=y;
    for (int y=0;y<=last;y++) {
        if (y) next_row(out,dst,&row);
        const uint32_t *line=cells+(src.y+y)*80+src.x;
        int end=src.w,begin=0,col=0;
        while (end && space(line[end-1])) end--;
        while (begin<end && space(line[begin])) begin++;
        col=begin<3 ? begin:2;
        int rule=end-begin>=20;
        for (int x=begin;x<end && rule;x++) if ((line[x]&65535)!='-') rule=0;
        if (rule) {
            for (int x=0;x<dst.w;x++) out->cells[(dst.y+row)*60+dst.x+x]=line[begin];
            continue;
        }
        for (int i=begin;i<end;) {
            int stop=i+1;
            if (!space(line[i])) while (stop<end && !space(line[stop])) stop++;
            int length=stop-i;
            if (!space(line[i]) && length<=dst.w && col+length>dst.w) { next_row(out,dst,&row); col=0; }
            while (i<stop) {
                if (col==dst.w) { next_row(out,dst,&row); col=0; }
                out->cells[(dst.y+row)*60+dst.x+col++]=line[i++];
            }
        }
    }
}
static void graphic(Layout60 *out,const uint32_t *cells,Rect src,Rect dst) {
    for (int y=0;y<dst.h;y++) for (int x=0;x<dst.w;x++)
        out->cells[(dst.y+y)*60+dst.x+x]=cells[(src.y+y*(src.h-1)/(dst.h-1))*80+src.x+x*(src.w-1)/(dst.w-1)];
}
void layout60_render(Layout60 *out,const Credits *a) {
    const uint32_t *cells=a->canvas.cells;
    for (int i=0;i<60*20;i++) out->cells[i]=blank();
    out->scrolled_rows=0;
    if (active(a,SC_WIPE) || active(a,SC_CLEAR_WIPE) || active(a,SC_POWEROFF)) {
        graphic(out,cells,(Rect){0,0,80,24},(Rect){0,0,60,20});
    } else if (active(a,SC_OCEAN_B) || active(a,SC_OCEAN_C) || active(a,SC_OCEAN_D)) {
        flow(out,cells,(Rect){0,0,80,14},(Rect){0,0,60,12});
        graphic(out,cells,(Rect){0,14,80,10},(Rect){0,12,60,8});
    } else if (active(a,SC_ACCESSPOINTS)) {
        /* All 24 seven-character access points already fit inside 60 columns. */
        graphic(out,cells,(Rect){0,0,60,20},(Rect){0,0,60,20});
    } else if (active(a,SC_FUNDINGX2)) {
        flow(out,cells,(Rect){0,0,80,14},(Rect){0,0,60,11});
        flow(out,cells,(Rect){0,14,80,10},(Rect){0,12,60,8});
    } else if (active(a,SC_FDG_SINGLE) || active(a,SC_FDG_DOWN)) {
        flow(out,cells,(Rect){0,0,80,20},(Rect){0,0,60,16});
        flow(out,cells,(Rect){0,20,80,4},(Rect){0,16,60,4});
    } else if (active(a,SC_FUNDING) || active(a,SC_TITLE) || active(a,SC_REDRAW_UI)) {
        if (active(a,SC_FUNDING)) {
            flow(out,cells,(Rect){0,0,52,20},(Rect){0,0,31,18});
        } else {
            flow(out,cells,(Rect){0,0,80,7},(Rect){0,0,60,7});
            graphic(out,cells,(Rect){36,11,8,4},(Rect){26,8,8,4});
        }
        /* Weather panel keeps all 28 columns and seven rows, without resampling. */
        graphic(out,cells,(Rect){52,14,28,7},(Rect){32,11,28,7});
        flow(out,cells,(Rect){0,21,80,3},(Rect){0,18,60,2});
    } else if (active(a,SC_LOADINGBAR) || active(a,SC_FASTLOAD)) {
        flow(out,cells,(Rect){0,0,80,9},(Rect){0,0,60,7});
        graphic(out,cells,(Rect){4,9,34,3},(Rect){13,7,34,3});
        flow(out,cells,(Rect){0,12,80,12},(Rect){0,11,60,9});
    } else {
        flow(out,cells,(Rect){0,0,80,24},(Rect){0,0,60,20});
    }
}
