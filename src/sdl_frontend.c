#define SDL_MAIN_HANDLED
#include <SDL.h>
#include "animator.h"
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <stdio.h>
#include <limits.h>
#ifdef CREDITS_EMBEDDED_AUDIO
#include <windows.h>
#endif

/* Floating-point conversions stay in the host display/diagnostic adapter. */
static double time_seconds(CreditsTime value) { return (double)value/4294967296.0; }
static CreditsTime fixed_now(void) {
    Uint64 frequency=SDL_GetPerformanceFrequency();
    if(!frequency || frequency>UINT32_MAX) { fputs("unsupported host counter frequency\n",stderr); exit(1); }
    return credits_time_from_counter(SDL_GetPerformanceCounter(),(uint32_t)frequency);
}
/* Host owns decoded WAV and SDL's bounded queue. Core never sees SDL objects. */
typedef struct {
    SDL_AudioDeviceID device;
    SDL_AudioSpec spec;
    Uint8 *data;
    Uint32 length,submitted,frame_bytes;
    unsigned underruns;
    double bytes_per_second;
} Audio;
static void fail(const char *message) {
    fprintf(stderr,"%s: %s\n",message,SDL_GetError()); exit(1);
}
static void audio_fill(Audio *a) {
    Uint32 queued=SDL_GetQueuedAudioSize(a->device);
    Uint32 target=8192*a->frame_bytes;
    if (!queued && a->submitted && a->submitted<a->length &&
        SDL_GetAudioDeviceStatus(a->device)==SDL_AUDIO_PLAYING) a->underruns++;
    if (queued<target && a->submitted<a->length) {
        Uint32 count=target-queued;
        if (count>a->length-a->submitted) count=a->length-a->submitted;
        count-=count%a->frame_bytes;
        if (SDL_QueueAudio(a->device,a->data+a->submitted,count)) fail("queue audio");
        a->submitted+=count;
    }
}
static double audio_position(Audio *a) {
    return (a->submitted-SDL_GetQueuedAudioSize(a->device))/a->bytes_per_second;
}
static void audio_seek(Audio *a,double position) {
    SDL_PauseAudioDevice(a->device,1);
    SDL_ClearQueuedAudio(a->device);
    double frames=floor(position*a->spec.freq);
    double limit=a->length/a->frame_bytes;
    if (frames<0) frames=0;
    if (frames>limit) frames=limit;
    a->submitted=(Uint32)frames*a->frame_bytes;
    audio_fill(a);
}
enum { BORDER=48, PITCH=3, WIDTH=256*PITCH+2*BORDER, HEIGHT=128*PITCH+2*BORDER };
enum { SLIDER_LEFT=270, SLIDER_WIDTH=324, SLIDER_Y=456 };
static Uint32 phosphor(double value) {
    static const Uint32 anchors[]={0x00cfa0,0x00e89b,0x20e6a0,0x00ffc0};
    if (value<=0) return 0xff000000|anchors[0];
    if (value>=1) return 0xff000000|anchors[3];
    double scaled=value*3; int index=(int)scaled; double part=scaled-index;
    Uint32 color=0xff000000;
    for (int shift=0;shift<=16;shift+=8) {
        int a=(anchors[index]>>shift)&255,b=(anchors[index+1]>>shift)&255;
        color|=(Uint32)(a+(b-a)*part+0.5)<<shift;
    }
    return color;
}
static void expand(const CreditsFrameView *f,Uint32 *pixels,double color_position) {
    Uint32 lit=phosphor(color_position);
    /* Black gaps and bezel persist; only 2x2 physical phosphor blocks change. */
    for (int y=0;y<128;y++) for (int x=0;x<256;x++) {
        Uint32 color=((f->data[y*f->stride+x/8]>>(7-x%8))&1) ? lit:0xff161914;
        int base=(BORDER+y*PITCH)*WIDTH+BORDER+x*PITCH;
        pixels[base]=pixels[base+1]=pixels[base+WIDTH]=pixels[base+WIDTH+1]=color;
    }
    /* Host control outside the 256x128 VFD; never changes core framebuffer. */
    for (int y=SLIDER_Y-8;y<=SLIDER_Y+8;y++)
        for (int x=SLIDER_LEFT-5;x<=SLIDER_LEFT+SLIDER_WIDTH+5;x++) pixels[y*WIDTH+x]=0xff000000;
    for (int x=0;x<=SLIDER_WIDTH;x++) for (int y=-2;y<=2;y++)
        pixels[(SLIDER_Y+y)*WIDTH+SLIDER_LEFT+x]=phosphor((double)x/SLIDER_WIDTH);
    int handle=SLIDER_LEFT+(int)(color_position*SLIDER_WIDTH+0.5);
    for (int y=-7;y<=7;y++) for (int x=-2;x<=2;x++) pixels[(SLIDER_Y+y)*WIDTH+handle+x]=0xffeeeeee;
}
static double seconds(void) { return (double)SDL_GetPerformanceCounter()/SDL_GetPerformanceFrequency(); }
static long number(const char *value,long low,long high) {
    char *end; long n=strtol(value,&end,10);
    if (!*value || *end || n<low || n>high) fail("invalid numeric option");
    return n;
}
int main(int argc,char **argv) {
    const char *wav=NULL,*snapshot=NULL;
    int jump=1,limit=0,scripted=0,hidden=0,uppercase=1; uint64_t seed=1;
    for (int i=1;i<argc;i++) {
        if (!strcmp(argv[i],"--help")) {
            puts("credits_sdl [--audio credits.wav] [--jump 1..6] [--seed N]\n"
                 "            [--seconds N] [--snapshot frame.bmp] [--scripted]\n"
                 "P pause, , . / forward, 1..6 restart, U uppercase, drag color bar, Esc quit.\n"
                 "--original-case preserves lowercase in framebuffer."); return 0;
        }
        if (!strcmp(argv[i],"--scripted")) { scripted=1; continue; }
        if (!strcmp(argv[i],"--hidden")) { hidden=1; continue; }
        if (!strcmp(argv[i],"--original-case")) { uppercase=0; continue; }
        if (i+1>=argc) fail("missing option value");
        if (!strcmp(argv[i],"--audio")) wav=argv[++i];
        else if (!strcmp(argv[i],"--snapshot")) snapshot=argv[++i];
        else if (!strcmp(argv[i],"--jump")) jump=(int)number(argv[++i],1,6);
        else if (!strcmp(argv[i],"--seconds")) limit=(int)number(argv[++i],1,3600);
        else if (!strcmp(argv[i],"--seed")) seed=(uint64_t)number(argv[++i],0,2147483647);
        else fail("unknown option");
    }
    SDL_SetMainReady();
    SDL_SetHint(SDL_HINT_WINDOWS_DPI_AWARENESS,"permonitorv2");
    if (SDL_Init(SDL_INIT_VIDEO|SDL_INIT_AUDIO|SDL_INIT_TIMER)) fail("SDL init");
    Audio audio={0};
#ifdef CREDITS_EMBEDDED_AUDIO
    if (!wav) {
        HMODULE module=GetModuleHandleW(NULL);
        HRSRC resource=FindResourceW(module,MAKEINTRESOURCEW(101),MAKEINTRESOURCEW(10));
        HGLOBAL loaded=resource ? LoadResource(module,resource):NULL;
        const void *bytes=loaded ? LockResource(loaded):NULL;
        DWORD size=resource ? SizeofResource(module,resource):0;
        if (!bytes || !size || size>INT_MAX) {
            SDL_SetError("embedded WAV resource missing or too large"); fail("load WAV resource");
        }
        SDL_RWops *stream=SDL_RWFromConstMem(bytes,(int)size);
        if (!stream || !SDL_LoadWAV_RW(stream,1,&audio.spec,&audio.data,&audio.length)) fail("load embedded WAV");
        wav="embedded";
    } else
#endif
    {
        if (!wav) wav="credits.wav";
        if (!SDL_LoadWAV(wav,&audio.spec,&audio.data,&audio.length)) fail("load WAV");
    }
    audio.spec.samples=512; audio.spec.callback=NULL;
    audio.device=SDL_OpenAudioDevice(NULL,0,&audio.spec,NULL,0);
    if (!audio.device) fail("open audio device");
    audio.frame_bytes=(SDL_AUDIO_BITSIZE(audio.spec.format)/8)*audio.spec.channels;
    audio.bytes_per_second=(double)audio.spec.freq*audio.frame_bytes;
    SDL_Window *window=SDL_CreateWindow("Credits VFD — P pause | 1–6 jump | Esc quit",
        SDL_WINDOWPOS_CENTERED,SDL_WINDOWPOS_CENTERED,WIDTH,HEIGHT,hidden ? SDL_WINDOW_HIDDEN:0);
    if (!window) fail("create window");
    SDL_Renderer *renderer=SDL_CreateRenderer(window,-1,SDL_RENDERER_ACCELERATED);
    if (!renderer) renderer=SDL_CreateRenderer(window,-1,SDL_RENDERER_SOFTWARE);
    if (!renderer) fail("create renderer");
    SDL_Texture *texture=SDL_CreateTexture(renderer,SDL_PIXELFORMAT_ARGB8888,SDL_TEXTUREACCESS_STREAMING,WIDTH,HEIGHT);
    if (!texture) fail("create texture");
    Uint32 *pixels=calloc((size_t)WIDTH*HEIGHT,sizeof(*pixels));
    static CreditsAnimator animation;
    CreditsAnimator *a=&animation;
    unsigned max_scrolled=0;
    if (!pixels || !a) fail("allocate host state");
    CreditsAnimatorConfig config={seed,jump,uppercase};
    CreditsTime origin=fixed_now();
    if(credits_animator_init(a,&config,origin)) fail("animator init");
    CreditsAnimatorResult state=credits_animator_update(a,origin);
    audio_seek(&audio,time_seconds(state.position));
    SDL_PauseAudioDevice(audio.device,0);
    double start=seconds(),max_compute=0,max_backlog=0,paused_position=-1;
    unsigned presented=0,missing=0,pending=0; int quit=0,script_stage=0,saved=0;
    double color_position=1.0/3; int dragging=0,dirty=1,ui_test_sent=0;
    const char *exit_reason="unknown";
    fprintf(stderr,"audio=%s backend=%s rate=%d duration=%.6f wav_bytes=%u queue_limit=%u device_frames=%u host_pixels=%zu core=%zu framebuffer=%zu\n",
        wav,SDL_GetCurrentAudioDriver(),audio.spec.freq,audio.length/audio.bytes_per_second,
        audio.length,8192*audio.frame_bytes,audio.spec.samples,(size_t)WIDTH*HEIGHT*4,sizeof(*a),(size_t)4096);
    while (!quit) {
        SDL_Event event; unsigned pressed=0;
        while (SDL_PollEvent(&event)) {
            if (event.type==SDL_QUIT) { quit=1; exit_reason="window-close"; }
            if (event.type==SDL_KEYDOWN) {
                SDL_Keycode key=event.key.keysym.sym;
                if (key==SDLK_ESCAPE) { quit=1; exit_reason="escape"; }
                if (key==SDLK_u && !event.key.repeat) { uppercase=!uppercase; dirty=1; }
                if (key==SDLK_p) pressed|=CREDITS_CONTROL_PAUSE;
                if (key==SDLK_COMMA) pressed|=CREDITS_CONTROL_FORWARD_SMALL;
                if (key==SDLK_PERIOD) pressed|=CREDITS_CONTROL_FORWARD_MEDIUM;
                if (key==SDLK_SLASH) pressed|=CREDITS_CONTROL_FORWARD_LARGE;
                if (key>=SDLK_1 && key<=SDLK_6) {
                    SDL_PauseAudioDevice(audio.device,1);
                    config.start_section=(int)(key-SDLK_1+1); config.uppercase=uppercase;
                    origin=fixed_now();
                    if(credits_animator_init(a,&config,origin)) fail("animator restart");
                    state=credits_animator_update(a,origin);
                    audio_seek(&audio,time_seconds(state.position)); SDL_PauseAudioDevice(audio.device,0);
                }
            }
            if (event.type==SDL_MOUSEBUTTONDOWN && event.button.button==SDL_BUTTON_LEFT &&
                abs(event.button.y-SLIDER_Y)<=12 && event.button.x>=SLIDER_LEFT-8 && event.button.x<=SLIDER_LEFT+SLIDER_WIDTH+8) dragging=1;
            if (dragging && (event.type==SDL_MOUSEMOTION || event.type==SDL_MOUSEBUTTONDOWN)) {
                int x=event.type==SDL_MOUSEMOTION ? event.motion.x:event.button.x;
                color_position=(double)(x-SLIDER_LEFT)/SLIDER_WIDTH;
                if (color_position<0) color_position=0;
                if (color_position>1) color_position=1;
                dirty=1;
            }
            if (event.type==SDL_MOUSEBUTTONUP) dragging=0;
        }
        const Uint8 *keys=SDL_GetKeyboardState(NULL);
        pending|=pressed;
        unsigned input=pending|(keys[SDL_SCANCODE_P] ? CREDITS_CONTROL_PAUSE:0)|
            (keys[SDL_SCANCODE_COMMA] ? CREDITS_CONTROL_FORWARD_SMALL:0)|(keys[SDL_SCANCODE_PERIOD] ? CREDITS_CONTROL_FORWARD_MEDIUM:0)|
            (keys[SDL_SCANCODE_SLASH] ? CREDITS_CONTROL_FORWARD_LARGE:0);
        double now=seconds(),elapsed=now-start;
        if (scripted) {
            if (elapsed>2.5 && !ui_test_sent) {
                SDL_Event click={0}; click.type=SDL_MOUSEBUTTONDOWN; click.button.button=SDL_BUTTON_LEFT;
                click.button.x=SLIDER_LEFT+SLIDER_WIDTH; click.button.y=SLIDER_Y;
                SDL_PushEvent(&click); click.type=SDL_MOUSEBUTTONUP; SDL_PushEvent(&click);
                SDL_Event key={0}; key.type=SDL_KEYDOWN; key.key.keysym.sym=SDLK_u; SDL_PushEvent(&key);
                ui_test_sent=1;
            }
            if (elapsed>1 && script_stage==0) { input|=CREDITS_CONTROL_PAUSE; if (state.paused) script_stage=1; }
            if (elapsed>1.3 && script_stage==1 && state.paused) {
                if (paused_position<0) paused_position=audio_position(&audio);
                if (fabs(audio_position(&audio)-paused_position)>1e-9) fail("pause clock moved");
            }
            if (elapsed>2 && script_stage==1) { input|=CREDITS_CONTROL_PAUSE; if (!state.paused) script_stage=2; }
            if (elapsed>3 && elapsed<3.2) input|=CREDITS_CONTROL_FORWARD_LARGE;
        }
        Uint32 consumed=audio.submitted-SDL_GetQueuedAudioSize(audio.device);
        CreditsTime media_time=credits_time_from_counter(consumed,(uint32_t)audio.spec.freq*audio.frame_bytes);
        double media=time_seconds(media_time); int was_paused=state.paused;
        int active=consumed<audio.length;
        credits_animator_set_uppercase(a,uppercase);
        state=credits_animator_sync(a,fixed_now(),media_time,input,active);
        if(state.status) fail("animator clock");
        int result=state.frame_changed;
        if (state.input_sampled) pending=0;
        double compute=seconds()-now; if (compute>max_compute) max_compute=compute;
        if (time_seconds(state.position)>media+0.5/audio.spec.freq) audio_seek(&audio,time_seconds(state.position));
        if (state.paused!=was_paused || time_seconds(state.position)>media+0.5/audio.spec.freq)
            SDL_PauseAudioDevice(audio.device,state.paused);
        audio_fill(&audio);
        double backlog=time_seconds(state.lag);
        CreditsAnimatorStats stats=credits_animator_stats(a);
        if (stats.beat<6508 && backlog>max_backlog) max_backlog=backlog;
        if (result || !presented || dirty) {
            if (stats.scrolled_rows>max_scrolled) max_scrolled=stats.scrolled_rows;
            CreditsFrameView frame=credits_animator_frame(a);
            missing+=stats.missing_glyphs; expand(&frame,pixels,color_position);
            if (dirty) {
                char title[160];
                snprintf(title,sizeof(title),"Credits VFD 60x20 | #%06X | U uppercase: %s | drag color bar | P pause | 1-6 jump",(unsigned)(phosphor(color_position)&0xffffff),uppercase ? "ON":"OFF");
                SDL_SetWindowTitle(window,title); dirty=0;
            }
            if (SDL_UpdateTexture(texture,NULL,pixels,WIDTH*4)) fail("upload texture");
            SDL_RenderClear(renderer); SDL_RenderCopy(renderer,texture,NULL,NULL); presented++;
            if (snapshot && !saved && elapsed>1.5) {
                SDL_Surface *surface=SDL_CreateRGBSurfaceWithFormat(0,WIDTH,HEIGHT,32,SDL_PIXELFORMAT_ARGB8888);
                if (!surface || SDL_RenderReadPixels(renderer,NULL,SDL_PIXELFORMAT_ARGB8888,surface->pixels,surface->pitch)) fail("read display pixels");
                /* Renderer may force opaque alpha; compare the visible RGB. */
                for (int y=0;y<HEIGHT;y++) for (int x=0;x<WIDTH;x++)
                    if ((((Uint32 *)((Uint8 *)surface->pixels+y*surface->pitch))[x]&0xffffff)!=(pixels[y*WIDTH+x]&0xffffff)) fail("display pixel mismatch");
                if (SDL_SaveBMP(surface,snapshot)) fail("save snapshot");
                fprintf(stderr,"display_readback=matched %dx%d\n",WIDTH,HEIGHT);
                SDL_FreeSurface(surface); saved=1;
            }
            SDL_RenderPresent(renderer);
        }
        if (!active) { quit=1; exit_reason="audio-eof"; }
        else if (limit && elapsed>=limit) { quit=1; exit_reason="time-limit"; }
        SDL_Delay(1);
    }
    SDL_PauseAudioDevice(audio.device,1);
    CreditsAnimatorStats stats=credits_animator_stats(a);
    fprintf(stderr,"layout=direct60 char_buf_bytes=%zu scrolled_rows=%u clipped_cells=%u\n",(size_t)4800,max_scrolled,stats.clipped_cells);
    fprintf(stderr,"exit_reason=%s\n",exit_reason);
    fprintf(stderr,"phosphor=#%06X uppercase=%d\n",(unsigned)(phosphor(color_position)&0xffffff),uppercase);
    fprintf(stderr,"presented=%u beat=%d audio_position=%.6f wall_seconds=%.6f max_compute_ms=%.3f max_backlog_ms=%.3f missing_glyph_cells=%u script_stage=%d underruns=%u\n",
        presented,stats.beat,audio_position(&audio),seconds()-start,max_compute*1000,max_backlog*1000,missing,script_stage,audio.underruns);
    credits_animator_destroy(a); fprintf(stderr,"workspace_used=%zu core_live=%zu heap_bytes=0\n",stats.workspace_used,credits_animator_stats(a).reserved_bytes);
    free(pixels); SDL_CloseAudioDevice(audio.device); SDL_FreeWAV(audio.data);
    SDL_DestroyTexture(texture); SDL_DestroyRenderer(renderer); SDL_DestroyWindow(window); SDL_Quit(); return 0;
}
