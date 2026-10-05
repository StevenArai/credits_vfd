#include "math_lookup.h"
#include <math.h>
#include <stdio.h>
#define CHECK(x) do { if (!(x)) { fprintf(stderr,"lookup line %d\n",__LINE__); return 1; } } while (0)
int main(void) {
    for(int b=0;b<=6508;b++) {
        for(int g=1;g<=4;g++) {
            int m=(int)pow(b,g==1 ? 1.143:1.2)%20;
            int show=g==1 ? (m!=0 && m!=8 && m!=17 && m!=15):g==2 ? (m==0 || m==15):g==3 ? m==8:m==17;
            CHECK(math_ocean_text(b,g)==show);
        }
        int limit=32-(int)pow(b,1.2); if(limit<1) limit=1;
        CHECK(math_access_limit(b)==limit);
    }
    for(int i=0;i<4096;i++) {
        double x=i/5.0,w=cos(.2*x)+sin(.3*x)*sin(.23*x);
        int y=(int)floor((3-2*w*sin(x))*7/9+.5); if(y<0)y=0; if(y>7)y=7;
        CHECK(math_ocean_height(i)==y);
    }
    for(int b=0;b<=60;b++) CHECK(math_noise_count(b,1)==(int)pow(b,1.4));
    for(int b=0;b<=32;b++) CHECK(math_noise_count(b,0)==(int)pow(b,2.2));
    for(int b=1;b<=6508;b++) CHECK(math_poweroff_height(b)==(int)(20/pow(b,1.3)));
    printf("All lookup entries match host reference math; %u read-only bytes\n",math_lookup_bytes());
    return 0;
}
