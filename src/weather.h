#ifndef CREDITS_WEATHER_H
#define CREDITS_WEATHER_H
#include "random.h"
#ifdef CREDITS_DIRECT60
typedef float WeatherNumber;
#else
typedef double WeatherNumber;
#endif
typedef struct {
    WeatherNumber precip,temp,wind,gust,humidity;
    int wind_dir,days;
    const char *name;
} Weather;
void weather_init(Weather *w);
void weather_mutate(Weather *w,Random *r,int steps);
void credits_date(char *out,int beat,int day_offset);
struct Credits;
void credits_weather(struct Credits *a,Weather *w,int mutations,WeatherNumber space_chance);
#endif
