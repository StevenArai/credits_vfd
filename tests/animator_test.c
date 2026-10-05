#include "animator.h"
#include <stdio.h>
#include <string.h>
#define CHECK(x) do { if(!(x)) { fprintf(stderr,"animator line %d\n",__LINE__); return 1; } } while(0)
int main(void) {
    static CreditsAnimator a,other;
    static Credits reference;
    unsigned frames=0;
    for(int seed=0;seed<3;seed++) for(int jump=1;jump<=6;jump++) {
        CreditsAnimatorConfig config={(uint64_t)(seed==2 ? 42:seed),jump,1};
        CreditsTime now=1234*FIXED_SECOND;
        CHECK(!credits_animator_init(&a,&config,now));
        credits_init(&reference,config.seed); FixedPlayer player;
        fixed_player_init(&player,&reference,jump,now);
        CreditsFrameView first=credits_animator_frame(&a);
        CHECK(first.data && first.bytes==4096 && first.width==256 && first.height==128 && first.stride==32);
        size_t reservations=a._core.memory.calls;
        int finished=0;
        for(int poll=0;!finished;poll++) {
            CHECK(poll<30000);
            if(poll) now+=credits_time_from_counter(poll%97==0 ? 2000:17,1000);
            FixedTime media=player.position+now-player.last_time;
            fixed_player_sync(&player,now,media,0,1,6508);
            CreditsAnimatorResult r=credits_animator_update(&a,now);
            CHECK(!r.status && (r.finished || r.next_deadline>now));
            Framebuffer expected; framebuffer_render60(&expected,reference.canvas.cells,1);
            CreditsFrameView actual=credits_animator_frame(&a);
            CHECK(actual.data==first.data && !memcmp(actual.data,expected.bits,4096));
            CHECK(!memcmp(&a._core.random,&reference.random,sizeof(Random)));
            CHECK(a._core.memory.calls==reservations);
            CHECK(a._core.frames==reference.frames);
            CreditsAnimatorResult repeated=credits_animator_update(&a,now);
            CHECK(!repeated.status && !repeated.frame_changed);
            CreditsAnimatorResult backwards=credits_animator_update(&a,now-1);
            CHECK(backwards.status==CREDITS_ANIMATOR_BAD_TIME);
            finished=r.finished; frames+=r.frame_changed;
        }
        CHECK(credits_animator_update(&a,now+FIXED_SECOND).finished);
        credits_animator_destroy(&a);credits_destroy(&reference);
        CHECK(!credits_animator_frame(&a).data && !a._core.memory.live && !reference.memory.live);
    }
    CreditsAnimatorConfig config=CREDITS_ANIMATOR_CONFIG_INIT;
    CHECK(!credits_animator_init(&a,&config,0));
    CHECK(credits_animator_update(&a,0).frame_changed);
    credits_animator_set_uppercase(&a,0);
    CHECK(credits_animator_update(&a,0).frame_changed);
    CHECK(!credits_animator_update(&a,10*FIXED_SECOND).status);
    uint8_t saved[4096]; memcpy(saved,credits_animator_frame(&a).data,4096);
    CHECK(!credits_animator_init(&other,&config,0));
    CHECK(!credits_animator_update(&other,20*FIXED_SECOND).status);
    CHECK(credits_animator_frame(&a).data!=credits_animator_frame(&other).data);
    CHECK(!memcmp(saved,credits_animator_frame(&a).data,4096));
    credits_animator_destroy(&other);
    /* Re-init an active object is a complete reset; no cleanup allocation needed. */
    CHECK(!credits_animator_init(&a,&config,0));
    CHECK(!credits_animator_stats(&a).frames && credits_animator_update(&a,0).frame_changed);
    CreditsAnimatorStats s=credits_animator_stats(&a);
    printf("18 full clock-only replays, %u presented frames; object=%zu arena=%zu used=%zu; no playback reservations\n",frames,s.object_bytes,s.workspace_capacity,s.workspace_used);
    credits_animator_destroy(&a);return 0;
}
