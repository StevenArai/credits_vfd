#include "credits.h"
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
