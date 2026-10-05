#ifndef CREDITS_MEMORY_H
#define CREDITS_MEMORY_H
#include <stddef.h>
typedef struct {
    size_t live, peak, calls;
#ifdef CREDITS_DIRECT60
    unsigned char *arena;
    size_t capacity,used;
#endif
} Memory;
void *mem_resize(Memory *m, void *ptr, size_t old_size, size_t new_size);
void mem_free(Memory *m, void *ptr, size_t size);
void credits_fail(const char *message);
#endif
