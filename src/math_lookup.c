#include "math_lookup.h"
#include "memory.h"
#include <stdint.h>
#include "math_tables.inc"
#define COUNT(a) (sizeof(a)/sizeof(*(a)))
int math_ocean_height(int phase) {
    if (phase<0 || (unsigned)phase>=COUNT(ocean_height)) credits_fail("ocean phase exceeds validated lookup range");
    return ocean_height[phase];
}
int math_ocean_text(int beat,int generator) {
    if (beat<0 || (unsigned)beat>=COUNT(ocean_text_mask) || generator<1 || generator>4) credits_fail("ocean text lookup range");
    return (ocean_text_mask[beat]>>(generator-1))&1;
}
int math_access_limit(int beat) {
    if (beat<0) credits_fail("negative access beat");
    return (unsigned)beat<COUNT(access_limit) ? access_limit[beat]:1;
}
int math_noise_count(int beat,int wipe) {
    if (beat<0 || (unsigned)beat>=(wipe ? COUNT(wipe_count):COUNT(clear_count))) credits_fail("noise beat exceeds validated lookup range");
    return wipe ? wipe_count[beat]:clear_count[beat];
}
int math_poweroff_height(int adjusted) {
    if (adjusted<=0) credits_fail("invalid poweroff phase");
    return (unsigned)adjusted<=COUNT(poweroff_height) ? poweroff_height[adjusted-1]:0;
}
unsigned math_lookup_bytes(void) {
    return sizeof(ocean_height)+sizeof(ocean_text_mask)+sizeof(access_limit)+sizeof(wipe_count)+sizeof(clear_count)+sizeof(poweroff_height);
}
