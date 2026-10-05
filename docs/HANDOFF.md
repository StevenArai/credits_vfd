# 接入与调试交接

此仓库已交付可用Animator库。新项目优先接入库、实现板端时钟和显示，不从旧计划恢复开发。入口是 [API说明](ANIMATOR_API.md) 和 [MCU示例](../examples/animator_mcu.c)。

## 新板项目带走什么

- `include/credits_animator.h`：独立C99分发；记录来源Git提交，便于回归。封装实现提交4c374b1，使用说明a46f7a6；后续文档整理不改变这两个代码基线。
- 无音乐：静态实例 → init → 周期update → frame_changed时传输 → finished后结束。硬件计数器扩展为单调64位；next_deadline向上取整到硬件tick，不能截断成过去时间反复忙等。
- 显示驱动负责协议、寻址/位序适配和传输，不修改核心图像。DMA完成前不更新同一实例；不要为了传输方便复制整个Animator。
- 先预算34872 B对象，再计栈/驱动/libc；32 KiB RAM不足。没有完整目标链接前不报真实ROM数字。默认panic用fprintf/abort，板端可按API替换。
- 单头集成不需要仓库CMake、Python、SDL或WAV；仍需要目标C99 libc/libm。若改核心，回此仓库的src维护并重新生成头，不让两份实现悄悄分叉。

## 出问题时从哪里看

| 症状 | 先检查 | 相关源码/证据 |
| --- | --- | --- |
| 速度慢、抖动、停顿后突进 | 时钟频率/回绕/单位、传输阻塞、补算耗时；不能靠降低步数修时间 | src/animator.c、src/player_fixed.c；LOOKUP_FIXED_TIME.md；animator_clock_wrapper/fixed_player_precision测试 |
| 图像错位、镜像、条纹 | 256×128、stride32、MSB在左；硬件寻址方向；DMA缓冲生命周期 | src/framebuffer.c；ANIMATOR_API.md；framebuffer相关测试 |
| 字符换行/光标错误 | char_buf覆盖与滚动；不要给fb添加终端语义 | src/charbuf60.c、src/scenes60.c、src/text60.c；charbuf60/direct60_comparison测试 |
| 海面缺口/横移抖动 | 禁止恢复80→60横向抽样或10→8丢行采样；当前是原生60×8 | src/ocean60.c；DIRECT60.md；ocean60_motion测试 |
| 乱码突然全屏覆盖/只流动不闪 | 持久损坏与临时层是否混淆；临时层不得写回状态 | src/ocean60.c、src/credits.c；ocean60_python_glitch测试 |
| RAM过大/分配疑问 | 是否误链接参考core、重复计工作区、复制实例；目标libc内部行为 | src/memory.c、src/credits.h；profile_core.py；animator-library验证数据 |
| M0打嗝或ROM膨胀 | 目标map/周期/栈，天气sin及浮点格式化、整数除法、显示传输 | weather.c；HOTSPOTS.md为优化前证据，LOOKUP_FIXED_TIME.md记已完成优化 |
| 修改源码但MCU没变化 | 发布头是否重新生成，是否引用旧副本 | tools/export_animator_header.py --check；animator_single_header测试 |

表中的源码相对仓库根目录。测试名称及命令以CMakeLists.txt为准；默认构建脚本执行CTest。按问题选择回归，不需要为文档修改重跑全曲。

## 必须保留的行为决定

1. 原始80×24 Python/终端核心是参考，不是当前SDL/MCU布局。旧Layout60转换只供测试；不能因旧文档描述将它重新接回运行版。
2. 海洋为原生60×8，B/C每两拍左移一格、D每拍左移；临时乱码均每拍重抽样。新列持久损坏概率glitch/500，临时层概率(240+phase%1200)*glitch/1200000，仅替换正常海水字符。强度下降不会立刻清掉已有持久损坏。查表实现对应这些离散规则。
3. 固定掩码、“强度500立即整屏覆盖”和“只在新列做乱码”均不是当前完整效果。用户明确要求渐进淹没且随机乱闪。原生海洋使用独立随机流，与原Python随机位置不同是已接受设计变化；测试保留概率/状态逻辑证据。
4. 光标是独立标志，显示为4×6全亮块；普通下划线不是光标。标题使用Modded by StevenArai及On the GU256X128C-3900 VFD Panel。
5. 字体是用户编辑的96字形，含°。不要恢复原字体或擅自“修正”字形；新增缺字先记录。

## 证据、旧文档和产物

现行入口：README / AGENTS / SPEC / ANIMATOR_API / 本文。PLAN保存历史验收；DIRECT60保存布局与海洋变更；OPTIMIZATION_PLAN列出已完成项和未来可选方向。MCU_PROFILE/HOTSPOTS/LAYOUT60/VFD等阶段文档中的内存、路径和待办只对其记录版本有效。

最新资源证据在 `docs/validation/2026-10-06/animator-library/`：三种子6509帧摘要与lookup-fixed基线相同；ARM ABI34872 B；18组时钟回放、单头一致性与相关sanitizer通过。未声称一次全套最终测试、真实MCU或最终物理音画验收；实际组合详见PLAN。

本机仅保留build/ocean-overlay与build/standalone两套构建。其余build中间产物已移出；所有build均被Git忽略，新克隆需重新构建。外部cleanup不作为任何恢复或验证依赖，其最终删除状态未验证。WAV不入Git，单文件Windows构建需自备音频。

交接时开发分支为codex/direct-60x20，代码与README已推送至a46f7a6，尚未合并主分支；后续是否推送/合并按用户请求执行，先检查实际Git状态。不要从主分支名称推断它一定含最新单头库。
