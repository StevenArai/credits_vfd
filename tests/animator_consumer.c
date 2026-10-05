#ifdef MODULAR_ANIMATOR
#include "animator.h"
#else
#include "credits_animator.h"
#endif
#include <stdio.h>
static CreditsAnimator animator;
int main(void) {
    CreditsAnimatorConfig config=CREDITS_ANIMATOR_CONFIG_INIT;
    if(credits_animator_init(&animator,&config,0))return 1;
    unsigned long long hash=14695981039346656037ULL;
    unsigned updates=0;
    CreditsAnimatorResult r;
    do {
        r=credits_animator_update(&animator,credits_time_from_counter((uint64_t)updates++*17,1000));
        if(r.status)return 2;
        if(r.frame_changed) {
            CreditsFrameView f=credits_animator_frame(&animator);
            for(unsigned i=0;i<f.bytes;i++) hash=(hash^f.data[i])*1099511628211ULL;
        }
    } while(!r.finished && updates<20000);
    CreditsAnimatorStats s=credits_animator_stats(&animator);
    printf("%016llx %u %zu %zu %zu\n",hash,updates,s.object_bytes,s.workspace_capacity,s.workspace_used);
    credits_animator_destroy(&animator);
    return r.finished ? 0:3;
}
