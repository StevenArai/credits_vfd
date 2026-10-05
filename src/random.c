#include "random.h"
#include "memory.h"
static void seed_word(Random *r, uint32_t seed) {
    r->mt[0] = seed;
    for (int i=1; i<624; i++) r->mt[i] = UINT32_C(1812433253) * (r->mt[i-1] ^ (r->mt[i-1] >> 30)) + (uint32_t)i;
    r->index = 624;
    r->draws = 0;
}
void random_seed(Random *r, uint64_t seed) {
    uint32_t key[2] = {(uint32_t)seed, (uint32_t)(seed >> 32)};
    int length = key[1] ? 2 : 1, i=1, j=0;
    seed_word(r, 19650218U);
    for (int k=624; k; k--) {
        r->mt[i] = (r->mt[i] ^ ((r->mt[i-1] ^ (r->mt[i-1] >> 30)) * 1664525U)) + key[j] + (uint32_t)j;
        if (++i >= 624) { r->mt[0] = r->mt[623]; i=1; }
        if (++j >= length) j=0;
    }
    for (int k=623; k; k--) {
        r->mt[i] = (r->mt[i] ^ ((r->mt[i-1] ^ (r->mt[i-1] >> 30)) * 1566083941U)) - (uint32_t)i;
        if (++i >= 624) { r->mt[0] = r->mt[623]; i=1; }
    }
    r->mt[0] = 0x80000000U;
}
uint32_t random_u32(Random *r) {
    if (r->index >= 624) {
        for (int i=0; i<624; i++) {
            uint32_t y = (r->mt[i] & 0x80000000U) | (r->mt[(i+1)%624] & 0x7fffffffU);
            r->mt[i] = r->mt[(i+397)%624] ^ (y >> 1) ^ ((y & 1U) ? 0x9908b0dfU : 0);
        }
        r->index=0;
    }
    uint32_t y = r->mt[r->index++];
    y ^= y >> 11; y ^= (y << 7) & 0x9d2c5680U; y ^= (y << 15) & 0xefc60000U; y ^= y >> 18;
    r->draws++;
    return y;
}
uint64_t random_bits(Random *r, unsigned bits) {
    if (bits > 64) credits_fail("getrandbits supports 0..64 bits");
    if (!bits) return 0;
    if (bits <= 32) return random_u32(r) >> (32-bits);
    uint64_t low = random_u32(r);
    uint64_t high = random_u32(r) >> (64-bits);
    return low | high << 32;
}
double random_unit(Random *r) {
    uint32_t a = random_u32(r) >> 5, b = random_u32(r) >> 6;
    return (a * 67108864.0 + b) / 9007199254740992.0;
}
uint64_t random_below(Random *r, uint64_t stop) {
    if (!stop) credits_fail("empty randrange");
    unsigned bits=0;
    for (uint64_t n=stop; n; n >>= 1) bits++;
    uint64_t value;
    do { value = random_bits(r, bits); } while (value >= stop);
    return value;
}
int random_int(Random *r, int low, int high) {
    if (high < low) credits_fail("empty randint");
    return low + (int)random_below(r, (uint64_t)((int64_t)high-low+1));
}
