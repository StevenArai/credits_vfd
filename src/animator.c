#include "animator.h"
#include <limits.h>
#include <string.h>
CreditsTime credits_time_from_counter(uint64_t count,uint32_t frequency) {
    return fixed_time_ratio(count,frequency);
}
int credits_animator_init(CreditsAnimator *a,const CreditsAnimatorConfig *config,CreditsTime now) {
    if(!a || !config || config->start_section<1 || config->start_section>6 || now<0)
        return CREDITS_ANIMATOR_BAD_CONFIG;
    credits_init(&a->_core,config->seed);
    fixed_player_init(&a->_player,&a->_core,config->start_section,now);
    memset(&a->_fb,0,sizeof(a->_fb));
    a->_config=*config; a->_generation=0; a->_missing=0;
    a->_initialized=1; a->_dirty=1; a->_finished=0;
    return CREDITS_ANIMATOR_OK;
}
CreditsAnimatorResult credits_animator_sync(CreditsAnimator *a,CreditsTime now,CreditsTime media,unsigned controls,int active) {
    CreditsAnimatorResult r={0}; r.next_deadline=INT64_MAX;
    if(!a || !a->_initialized) { r.status=CREDITS_ANIMATOR_BAD_CONFIG; return r; }
    FixedPlayer *p=&a->_player;
    r.position=p->position; r.finished=a->_finished; r.paused=p->paused;
    if(now<0 || media<0 || now<p->last_time) { r.status=CREDITS_ANIMATOR_BAD_TIME; return r; }
    if(a->_finished) return r;
    CreditsTime last_input=p->last_update;
    int changed=fixed_player_sync(p,now,media,controls,active,6508);
    r.input_sampled=last_input!=p->last_update;
    if(changed || a->_dirty) {
        a->_missing=framebuffer_render60(&a->_fb,a->_core.canvas.cells,a->_config.uppercase);
        a->_generation++; a->_dirty=0; r.frame_changed=1;
    }
    r.position=p->position; r.paused=p->paused; r.lag=p->position-p->next_beat;
    a->_finished=!p->active || a->_core.scheduler.beat>=6508;
    r.finished=a->_finished;
    if(!r.finished && !p->paused) {
        CreditsTime delay=p->next_beat-p->position;
        if(delay<0) delay=0;
        if(now<INT64_MAX-delay) r.next_deadline=now+delay+1;
    }
    return r;
}
CreditsAnimatorResult credits_animator_update(CreditsAnimator *a,CreditsTime now) {
    CreditsAnimatorResult bad={0}; bad.next_deadline=INT64_MAX;
    if(!a || !a->_initialized) { bad.status=CREDITS_ANIMATOR_BAD_CONFIG; return bad; }
    FixedPlayer *p=&a->_player;
    if(now<0 || now<p->last_time || now-p->last_time>INT64_MAX-p->position) {
        bad.status=CREDITS_ANIMATOR_BAD_TIME; return bad;
    }
    CreditsTime media=p->position+(p->paused ? 0:now-p->last_time);
    return credits_animator_sync(a,now,media,0,1);
}
CreditsFrameView credits_animator_frame(const CreditsAnimator *a) {
    CreditsFrameView v={0};
    if(a && a->_initialized) v=(CreditsFrameView){a->_fb.bits,256,128,32,4096,a->_generation};
    return v;
}
CreditsAnimatorStats credits_animator_stats(const CreditsAnimator *a) {
    CreditsAnimatorStats s={0};
    if(a && a->_initialized) s=(CreditsAnimatorStats){sizeof(*a),a->_core.memory.capacity,a->_core.memory.used,
        a->_core.memory.live,a->_core.frames,a->_core.canvas.scrolled_rows,a->_core.canvas.clipped_cells,a->_missing,a->_core.scheduler.beat};
    return s;
}
void credits_animator_set_uppercase(CreditsAnimator *a,int enabled) {
    if(a && a->_initialized && a->_config.uppercase!=!!enabled) {
        a->_config.uppercase=!!enabled; a->_dirty=1;
    }
}
void credits_animator_destroy(CreditsAnimator *a) {
    if(a && a->_initialized) { credits_destroy(&a->_core); a->_initialized=0; }
}
