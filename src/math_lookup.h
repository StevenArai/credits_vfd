#ifndef CREDITS_MATH_LOOKUP_H
#define CREDITS_MATH_LOOKUP_H
int math_ocean_height(int phase);
int math_ocean_text(int beat,int generator);
int math_access_limit(int beat);
int math_noise_count(int beat,int wipe);
int math_poweroff_height(int adjusted);
/* Bounded degree input [-360,360]; no libm call. */
float math_sin_degrees(float degrees);
float math_weather_target(int days);
unsigned math_lookup_bytes(void);
#endif
