/* Board supplies an extended monotonic counter, blocking transfer, and wait. */
#define CREDITS_ANIMATOR_IMPLEMENTATION
#include "credits_animator.h"
extern uint64_t board_ticks(void);
extern uint32_t board_tick_frequency(void);
extern void board_vfd_write(const uint8_t *data,unsigned bytes);
extern void board_wait_until(CreditsTime deadline);
static CreditsAnimator animation;
void animation_task(void) {
    CreditsAnimatorConfig config=CREDITS_ANIMATOR_CONFIG_INIT;
    CreditsTime now=credits_time_from_counter(board_ticks(),board_tick_frequency());
    if(credits_animator_init(&animation,&config,now)) return;
    for(;;) {
        now=credits_time_from_counter(board_ticks(),board_tick_frequency());
        CreditsAnimatorResult result=credits_animator_update(&animation,now);
        if(result.status) break;
        if(result.frame_changed) {
            CreditsFrameView frame=credits_animator_frame(&animation);
            board_vfd_write(frame.data,frame.bytes); /* Must finish before next update. */
        }
        if(result.finished) break;
        board_wait_until(result.next_deadline);
    }
    credits_animator_destroy(&animation);
}
