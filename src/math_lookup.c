#include "math_lookup.h"
#include "memory.h"
#include <stdint.h>
#include "math_tables.inc"
#define COUNT(a) (sizeof(a)/sizeof(*(a)))
static const float sin_tens[]={
    0.0f,0.1736481777f,0.3420201433f,0.5f,0.6427876097f,
    0.7660444431f,0.8660254038f,0.9396926208f,0.9848077530f,1.0f
};
static const float cos_units[]={
    1.0f,0.9998476952f,0.9993908270f,0.9986295348f,0.9975640503f,
    0.9961946981f,0.9945218954f,0.9925461516f,0.9902680687f,
    0.9876883406f,0.9848077530f
};
float math_sin_degrees(float x) {
    if (!(x>=-360.0f && x<=360.0f)) credits_fail("sine degree range");
    if (x<0.0f) x+=360.0f;
    if (x>=360.0f) x-=360.0f;
    int negative=x>=180.0f;
    if (negative) x-=180.0f;
    if (x>90.0f) x=180.0f-x;
    int a=(int)(x/10.0f);
    float b=x-10.0f*a;
    int unit=(int)b;
    float fraction=b-unit;
    /* Retain fractional degrees in cos(b); sin(b) uses r-r^3/6.
       Directly truncating b in the cosine lookup introduces visible jumps. */
    float cosine=cos_units[unit]+fraction*(cos_units[unit+1]-cos_units[unit]);
    float r=b*0.01745329251994329577f;
    float sine=r*(1.0f-r*r/6.0f);
    float y=sin_tens[a]*cosine+sin_tens[9-a]*sine;
    return negative ? -y:y;
}
float math_weather_target(int days) {
    int phase=days%365;
    if (phase<0) phase+=365;
    return 40.0f*(math_sin_degrees(phase*(360.0f/365.0f)-60.0f)+1.0f)+20.0f;
}
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
    return sizeof(ocean_height)+sizeof(ocean_text_mask)+sizeof(access_limit)+sizeof(wipe_count)+sizeof(clear_count)+sizeof(poweroff_height)+sizeof(sin_tens)+sizeof(cos_units);
}
