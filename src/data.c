#include "data.h"
#include <string.h>
#include "data_generated.inc"
void corrupt_text(Random *random,char *text,int chance,const char *ignore) {
    static const char replacements[]="...  `=/?-$%";
    for (char *p=text;*p;p++) {
        if (*p=='\n') continue;
        /* randint is consumed even for ignored characters, per Python and. */
        if (random_int(random,1,1000)<chance && !strchr("@~\n",*p) && !strchr(ignore,*p))
            *p=replacements[random_below(random,12)];
    }
}
void data_init(Text *texts,Memory *memory,Random *random) {
    for (int i=0;i<TEXT_COUNT;i++) {
        const TextDefinition *def=&text_definitions[i];
        Text *text=&texts[i];
        *text=(Text){0}; text->bytes=def->bytes; text->repeat=def->repeat;
        text->raw=mem_resize(memory,NULL,0,(size_t)def->bytes+1);
        int offset=0;
        for (int j=0;j<def->count;j++) {
            const DataSegment *seg=&def->segments[j];
            int size=(int)strlen(seg->text);
            memcpy(text->raw+offset,seg->text,(size_t)size+1);
            if (seg->chance) corrupt_text(random,text->raw+offset,seg->chance,seg->ignore);
            offset+=size;
        }
        if (offset!=text->bytes) credits_fail("generated text size mismatch");
        if (def->words) {
            text->line_count=1;
            for (int j=0;j<text->bytes;j++) if (text->raw[j]=='\n') text->line_count++;
            text->lines=mem_resize(memory,NULL,0,(size_t)text->line_count*sizeof(WordLine));
            int line=0,start=0;
            for (int j=0;j<=text->bytes;j++) if (!text->raw[j] || text->raw[j]=='\n') {
                text->raw[j]=0;
                WordLine *l=&text->lines[line++];
                l->value=text->raw+start; l->length=j-start; l->words=1;
                for (int k=start;k<j;k++) if (text->raw[k]=='#') l->words++;
                start=j+1;
            }
            if (line!=text->line_count) credits_fail("generated line count mismatch");
        }
    }
}
void data_destroy(Text *texts,Memory *memory) {
    for (int i=0;i<TEXT_COUNT;i++) {
        mem_free(memory,texts[i].raw,(size_t)texts[i].bytes+1);
        mem_free(memory,texts[i].lines,(size_t)texts[i].line_count*sizeof(WordLine));
        texts[i]=(Text){0};
    }
}
size_t data_readonly_size(void) {
    size_t size=sizeof(text_definitions)+sizeof(scene_definitions);
    for (int i=0;i<TEXT_COUNT;i++) {
        const TextDefinition *d=&text_definitions[i];
        size+=strlen(d->name)+1+(size_t)d->count*sizeof(DataSegment);
        for (int j=0;j<d->count;j++) size+=strlen(d->segments[j].text)+1+strlen(d->segments[j].ignore)+1;
    }
    for (int i=0;i<SC_COUNT;i++) size+=strlen(scene_definitions[i].name)+1+(size_t)scene_definitions[i].count*sizeof(int);
    return size;
}
