#ifndef CREDITS_RANDOM_H
#define CREDITS_RANDOM_H
#include <stdint.h>
/* CPython 3.13 integer seed, MT19937, getrandbits rejection sampling. */
typedef struct { uint32_t mt[624]; int index; uint64_t draws; } Random;
void random_seed(Random *r, uint64_t seed);
uint32_t random_u32(Random *r);
uint64_t random_bits(Random *r, unsigned bits);
#ifdef CREDITS_DIRECT60
/* floor(random()*scale), preserving the reference's two draws and rounding. */
uint32_t random_scaled(Random *r,uint32_t scale);
#else
double random_unit(Random *r);
#endif
uint64_t random_below(Random *r, uint64_t stop);
int random_int(Random *r, int low, int high);
#endif
