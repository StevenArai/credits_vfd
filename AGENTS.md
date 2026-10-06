# Agent 接入与维护约定

本仓库的 Python → C 动画移植、60×20 原生布局、framebuffer、SDL 音频显示和 Animator 单头库交付已完成。默认任务是**使用或适配现有库**，不是继续开发移植工程。板级适配由用户在新项目中开展；没有新请求时，不主动重做布局、海洋算法、内存优化或恢复旧实现。

## 首先阅读

1. `README.md`：如何使用、构建和获取单头库。
2. `docs/ANIMATOR_API.md`：接口、时钟、内存归属和生命周期。
3. `docs/HANDOFF.md`：板级适配边界、调试索引和历史变更原因。
4. 需要改动核心时再读 `SPEC.md`；`PLAN.md` 是历史验收记录，不是待执行计划。

当前行为以源码、现行 SPEC 和 API 文档为准。旧文档的“本轮”“待实施”“最新”、旧复选框及 build 路径只描述其记录时点，不构成当前待办或授权。不要把历史方案当成现行实现。

## 接入边界

- 使用 C99 `include/credits_animator.h`；仅一个 C 文件定义 `CREDITS_ANIMATOR_IMPLEMENTATION`。板端示例在 `examples/animator_mcu.c`。
- MCU 无音乐：板端提供单调时钟，调用 init/update，再读取只读 framebuffer。显示协议、DMA、计时器和等待在板级适配层。
- 场景、排版、字符行为、字体和像素绘制都在核心。SDL 仅适配显示、输入、时间和音频。
- Animator 拥有固定工作区、60×20 char_buf 和一张4096 B fb。实例初始化后不可复制/移动，DMA读取须在下次更新前结束。
- 当前 ARM ABI 对象34752 B已包含工作区和fb，不再加旧堆数字。栈、驱动和目标libc另算；真实MCU性能/ROM未验证。先测量再决定优化。原生现使用float天气与小表正弦，数值差异见docs/NATIVE_FLOAT.md。

## 修改与验证

- 业务代码可读性优先。容量必须明确且越界报错；不能静默丢弃内容。默认单代理，只有用户明确授权才并行代理。
- 维护源在 `src/`，不要手改生成的单头文件。修改核心或字体后运行 `tools/export_animator_header.py` 并检查 `--check`。
- 原生运行核心是 `credits_core60`；`credits_core`/80×24/旧Layout60保留作独立终端参考，不接入MCU或SDL运行版。
- `archive/python/` 保持原样，基线 `18f5cf36a10a7e95aa20d4bf31fd79a5895ccdb0`。参考驱动固定Python版本、导入前seed、时间与输入。原生海洋/布局存在已授权变化，不能要求与原Python全图全RNG相同，具体见交接文档。
- 根据改动运行相应构建、对照和检查，报告真实结果与未验证项。不能以文件存在或自报代替验收。测试失败先诊断，不重复相同失败命令。
- 新验证在 `PLAN.md` 顶部追加有日期的维护记录；保留历史证据，不修改历史结果来制造一致性。只改文档时检查链接和diff，不必重跑动画。
- Git阶段提交遵循用户要求；推送、合并依据当前请求，不把历史授权视为永久授权。

## 本机产物与历史资料

当前保留 `build/ocean-overlay/credits_sdl.exe`（普通版）和 `build/standalone/credits_sdl.exe`（内嵌WAV）。`tools/build.ps1` 默认输出仍是build/host；显式传BuildDir以匹配README。构建目录被Git忽略，在新克隆中需要重新生成。

真实验证环境为Windows x64、Clang/LLVM-MinGW、CMake/Ninja。音频 `credits.wav` 不入Git，MCU不需要它。旧构建/profile/测试回放已移出项目，不依赖外部cleanup目录；可复用证据在 `docs/validation/`。事故文档仅作历史，不主动重新调查或恢复旧失败实现。
