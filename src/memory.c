#include "memory.h"
#include <stdio.h>
#include <stdlib.h>
void credits_fail(const char *message) {
    fprintf(stderr, "credits: %s\n", message);
    abort();
}
void *mem_resize(Memory *m, void *ptr, size_t old_size, size_t new_size) {
    void *p = realloc(ptr, new_size);
    if (!p && new_size) credits_fail("allocation failed");
    m->live = m->live - old_size + new_size;
    if (m->live > m->peak) m->peak = m->live;
    m->calls++;
    return p;
}
void mem_free(Memory *m, void *ptr, size_t size) {
    free(ptr);
    m->live -= size;
}
