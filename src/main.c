#include "credits.h"
#include "terminal.h"
#include "host_time.h"
#include "host_console.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
static FILE *open_file(const char *path,const char *mode) {
    FILE *f=fopen(path,mode); if (!f) credits_fail("cannot open output file"); return f;
}
static void trace(void *context,int beat,int index) { fprintf(context,"%d %d\n",beat,index); }
static long parse_int(const char *text,long low,long high) {
    char *end; errno=0; long n=strtol(text,&end,10);
    if (errno || !*text || *end || n<low || n>high) credits_fail("invalid integer option or value outside supported range");
    return n;
}
static void state_file(Credits *a,const char *path) {
    FILE *f=open_file(path,"w");
    fprintf(f,"{\"beat\":%d,\"ocean_time\":%d,\"active\":[",a->scheduler.beat,a->ocean_time);
    for (int i=0;i<a->scheduler.count;i++) {
        int s=a->scheduler.active[i];
        fprintf(f,"%s[\"%s\",%d,%d]",i ? ",":"",scene_definitions[s].name,a->scenes[s].start,a->scenes[s].internal);
    }
    fputs("],\"rng\":[",f);
    for (int i=0;i<624;i++) fprintf(f,"%s%u",i ? ",":"",a->random.mt[i]);
    fprintf(f,",%d]}\n",a->random.index); fclose(f);
}
int main(int argc,char **argv) {
    uint64_t seed=1; int last=6508,jump=1,play=argc==1,menu=1;
    const char *frames_path=NULL,*ansi_path=NULL,*state_path=NULL,*trace_path=NULL,*data_path=NULL;
    for (int i=1;i<argc;i++) {
        if (!strcmp(argv[i],"--self-test")) { puts("C99 host baseline: 80 x 24 cells"); return 0; }
        if (!strcmp(argv[i],"--play")) { play=1; continue; }
        if (!strcmp(argv[i],"--help")) {
            puts("credits [--play] [--jump 1..6] [--seed N] [--last BEAT]\n"
                 "        [--replay frames.bin] [--ansi file|-] [--state file] [--trace file]\n"
                 "No options: silent-clock playback with a two-second jump menu.\n"
                 "Controls: p pause/resume; , . / advance; Ctrl+C stop. No audio."); return 0;
        }
        if (i+1>=argc) credits_fail("option requires a value");
        if (!strcmp(argv[i],"--seed")) {
            char *end; const char *value=argv[++i]; errno=0; seed=strtoull(value,&end,10);
            if (errno || !*value || *end || *value=='-') credits_fail("seed must be an unsigned 64-bit integer");
        }
        else if (!strcmp(argv[i],"--last")) last=(int)parse_int(argv[++i],-1,6508);
        else if (!strcmp(argv[i],"--jump")) { jump=(int)parse_int(argv[++i],1,6); menu=0; }
        else if (!strcmp(argv[i],"--replay")) frames_path=argv[++i];
        else if (!strcmp(argv[i],"--ansi")) ansi_path=argv[++i];
        else if (!strcmp(argv[i],"--state")) state_path=argv[++i];
        else if (!strcmp(argv[i],"--trace")) trace_path=argv[++i];
        else if (!strcmp(argv[i],"--dump-data")) data_path=argv[++i];
        else credits_fail("unknown option");
    }
    if (play && (frames_path || ansi_path || data_path || state_path || trace_path)) credits_fail("choose interactive playback or file replay");
    Credits *a=malloc(sizeof(*a)); if (!a) credits_fail("cannot allocate core");
    credits_init(a,seed);
    if (play) {
        int status=host_play(a,jump,menu,last);
        credits_destroy(a); if (a->memory.live) credits_fail("core memory not fully released");
        free(a); return status;
    }
    credits_jump(a,jump);
    if (data_path) {
        FILE *f=open_file(data_path,"wb");
        fwrite(&a->ocean_time,4,1,f);
        for (int i=0;i<TEXT_COUNT;i++) {
            Text *t=&a->texts[i]; int header[]={t->bytes,t->line_count,t->repeat};
            fwrite(header,4,3,f); fwrite(t->raw,1,(size_t)t->bytes+1,f);
        }
        fclose(f);
    }
    FILE *frames=frames_path ? open_file(frames_path,"wb"):NULL;
    FILE *ansi=ansi_path ? (!strcmp(ansi_path,"-") ? stdout:open_file(ansi_path,"wb")):NULL;
    FILE *events=trace_path ? open_file(trace_path,"w"):NULL;
    a->trace_event=events ? trace:NULL; a->trace_context=events;
    double total=0,maximum=0;
    while (a->scheduler.beat<last) {
        double before=host_seconds(); credits_next(a,1); double elapsed=host_seconds()-before;
        total+=elapsed; if (elapsed>maximum) maximum=elapsed;
        if (frames) { int32_t beat=a->scheduler.beat; fwrite(&beat,4,1,frames); fwrite(a->canvas.cells,4,CANVAS_CELLS,frames); }
        if (ansi) terminal_render(ansi,a->canvas.cells);
    }
    if (frames) fclose(frames);
    if (ansi) fclose(ansi);
    if (events) fclose(events);
    if (state_path) state_file(a,state_path);
    fprintf(stderr,"frames=%u events=%u state=%zu readonly_data=%zu dynamic_peak=%zu allocations=%zu max_groups=%d max_string=%d history_peaks=%d,%d,%d mean_us=%.3f max_us=%.3f\n",
        a->frames,a->events_executed,sizeof(*a),data_readonly_size(),a->memory.peak,a->memory.calls,a->canvas.peak_groups,a->canvas.peak_string,
        a->history[0].peak,a->history[1].peak,a->history[2].peak,a->frames ? total*1e6/a->frames:0,maximum*1e6);
    credits_destroy(a);
    size_t leaked=a->memory.live; free(a);
    if (leaked) credits_fail("core memory not fully released");
    return 0;
}
