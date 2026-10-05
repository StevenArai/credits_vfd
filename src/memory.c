#include "memory.h"
#include <stdio.h>
#include <stdlib.h>
void credits_fail(const char *message) {
#ifdef CREDITS_ANIMATOR_PANIC
    CREDITS_ANIMATOR_PANIC(message);
    for (;;) {} /* The user hook must not return. */
#else
    fprintf(stderr, "credits: %s\n", message);
    abort();
#endif
}
void *mem_resize(Memory *m, void *ptr, size_t old_size, size_t new_size) {
#ifdef CREDITS_DIRECT60
    /* Native storage is owned by Credits and reserved only at initialization. */
    if (ptr || old_size) credits_fail("native storage capacity exceeded");
    size_t align=sizeof(void *),offset=(m->used+align-1)/align*align;
    if (!m->arena || offset>m->capacity || new_size>m->capacity-offset)
        credits_fail("native workspace exhausted");
    void *p=m->arena+offset;
    m->used=offset+new_size;
#else
    void *p = realloc(ptr, new_size);
    if (!p && new_size) credits_fail("allocation failed");
#endif
    m->live = m->live - old_size + new_size;
    if (m->live > m->peak) m->peak = m->live;
    m->calls++;
    return p;
}
void mem_free(Memory *m, void *ptr, size_t size) {
#ifdef CREDITS_DIRECT60
    (void)ptr; /* Whole workspace is reused by the next init. */
#else
    free(ptr);
#endif
    m->live -= size;
}
