#include "credits.h"
#include "colours.h"
#include <stdio.h>
#include <string.h>
void credits_type_characters(Credits *a,Typewriter *t,int x,int y,const char *colour,int render) {
    const char *text=t->characters;
    if (!text || !*text) return;
    if (strncmp(text,"[##CLEAR|",9)==0) {
        int width,height;
        if (sscanf(text+9,"%d;%d",&width,&height)!=2 || width<0 || height<0) credits_fail("invalid clear text");
        char *buffer=credits_scratch(a,(size_t)width+1);
        memset(buffer,' ',(size_t)width); buffer[width]=0;
        if (render) for (int i=0;i<height;i++) canvas_string(&a->canvas,x,y+i,buffer,colour);
        return;
    }
    int total=0,extra=0,line=0,length=(int)strlen(text);
    const char *begin=text;
    for (;;) {
        const char *end=strchr(begin,'\n');
        int count=end ? (int)(end-begin):(int)strlen(begin);
        int local=t->offset-total;
        if (local>=0 && local<length) {
            int visible=local<count ? local:count;
            char *buffer=credits_scratch(a,(size_t)visible+2); int n=0;
            for (int i=0;i<visible;i++) if (begin[i]!='~' && begin[i]!='@') buffer[n++]=begin[i];
            if (local<count-1) buffer[n++]='_';
            buffer[n]=0;
            if (local<count && begin[local]=='@') extra+=3;
            total+=count;
            if (render) canvas_string(&a->canvas,x,y+line,buffer,colour);
        }
        if (!end) break;
        begin=end+1; line++;
    }
    t->offset+=1+extra;
}
void credits_multiline(Credits *a,int x,int y,const char *text,const char *colour) {
    /* Do not use the shared scratch here: callers may pass that buffer. */
    const char *start=text;
    for (int line=0;;line++) {
        const char *end=strchr(start,'\n');
        size_t length=end ? (size_t)(end-start):strlen(start);
        uint32_t *chars=mem_resize(&a->memory,NULL,0,(length+1)*sizeof(uint32_t));
        int n=0;
        for (size_t i=0;i<length;i++) {
            unsigned char ch=(unsigned char)start[i];
            if (ch>=0xc0 && i+1<length) { chars[n++]=((uint32_t)(ch&31)<<6)|((unsigned char)start[++i]&63); }
            else chars[n++]=ch;
        }
        canvas_chars(&a->canvas,x,y+line,chars,n,colour);
        mem_free(&a->memory,chars,(length+1)*sizeof(uint32_t));
        if (!end) break;
        start=end+1;
    }
}
static int join_words(char *out,const WordLine *line,int offset,int remove_tildes) {
    int word=0,n=0;
    for (int i=0;i<line->length && word<offset;i++) {
        char ch=line->value[i];
        if (ch=='#') word++;
        else if (!remove_tildes || ch!='~') out[n++]=ch;
    }
    out[n]=0; return n;
}
static void history_append(Credits *a,History *history,const WordLine *line,int fluff,int important) {
    if (history->count==history->capacity) {
        int capacity=history->capacity*2+16;
        history->entries=mem_resize(&a->memory,history->entries,(size_t)history->capacity*sizeof(HistoryEntry),(size_t)capacity*sizeof(HistoryEntry));
        history->capacity=capacity;
    }
    history->entries[history->count++]=(HistoryEntry){line,fluff ? BLACK BRIGHT:important ? GREEN NORMAL:YELLOW NORMAL,fluff ? "  ":important ? "> ":"- "};
    if (history->count>history->peak) history->peak=history->count;
    a->refresh=1;
}
void credits_type_words(Credits *a,Typewriter *t,int x,int y,int history) {
    const Text *text=t->words;
    if (!text || !text->line_count || t->line>=text->line_count*text->repeat) return;
    if (t->line<0 || t->offset<0 || history<0 || history>2) credits_fail("invalid typewriter state");
    const WordLine *line=&text->lines[t->line%text->line_count];
    char *buffer=credits_scratch(a,(size_t)line->length+64);
    if (strncmp(line->value,"[~~CLEAR|",9)==0) {
        int width;
        if (sscanf(line->value+9,"%d",&width)!=1 || width<0) credits_fail("invalid word clear");
        buffer=credits_scratch(a,(size_t)width+1); memset(buffer,' ',(size_t)width); buffer[width]=0;
        canvas_string(&a->canvas,x,y,buffer,t->colour); return;
    }
    int length=join_words(buffer,line,t->offset,0);
    int fluff=!length || buffer[0]==' ',important=length && buffer[length-1]=='~';
    if (length) join_words(buffer,line,t->offset,1);
    else { memset(buffer,' ',60); buffer[60]=0; }
    canvas_string(&a->canvas,x,y,buffer,t->colour);
    if (t->offset>=line->words) {
        history_append(a,&a->history[history],line,fluff,important);
        t->offset=0; t->line++;
    } else t->offset++;
}
void credits_write_history(Credits *a,int x,int y,int stop,int which) {
    if (!a->refresh) return;
    a->refresh=0;
    History *history=&a->history[which];
    for (int row=y,index=0;row>=stop;row--,index++) {
        const char *colour=history->count ? BLACK BRIGHT:BLACK NORMAL;
        char *buffer=credits_scratch(a,64); int n=0;
        if (index<history->count) {
            HistoryEntry *entry=&history->entries[history->count-1-index];
            const WordLine *line=entry->line;
            buffer=credits_scratch(a,(size_t)line->length+64);
            int length=join_words(buffer,line,line->words,0),begin=0,end=length;
            while (begin<end && buffer[begin]==' ') begin++;
            while (end>begin && buffer[end-1]==' ') end--;
            /* Compact before inserting the two-character prefix. */
            for (int i=begin;i<end;i++) if (buffer[i]!='~') buffer[n++]=buffer[i];
            memmove(buffer+2,buffer,(size_t)n); memcpy(buffer,entry->prefix,2); n+=2;
            colour=entry->colour;
        }
        while (n<50) buffer[n++]=' ';
        buffer[n]=0; canvas_string(&a->canvas,x,row,buffer,colour);
    }
}
void credits_history_destroy(Credits *a) {
    for (int i=0;i<3;i++) {
        History *h=&a->history[i];
        mem_free(&a->memory,h->entries,(size_t)h->capacity*sizeof(HistoryEntry));
        h->entries=NULL; h->count=h->capacity=0;
    }
}
