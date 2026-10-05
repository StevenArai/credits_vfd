#ifndef CREDITS_DATA_H
#define CREDITS_DATA_H
#include "data_ids.h"
#include "memory.h"
#include "random.h"
#include "scheduler.h"
typedef struct { char *value; int length, words; } WordLine;
typedef struct {
    char *raw;
    int bytes, line_count, repeat;
    WordLine *lines;
} Text;
typedef struct { const char *text; int chance; const char *ignore; } DataSegment;
typedef struct { const char *name; const DataSegment *segments; int count, words, repeat, bytes; } TextDefinition;
extern const SceneDefinition scene_definitions[SC_COUNT];
int scene_due(int scene,int generator,int beat);
void data_init(Text *texts, Memory *memory, Random *random);
void data_destroy(Text *texts, Memory *memory);
void corrupt_text(Random *random,char *text,int chance,const char *ignore);
size_t data_readonly_size(void);
#endif
