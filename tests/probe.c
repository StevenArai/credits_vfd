#include "canvas.h"
#include "random.h"
#include "terminal.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
static void unhex(char *s) {
    if (strcmp(s,"-")==0) { *s=0; return; }
    size_t length=strlen(s);
    for (size_t i=0;i<length;i+=2) {
        unsigned value;
        if (sscanf(s+i,"%2x",&value)!=1) credits_fail("invalid test hex");
        s[i/2]=(char)value;
    }
    s[length/2]=0;
}
int main(int argc,char **argv) {
    if (argc<2) return 2;
    if (!strcmp(argv[1],"random")) {
        Random rng; random_seed(&rng,strtoull(argv[2],NULL,10));
        for (int i=0;i<1000;i++) {
            double u=random_unit(&rng);
            int a=random_int(&rng,-100,100);
            uint64_t b=random_below(&rng,65536);
            uint64_t c=random_below(&rng,12);
            uint64_t d=random_bits(&rng,(unsigned)(i%65));
            printf("%a %d %llu %llu %llu\n",u,a,(unsigned long long)b,(unsigned long long)c,(unsigned long long)d);
        }
        return 0;
    }
    if (argc!=4) return 2;
    if (!strcmp(argv[1],"ansi")) {
        FILE *frames=fopen(argv[2],"rb"), *output=fopen(argv[3],"wb");
        uint32_t cells[CANVAS_CELLS];
        if (!frames || !output) return 2;
        while (fread(cells,sizeof(cells),1,frames)==1) { terminal_render(output,cells); fputc('\f',output); }
        fclose(frames); fclose(output); return 0;
    }
    FILE *in=fopen(argv[2],"r"),*out=fopen(argv[3],"wb");
    if (!in || !out) return 2;
    Memory m={0}; Canvas canvas; canvas_init(&canvas,&m);
    char op,code[200],text[16000];
    /* Codes live through each render: no pointer to a reused input buffer. */
    char (*codes)[100]=calloc(10000,sizeof(*codes)); int count=0;
    if (!codes) return 2;
    while (fscanf(in," %c",&op)==1) {
        if (op=='R') { canvas_render(&canvas); fwrite(canvas.cells,4,CANVAS_CELLS,out); count=0; }
        else if (op=='C') canvas_clear(&canvas);
        else {
            double x; int y;
            if (fscanf(in,"%lf %d %199s %15999s",&x,&y,code,text)!=4) return 2;
            unhex(code); unhex(text);
            if (count>=10000 || strlen(code)>=100) return 2;
            strcpy(codes[count],code);
            if (op=='S') canvas_string(&canvas,x,y,text,codes[count++]);
            else if (op=='D') canvas_char(&canvas,x,y,text,codes[count++]);
            else return 2;
        }
    }
    canvas_destroy(&canvas);
    printf("canvas=%zu random=%zu peak_dynamic=%zu groups=%d string=%d live=%zu\n",sizeof(Canvas),sizeof(Random),m.peak,canvas.peak_groups,canvas.peak_string,m.live);
    fclose(in); fclose(out); free(codes);
    return m.live ? 1:0;
}
