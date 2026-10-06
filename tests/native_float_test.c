#include "credits.h"
#include "math_lookup.h"
#include <math.h>
#include <stdio.h>
#include <string.h>
#define CHECK(x) do { if(!(x)) { fprintf(stderr,"native float line %d\n",__LINE__); return 1; } } while(0)

/* Construct selected MT outputs to exercise rounding boundaries, not just seeds. */
static uint32_t untemper(uint32_t v) {
    uint32_t x=v;
    for(int i=0;i<5;i++) x=v^(x>>18);
    v=x; for(int i=0;i<5;i++) x=v^((x<<15)&0xefc60000U);
    v=x; for(int i=0;i<5;i++) x=v^((x<<7)&0x9d2c5680U);
    v=x; for(int i=0;i<5;i++) x=v^(x>>11);
    return x;
}
int main(void) {
    double sine_error=0,target_error=0;
    for(int i=-360000;i<=360000;i++) {
        float angle=i/1000.0f;
        double error=fabs(math_sin_degrees(angle)-sin((double)angle*3.14159265358979323846/180.0));
        if(error>sine_error) sine_error=error;
        CHECK(error<0.000041);
    }
    for(int day=-10000;day<=10000;day++) {
        double expected=40*(sin(2*3.14159265358979323846*day/365-3.14159265358979323846/3)+1)+20;
        double error=fabs(math_weather_target(day)-expected);
        if(error>target_error) target_error=error;
        CHECK(error<0.0017);
        CHECK(math_weather_target(day)==math_weather_target(day+365));
    }
    const unsigned scales[]={1,26,2000,2048};
    unsigned samples=0;
    for(unsigned k=0;k<sizeof(scales)/sizeof(scales[0]);k++) {
        unsigned scale=scales[k];
        for(unsigned edge=0;edge<scale;edge++) for(int offset=-3;offset<=3;offset++) {
            int64_t n=(int64_t)(((uint64_t)edge<<53)/scale)+offset;
            if(n<0) continue;
            Random actual={0};
            actual.mt[0]=untemper((uint32_t)((uint64_t)n>>26)<<5);
            actual.mt[1]=untemper((uint32_t)((uint64_t)n&0x3ffffff)<<6);
            unsigned got=random_scaled(&actual,scale);
            unsigned expected=(unsigned)floor(((double)n/9007199254740992.0)*scale);
            CHECK(got==expected && actual.draws==2); samples++;
        }
        Random a,b; random_seed(&a,42); b=a;
        for(int i=0;i<10000;i++) {
            unsigned got=random_scaled(&a,scale);
            uint32_t hi=random_u32(&b)>>5,lo=random_u32(&b)>>6;
            unsigned expected=(unsigned)floor(((hi*67108864.0+lo)/9007199254740992.0)*scale);
            CHECK(got==expected && !memcmp(&a,&b,sizeof(a))); samples++;
        }
    }
    static Credits a; credits_init(&a,1);
    const float precip[]={-1.0f,0.0f,1.0f,0.203f,0.00005f,0.00015f};
    const char *labels[]={"-100%","0%","100%","20.3%","0.0%","0.02%"};
    for(unsigned i=0;i<sizeof(precip)/sizeof(precip[0]);i++) {
        Weather w=a.weather[0]; w.precip=precip[i];
        credits_weather(&a,&w,0,0.0f);
        char line[15];
        for(int x=0;x<14;x++) line[x]=(char)(a.canvas.cells[17*60+44+x]&65535);
        line[14]=0; CHECK(strstr(line,labels[i]));
    }
    credits_destroy(&a); CHECK(!a.memory.live);
    printf("sine max error %.9g; target max error %.9g F; %u exact integer-phase samples; percent formatting passed\n",sine_error,target_error,samples);
    return 0;
}
