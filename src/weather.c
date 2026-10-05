#include "credits.h"
#include "colours.h"
#include <math.h>
#include <stdio.h>
#include <string.h>
static const double pi=3.14159265358979323846;
static double maximum(double a,double b) { return a>b ? a:b; }
static double clamp(double x) { return x<0 ? 0:x>1 ? 1:x; }
static const char *weather_name(const Weather *w) {
    if (w->humidity>0.5) {
        if (w->precip>0.4) {
            if (w->wind>43) return w->temp<32 ? "Blizzard":"Hurricane";
            if (w->wind>25) return w->temp<32 ? "Snowstorm":"Storm";
            return w->temp<32 ? "Snow":"Rain";
        }
        if (w->precip>0.25) return w->temp<32 ? "Sleet":"Drizzle";
        if (w->humidity>0.8 || w->precip>0.5) return "Overcast";
        if (w->humidity>0.65 || w->precip>0.3) return "Cloudy";
        return "Partly cloudy";
    }
    if (w->precip>0.4) return w->temp<32 ? "Snow":"Rain";
    if (w->precip>0.2) return w->temp<32 ? "Sleet":"Drizzle";
    return w->humidity<0.2 ? (w->humidity<0.1 ? "Sunny":"Partly sunny"):"Clear";
}
void weather_init(Weather *w) {
    const Weather values[]={
        {0.203,43,13,25,0.66,6,2,NULL}, {0.04,52,12,25,0.1,7,2,NULL},
        {0.07,48,8,20,0.1,1,200,NULL}, {0.07,48,8,20,0.1,1,728,NULL},
        {-1,-1,-1,-1,-1,-1,2,NULL}
    };
    memcpy(w,values,sizeof(values));
    for (int i=0;i<5;i++) w[i].name=weather_name(&w[i]);
    w[4].name="Connection lost...      ";
}
void weather_mutate(Weather *w,Random *r,int steps) {
    for (int i=0;i<steps;i++) {
        double move=random_int(r,-100,100)/400.0;
        move+=(random_int(r,0,(int)(100*fabs(0.33-w->precip)))/200.0)*(0.33-w->precip<0 ? -1:1);
        w->precip=clamp(w->precip+move);
        w->wind_dir=(w->wind_dir+random_int(r,-3,3))%8;
        if (w->wind_dir<0) w->wind_dir+=8;
        move=random_int(r,-100,100)/13.0;
        move+=(random_int(r,0,(int)fabs(15-w->wind))/3.0)*(15-w->wind<0 ? -1:1);
        w->wind=maximum(0,w->wind+move);
        int days=w->days-282;
        double target=40*(sin((2*pi*days)/365-pi/3)+1)+20;
        move=random_int(r,-100,100)/20.0;
        move+=(random_int(r,0,(int)fabs(target-w->temp))/5.0)*(target-w->temp<0 ? -1:1);
        w->temp=maximum(0,w->temp+move);
        move=random_int(r,-100,100)/500.0;
        move+=(random_int(r,0,(int)fabs(0.2-w->humidity))/200.0)*(0.5-w->humidity<0 ? -1:1);
        w->humidity=clamp(w->humidity+move);
        w->gust=w->wind*random_int(r,210,260)*0.01;
        w->days++;
    }
    w->name=weather_name(w);
}
void credits_date(char *out,int beat,int day_offset) {
    const int lengths[]={31,28,31,30,31,30,31,31,30,31,30,31};
    int days=beat/64+day_offset;
    if (beat<0 && beat%64) days--;
    int month=9,day=22,year=2009;
    while (days>0) {
        int leap=year%4==0 && month==1;
        int until=lengths[month]+1-day+leap, step=days<until ? days:until;
        day+=step; days-=step;
        if (day>lengths[month]+leap) {
            month++; day=1;
            if (month>=12) { month=0; year++; }
        }
    }
    snprintf(out,32,"%02d.%02d.%04d",day,month+1,year);
}
static void spaced(Credits *a,int x,int y,char *text,const char *colour,double chance) {
    /* Each Unicode character consumes one randint, including the degree symbol. */
    size_t read=0,write=0;
    while (text[read]) {
        int remove=random_int(&a->random,0,100)<chance;
        int bytes=((unsigned char)text[read]>=0xc0) ? 2:1;
        if (remove) text[write++]=' ';
        else for (int j=0;j<bytes;j++) text[write++]=text[read+j];
        read+=(size_t)bytes;
    }
    text[write]=0; canvas_string(&a->canvas,x,y,text,colour);
}
void credits_weather(Credits *a,Weather *w,int mutations,double chance) {
    char text[160];
    snprintf(text,sizeof(text),"%14s",w->name);
    spaced(a,w->precip!=-1 ? 32:27,15,text,w->precip!=-1 ? YELLOW NORMAL:RED BRIGHT,chance);
    const char *colours[]={WHITE BRIGHT,CYAN BRIGHT,YELLOW BRIGHT,RED BRIGHT};
    int temp=(int)w->temp,ix=temp/23;
    if (temp<0 && temp%23) ix--;
    if (ix>3) ix=3;
    if (ix<0) ix+=4;
    if (ix<0 || ix>3) credits_fail("temperature colour index");
    snprintf(text,sizeof(text),"%2d\xc2\xb0" "F  ",temp);
    spaced(a,27,17,text,colours[ix],chance);
    const char *directions[]={"N ","NE","E ","SE","S ","SW","W ","NW"};
    int direction=w->wind_dir<0 ? w->wind_dir+8:w->wind_dir;
    if (direction<0 || direction>7) credits_fail("wind direction index");
    snprintf(text,sizeof(text),"Wind %2d mph %s",(int)w->wind,directions[direction]);
    spaced(a,32,17,text,CYAN BRIGHT,chance);
    strcpy(text,"Precipitation "); spaced(a,32,19,text,BLUE BRIGHT,chance);
    char percent[64];
    /* min/max clamps return Python int 0/1; the disconnected sentinel is int -1. */
    int integer=w->precip==0 || w->precip==1 || w->precip==-1;
    if (integer) snprintf(percent,sizeof(percent),"%d",(int)(w->precip*100));
    else snprintf(percent,sizeof(percent),"%.2f",w->precip*100);
    size_t n=strlen(percent);
    if (!integer && n && percent[n-1]=='0') percent[--n]=0; /* retain one decimal, like str(round()). */
    percent[n++]='%'; percent[n]=0;
    int padding=13-(int)n; if (padding<0) padding=0;
    int left=padding/2; /* odd padding goes right for a 13-character center field. */
    memset(text,' ',(size_t)left); memcpy(text+left,percent,n);
    memset(text+left+n,' ',(size_t)(padding-left+1)); text[n+padding+1]=0;
    spaced(a,32,20,text,BLUE BRIGHT,chance);
    weather_mutate(w,&a->random,mutations);
}
