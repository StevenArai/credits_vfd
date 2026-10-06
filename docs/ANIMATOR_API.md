# Animator 单头文件接口

MCU 不播放音乐：外部提供单调时钟，核心顺序推进动画并生成画面。没有待确定的显示回调协议；调用方主动读取 framebuffer。SDL 使用同一封装，音频和窗口仍在主机适配层。

## 集成

将 `include/credits_animator.h` 放入工程。仅在一个 C 文件中、首次 include 前定义 `CREDITS_ANIMATOR_IMPLEMENTATION`；其他文件直接 include。默认 C99。完整板端接口示例见 `examples/animator_mcu.c`，需要实现其中四个 board 函数。

```c
#define CREDITS_ANIMATOR_IMPLEMENTATION
#include "credits_animator.h"
static CreditsAnimator animation;

/* 初始化时 */
CreditsAnimatorConfig config = CREDITS_ANIMATOR_CONFIG_INIT;
/* now 为外部单调计数器换算的 Q32.32 秒 */
int error = credits_animator_init(&animation, &config, now);

/* 主循环中，检查 error 后 */
CreditsAnimatorResult result = credits_animator_update(&animation, now);
if (result.status == CREDITS_ANIMATOR_OK && result.frame_changed) {
    CreditsFrameView frame = credits_animator_frame(&animation);
    /* 将 frame.data 传给自己的显示驱动 */
}
```

配置默认 seed=1、start_section=1、uppercase=1；start_section 可取 1–6。字体及全部绘制封装在核心内。实例建议静态分配；初始化后内部含指向自身工作区的指针，禁止按值复制或移动。不同实例独立，调用方负责同一实例的串行访问。

## 时钟与调度

`credits_time_from_counter(count, frequency)` 将外部计数器转换为有符号 Q32.32 秒。frequency 必须非零；秒数不能超过 INT32_MAX。32 位硬件计数器须在板端扩展回绕，提供单调 uint64_t 计数。每次从绝对计数换算，勿累加已截断的单次时间增量。Q32.32 的量化精度不等于硬件计时器精度，时钟本身的频差仍会影响 pace。

`init(..., now)` 记录起点；`update(..., now)` 不读取硬件时钟、不等待。动画保留原来的开场偏移和节拍。重复时间戳不重复推进，倒退时间返回 BAD_TIME。延迟调用会按顺序补算所有到期节拍（包括 RNG/状态），仅光栅化最后一帧。因此长时间停顿后补算可能耗时，接口不是任意时刻 O(1) 随机访问。

首次 update 发布初始画面；之后依据 frame_changed 传输。next_deadline 是与 now 同一时基的绝对截止时间，单位仍是 Q32.32 秒。板端等待应向上取整到硬件 tick，过期则直接继续。暂停或完成时返回 INT64_MAX。最终拍 6508 后 finished=1，主循环可以停止，不要等待 INT64_MAX。position 是播放位置；lag 是播放位置减下一拍时间，可为负。

`credits_animator_sync` 是可选的主机音频/输入入口，传入媒体位置、控制位和 active；保留原播放器输入采样节奏，input_sampled 表示本次已采样。普通无音乐 MCU 只需 update。完成后不再处理控制；重播或跳场景调用 init。set_uppercase 标脏，在下一次未结束的 update 重绘。

## 帧与生命周期

视图为 256×128、1bpp、stride=32、bytes=4096；按行存储，每字节最高位对应左侧像素，1 为点亮。generation 随发布递增。只有一张 framebuffer，其地址在实例生命周期内固定。字符行为在内部 60×20 char_buf 中处理，fb 只负责光栅化。

frame.data 是只读借用，下一次 update、重新 init 或 destroy 前必须消费完。DMA 应完成后再调用更新；库不为异步传输额外复制帧。init 可重置已初始化实例；destroy 结束借用并使实例失效。未初始化实例应先置零或直接 init，不能对未初始化的自动变量调用其他 API。

stats 提供对象大小、工作区容量/使用量、预留载荷、帧数、裁剪、滚动及当前缺字数。BAD_CONFIG/BAD_TIME 是可恢复的参数错误。内部容量不足等不变量失败走 panic：默认 fprintf/abort；MCU 可在实现 include 前定义 `CREDITS_ANIMATOR_PANIC(message)` 并提供已声明的处理函数。处理函数如返回，核心仍停在无限循环，避免继续越界执行。

## 内存与可移植范围

Cortex-M3的逐成员、文本/历史容量及20 KiB SRAM分析见 [RAM_USAGE.md](RAM_USAGE.md)。

当前核心将初始化数据和历史预留在实例工作区，32 次初始化预留，播放期间零预留；没有显式 malloc/calloc/realloc/free 调用。所有容量有检查，不允许越界静默截断。不要把工作区载荷再次加到 sizeof(Animator)。

| 项目 | Windows x64 | ARM ABI / Cortex-M3 编译探针 |
| --- | ---: | ---: |
| 整个 CreditsAnimator（含工作区、播放器、fb） | 40504 B | 34752 B |
| 内含 framebuffer | 4096 B | 4096 B |
| 内含字符画布及元数据 | 4812 B | 4812 B |

ARM 对象约 33.94 KiB，32 KiB RAM 容纳不了整个对象。这里未计调用栈、板端驱动、少量独立静态数据和目标 libc 内部开销。只读表/代码适合 XIP，但当前未完成目标固件链接，不能给出真实 MCU ROM 或周期预算。

这不是 freestanding/no-libc 实现：仍使用整数snprintf、sscanf、字符串函数及默认错误处理。原生天气已改float与小表正弦，不调用sin或浮点printf；终端参考和宿主适配保留double。核心无显式堆调用不保证目标libc内部完全不分配。误差、像素变化与F401代码生成审计见 [NATIVE_FLOAT.md](NATIVE_FLOAT.md)。

## 维护与验证

修改 src 后运行 `python tools/export_animator_header.py`；`--check` 验证发布头与源同步，不手改生成头。该文件是源代码分发，并非编译后二进制大小。

已实际验证 Windows Clang C99、多文件/单头独立实现和使用者编译、全曲输出相同、18 组时钟回放（3 seed × 6 起点）、暂停延迟补算相关回归、重复/倒退时间、实例隔离及重新初始化。MCU 示例仅编译为主机目标文件；板函数未链接，未宣称 MCU 已运行。资源和验证记录见 `validation/2026-10-06/animator-library/`。
