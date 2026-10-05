#ifndef CREDITS_ANIMATOR_API_H
#define CREDITS_ANIMATOR_API_H
#include "credits.h"
#include "player_fixed.h"
#include "framebuffer.h"
typedef FixedTime CreditsTime;
typedef struct { uint64_t seed; int start_section,uppercase; } CreditsAnimatorConfig;
#define CREDITS_ANIMATOR_CONFIG_INIT {1,1,1}
enum { CREDITS_ANIMATOR_OK=0,CREDITS_ANIMATOR_BAD_CONFIG=1,CREDITS_ANIMATOR_BAD_TIME=2 };
enum { CREDITS_CONTROL_PAUSE=1,CREDITS_CONTROL_FORWARD_SMALL=2,CREDITS_CONTROL_FORWARD_MEDIUM=4,CREDITS_CONTROL_FORWARD_LARGE=8 };
/* Private members: allocate statically, never copy/move after init. */
typedef struct {
    Credits _core;
    FixedPlayer _player;
    Framebuffer _fb;
    CreditsAnimatorConfig _config;
    uint64_t _generation;
    unsigned _missing;
    int _initialized,_dirty,_finished;
} CreditsAnimator;
typedef struct {
    const uint8_t *data; /* Borrowed; valid until update/reset/destroy. MSB first. */
    unsigned width,height,stride,bytes;
    uint64_t generation;
} CreditsFrameView;
typedef struct {
    int status,frame_changed,finished,input_sampled,paused;
    CreditsTime position,next_deadline,lag; /* Wall-clock deadline, INT64_MAX when idle. */
} CreditsAnimatorResult;
typedef struct {
    size_t object_bytes,workspace_capacity,workspace_used,reserved_bytes;
    unsigned frames,scrolled_rows,clipped_cells,missing_glyphs;
    int beat;
} CreditsAnimatorStats;
CreditsTime credits_time_from_counter(uint64_t count,uint32_t frequency);
int credits_animator_init(CreditsAnimator *a,const CreditsAnimatorConfig *config,CreditsTime now);
/* Clock-only MCU entry. Does not block or access a platform clock. */
CreditsAnimatorResult credits_animator_update(CreditsAnimator *a,CreditsTime now);
/* Optional host audio/input adapter; ordinary MCU users need only update(). */
CreditsAnimatorResult credits_animator_sync(CreditsAnimator *a,CreditsTime now,CreditsTime media,unsigned controls,int active);
CreditsFrameView credits_animator_frame(const CreditsAnimator *a);
CreditsAnimatorStats credits_animator_stats(const CreditsAnimator *a);
void credits_animator_set_uppercase(CreditsAnimator *a,int enabled);
void credits_animator_destroy(CreditsAnimator *a);
#endif
