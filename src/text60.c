#include "text60.h"
#include <string.h>

void credits60_characters(Credits *a,Typewriter *t,int x,int y,const char *colour,int render) {
    const char *text=t->characters;
    if (!text || !*text) return;
    int bottom=a->draw_scene==SC_TYPEWRITE ? 20:12;
    TextRegion region={x,y,60-x,bottom-y};
    if (!strncmp(text,"[##CLEAR|",9)) {
        if (render) canvas60_clear_region(&a->canvas,region);
        return;
    }
    if (t->offset>=(int)strlen(text)) { t->offset++; return; }
    TextFlow flow=canvas60_flow(&a->canvas,region,render);
    int total=0,extra=0,line=0,length=(int)strlen(text);
    const char *begin=text;
    for (;;) {
        const char *end=strchr(begin,'\n');
        int count=end ? (int)(end-begin):(int)strlen(begin),local=t->offset-total;
        if (local>=0 && local<length) {
            int visible=local<count ? local:count;
            char *buffer=credits_scratch(a,(size_t)visible+2); int n=0;
            for (int i=0;i<visible;i++) if (begin[i]!='~' && begin[i]!='@') buffer[n++]=begin[i];
            if (local<count-1) buffer[n++]='_';
            buffer[n]=0;
            if (local<count && begin[local]=='@') extra+=3;
            total+=count;
            if (render) {
                if (line) canvas60_newline(&flow);
                canvas60_line(&flow,buffer,colour,local<count-1);
            }
        }
        if (!end) break;
        begin=end+1; line++;
    }
    t->offset+=1+extra;
}
static TextRegion words_region(const Credits *a,int x,int y) {
    switch (a->draw_scene) {
    case SC_FUNDING: return (TextRegion){x,19,60-x,1};
    case SC_LOADINGBAR: return (TextRegion){x,11,60-x,9};
    case SC_FUNDINGX2:
        return a->draw_generator==0 ? (TextRegion){x,2,60-x,3}:
               a->draw_generator==1 ? (TextRegion){x,19,60-x,1}:(TextRegion){x,5,60-x,6};
    case SC_FDG_SINGLE: return (TextRegion){x,17,60-x,3};
    case SC_FDG_DOWN: return a->draw_generator ? (TextRegion){x,16,60-x,4}:(TextRegion){x,1,60-x,5};
    default: return (TextRegion){x,y,60-x,20-y};
    }
}
/* Reconstruct visible text from the existing business state, not a second grid. */
static void emit_words(Credits *a,TextFlow *flow,const WordLine *line,int offset,const char *colour) {
    char *buffer=credits_scratch(a,(size_t)line->length+64);
    int words=0,n=0;
    for (int i=0;i<line->length && words<offset;i++) {
        char ch=line->value[i];
        if (ch=='#') words++;
        else if (ch!='~') buffer[n++]=ch;
    }
    while (n && buffer[n-1]==' ') n--;
    buffer[n]=0; canvas60_line(flow,buffer,colour,0);
}
void credits60_words(Credits *a,Typewriter *t,int x,int y,int clear) {
    TextFlow flow=canvas60_flow(&a->canvas,words_region(a,x,y),1);
    if (clear) return;
    const Text *text=t->words;
    if (a->draw_scene==SC_FDG_DOWN) {
        for (int i=0;i<t->line;i++) {
            const WordLine *line=&text->lines[i%text->line_count];
            if (strncmp(line->value,"[~~CLEAR|",9)) emit_words(a,&flow,line,line->words,t->colour);
            else { canvas60_clear_region(&a->canvas,flow.region); flow.row=flow.col=0; }
            canvas60_newline(&flow);
        }
    }
    emit_words(a,&flow,&text->lines[t->line%text->line_count],t->offset,t->colour);
}
void credits60_history(Credits *a,int which) {
    History *history=&a->history[which];
    TextRegion region=which==1 ? (TextRegion){0,12,60,7}:(TextRegion){0,0,31,18};
    TextFlow flow=canvas60_flow(&a->canvas,region,1);
    /* At least one row per entry: older entries outside this window cannot fit.
       Wrapping scrolls upward, preserving complete newest lines at the bottom. */
    int start=history->count-region.h;
    if (start<0) start=0;
    for (int i=start;i<history->count;i++) {
        if (i>start) canvas60_newline(&flow);
        HistoryEntry *entry=&history->entries[i];
        const WordLine *line=entry->line;
        char *buffer=credits_scratch(a,(size_t)line->length+64); int n=0;
        for (int j=0;j<line->length;j++) if (line->value[j]!='#') buffer[n++]=line->value[j];
        int begin=0,end=n;
        while (begin<end && buffer[begin]==' ') begin++;
        while (end>begin && buffer[end-1]==' ') end--;
        n=0;
        for (int j=begin;j<end;j++) if (buffer[j]!='~') buffer[n++]=buffer[j];
        memmove(buffer+4,buffer,(size_t)n);
        memcpy(buffer,"  ",2); memcpy(buffer+2,entry->prefix,2); buffer[n+4]=0;
        canvas60_line(&flow,buffer,entry->colour,0);
    }
}
