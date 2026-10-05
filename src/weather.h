#ifndef CREDITS_WEATHER_H
#define CREDITS_WEATHER_H
#include "random.h"
typedef struct {
    double precip,temp,wind,gust,humidity;
    int wind_dir,days;
    const char *name;
} Weather;
void weather_init(Weather *w);
void weather_mutate(Weather *w,Random *r,int steps);
void credits_date(char *out,int beat,int day_offset);
struct Credits;
void credits_weather(struct Credits *a,Weather *w,int mutations,double space_chance);
#endif
