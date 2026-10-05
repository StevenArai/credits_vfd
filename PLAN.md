# 重建实施计划与实际进度

更新日期：2026-10-05。P0–P5 已构建并通过下列验收，包含实时对齐、SDL 显示/音频及颜色条、大写选项。

## 当前状态

- [x] 分析事故、核对 Python 基线和旧产物。
- [x] 归档旧产物、相关会话日志和 Git 基线，逐文件校验 SHA-256。
- [x] 将旧 src/、tools/、SPEC.md、todo.md、失效锁和缓存移出工作目录。
- [x] 确认平台无关 C、终端优先、256×128 单色及 SDL2 的边界。
- [x] 写入新版 SPEC.md、AGENTS.md、事故摘要与本计划。
- [x] P0：建立可运行的参考驱动与 C 构建基线。
- [x] P1：验证字符画布、节拍引擎和随机接口。
- [x] P2：通过文字与海洋的端到端对照。
- [x] P3：完成全部终端动画和交互验收。
- [x] P4：生成核心内的单色 framebuffer。
- [x] P5：接入显示 framebuffer 并播放音频的 SDL2 模拟前端。

恢复目录：`D:/credits_vfd_recovery/20261005-172227`。原件保存在 `originals-moved-out/`，校验副本在 `workspace/`。22 个原始受版本控制文件与参考提交保持一致；本轮的新文档作为重建检查点提交。

## P0 — 参考驱动与构建

交付：真实可执行的 CMake/Ninja 构建、最小 C 程序、独立 Python 参考驱动、数据/场景/事件清单和首组参考帧。

步骤：
1. 查找并验证 Clang/MinGW-w64、CMake、Ninja；当前 PATH 未发现这些命令，不能假定已经装好。需安装时先明确来源和安装位置。
2. 固定参考 Python 版本，使用独立驱动控制时间、输入及导入前的 seed；音频/键盘适配不能影响业务初始化顺序。
3. 从源程序生成场景/发生器、事件同拍顺序、字符串模板和随机调用清单；区分定义但未加入 all_scenes 的场景。
4. 捕获原始 ANSI 输出并重建终端状态；校验清除、颜色和非 ASCII 字符，建立失败时可定位 beat/scene/cell 的比较报告。

通过条件：主机最小构建与测试真实通过；同一输入的参考回放重复一致；原始 Python 的 Git diff 为空。

## P1 — 基础语义

交付：80×24 字符画布、ANSI 适配、明确状态的场景调度、项目所需随机接口。

通过条件：坐标转换、跨行、两字符覆盖、重叠、边界、清除和 Unicode 用例对照通过；scene_start/on_create/clear/request/event 的顺序通过；受控随机接口序列匹配参考。检查函数声明/实现可链接，并测量结构体大小。

## P2 — 第一条完整播放链路

交付：由参考时间线驱动的文字与海洋场景，可在终端和无窗口测试中运行。

通过条件：相同 seed/时间/输入下逐帧字符及属性匹配参考，海洋完整占据底部十行；能追踪第一处差异，不能用人工观察代替帧比较。

完成这一步后再扩展剩余场景，避免把未经验证的契约传播到全项目。

## P3 — 完整终端动画

交付：全部实际使用的效果、模板、场景、事件和控制台交互。主机时间适配和动画核心分离。

通过条件：
- 完整时间线在固定种子集合及边界输入下对照通过，场景/事件数量和同拍顺序与源清单一致。
- 六个启动跳转、暂停/恢复、快进、终止/清屏及随机初始化的行为有回放证据。
- 源中的特殊快进/输入行为按参考实测处理，不根据 README 简写自行解释成通用速度倍率。
- 完整运行的容量检查和可用的内存诊断通过，记录只读数据、核心状态、动态峰值、栈热点和帧耗时。
- 只有真实执行过的构建平台才列为已验证。

音频说明：这一阶段先验收动画与受控播放时钟。实际音乐解码/同步是否纳入主机播放器另行确认；不得把无音频驱动报告成完整音频播放器复现。

## P4 — 256×128 单色像素输出

用户已提供 `3x5fonts.html`，步进 3×5，原点 (8,4)，单色映射见 docs/VFD.md。

交付：核心内的软件光栅化与 4096 字节单缓冲输出；字符动画无需重写。

通过条件：字形、边界、位序、stride、背景和关键帧像素测试通过；输出实际图像供用户检查。此时再根据测量考虑热点优化或额外缓冲。

## P5 — SDL2 显示前端

交付：窗口、输入/时间适配、音频消费时钟、framebuffer 上传和整帧呈现，以及黑边内主机颜色控件。

通过条件：SDL2 不承担文字/形状/动画绘制；窗口显示与核心 framebuffer 一致；移除 SDL2 后仍能构建并运行核心测试。

## 阶段记录规则

每个阶段记录实际变更、运行的命令、结果、参考种子/输入、资源数据和未解决问题。构建日志及大体积逐帧输出放构建目录，文档只保留复现命令与摘要。

文档和代理报告不能替代运行结果。同一失败重复出现时检查原因与落盘状态，不反复提交原命令。只有满足阶段通过条件才勾选完成。

## P0–P1 验证记录（2026-10-05）

- Windows x64，CPython 3.13.11（Anaconda），Clang 23.1.2 / LLVM-MinGW UCRT 20260922，CMake 3.24.0，Ninja 1.11.1。仅此主机构建已验证。
- 工具链来源和 SHA-256 见 `docs/TERMINAL.md`；安装于被 Git 忽略的 `.tools/`，未修改系统 PATH。
- `./tools/build.ps1`：实际配置、编译、链接和 CTest smoke 通过。首次配置的反斜杠转义问题已修复，使用独立 `build/host`。
- `python tests/reference.py --last 80 --out build/p0-a.bin` 及独立进程重复回放：81 帧 SHA-256 均为 `f34fb6cc257d933c7bd5128dcf34db14943ce61461d8451d5f1f450c54bf75fc`。
- `python tests/reference.py --out build/reference-full.bin`：seed 1，6509 帧，85 个事件，SHA-256 `c50d517f248447e7b5e3ef414a12cb8cfa85551179160219d6fdd1a90ca2ebbd`。此处仅是 Python 参考全程，不代表 C 全程验收。
- `python tests/ansi_test.py`：手算 Unicode、SGR、边界换行、清除和第 27 行光标处理通过。80×24 可见区域、至少 28 行的终端，不产生滚屏；LF 按主机文本 CRLF 处理。
- `python tests/semantics.py build/host/semantics_probe.exe`：5 个种子（0、1、42、4294967295、1311768467463790320），共 5000 组 random/randint/randrange/choice/getrandbits 混合序列一致；168 组实际 ANSI 画布帧及 C ANSI 输出回读一致。
- `python tests/scheduler_test.py build/host/scheduler_probe.exe`：48 条 create/clear/request/event/active 记录一致，含同拍多次 start、layer/remove、非零起拍和 render=False。
- `python tools/export_data.py --check`、`python tools/export_events.py --check` 通过。18 份文本、22 个场景、79 个发生器、85 个事件；未加入 all_scenes 的 beats_side 单列。`docs/reference-inventory.json` 是实际导出的清单。
- P1 实测：Canvas 7720 字节，Random 2512 字节；画布对照动态峰值 46688 字节、76 个分组、最长内部字符串 1930 个字符，销毁后 live=0。编译器 `.su` 显示核心最大单函数栈为 canvas_clear 7736 字节（非调用链峰值）。完整业务状态、只读数据及帧耗时待 P2/P3 测量。
- 测试探针最初因 1 MB 局部测试数据表触发栈溢出，已移至有归属的堆内存并重跑通过；没有将其误报为核心通过。
- `git diff 18f5cf36a10a7e95aa20d4bf31fd79a5895ccdb0 -- '*.py' CLIRender colorama` 为空。未执行其他 OS、MCU、GCC 或音频播放验证。

## P2 验证记录（2026-10-05）

- P0–P1 本地提交：`5648ae9`。P2 实现开场噪声、清除、逐字符打字、海洋及 0–1079 拍事件；其余场景在此节点明确报未实现，不伪装为完整播放。
- `./tools/build.ps1`：9/9 CTest 通过，包括 P1 回归、初始化数据、三种子海洋/文字、实际 C ANSI 输出回读。
- `python tests/compare.py build/host/credits.exe --last 1079 --seeds 1,0,42`：每种子 1080 帧、2073600 格、28 事件，字符/前景/背景/亮度逐格一致，最终活动场景、ocean_time、625 项 CPython RNG 状态一致。海洋按第 14–23 行输出 800 格。
- `python tests/data_test.py build/host/credits.exe 1`：全部 18 份初始化文本逐项与原 Python 相同，包含尾部空行、空词、列表重复及随机损坏；导入结束 RNG 状态相同。
- `python tests/ansi_replay_test.py build/host/credits.exe`：81 个真实 C ANSI 输出帧回读与核心格相同。可用 `build/host/credits.exe --last 1079 --ansi -` 输出终端流；真实时钟和键盘适配属于正在进行的 P3。
- 主机实测：Credits 21336 字节；三次回放动态峰值 66110–66842 字节，销毁后 live=0；最多 255 分组。原始字符数据及生成描述的逻辑只读大小 13867 字节；LLVM size 的整个主机 EXE `.rdata` 为 22764 字节、`.text` 为 27334 字节（含运行库/主机适配，不是 MCU 预算）。
- QueryPerformanceCounter 测量纯核心帧（不含输出）：平均 5.957–6.960 微秒，单帧最大 150.8–201.2 微秒；Windows 调度会影响最大值，尚未做热点优化。
- 编译器单函数静态栈：ocean_update 3416 字节、type_characters 184 字节，最大仍为 canvas_clear 7736 字节；这些不是整条调用链或运行时高水位。
- 首次将事件导出编译为 C 时发现 JSON 的 `\\u001b` 不属于 C99 合法控制字符转义，导出器已改为 `\\033` 并重新生成、编译、核对。当前 P2 对照无未解决差异。完整时间线/交互/内存诊断尚待 P3。

## P3 验证记录（2026-10-05）

- P2 本地提交为 `bfc33e9`。补齐 all_scenes 的 22 个业务场景、79 个发生器、18 份文本及 85 个默认时间线事件。按词打字、三份历史、天气、日期、加载条、访问点、双路文字、掉电条均有具体状态；历史引用稳定模板行，不复制完整历史文本。源 debug=False，额外的 debug_counter 不进入默认播放验收。
- `./tools/build.ps1`：Release 构建及 **18/18 CTest 通过**，46.54 秒。`./tools/build.ps1 -BuildDir build/sanitize -BuildType Debug -Sanitize`：ASan/UBSan 构建及 **18/18 通过**，54.07 秒。详细运行输出分别在 `build/host/Testing/Temporary/LastTest.log`、`build/sanitize/Testing/Temporary/LastTest.log`。
- 完整对照命令：`python tests/compare.py build/host/credits.exe --last 6508 --seeds 0,1,42 --jumps 1,2,3,4,5,6`。18 组回放，共 **72132 帧 / 138493440 格**逐格比较通过；每种子的从头播放为 6509 帧 / 85 事件。六个跳转的帧数依次为 6509、5509、4739、3469、2729、1089，事件数为 85、67、55、40、28、10。最终 RNG 的 625 项状态、活动场景及 ocean_time 一致。
- `python tests/scene_test.py build/host/scene_probe.exe`：22 个 all_scenes 场景独立运行，另覆盖 title、weather、loadingbar、poweroff、accesspoints 的起拍/条件边界，与原始 ANSI 帧一致。
- `python tests/player_test.py build/host/player_probe.exe --seed 1 --jump N`（N=1..6）：直接执行原 credits.py 菜单、播放循环和退出分支的 AST，固定时钟/输入/音频替身。共 **45612 个逐次状态、38533 个渲染/清屏帧**一致，覆盖 30 Hz 严格时间边界、相同时间重复轮询、暂停/恢复、积压拍追赶、各快进键及组合、终止后无更新。cls/clear 外部调用明确映射为默认属性的 ANSI 清屏。
- Windows 真实 ConPTY（80×30）测试：执行实际 credits.exe，菜单选择 6、输入 p 和快进键、Ctrl+C；自然结束和中断均退出 0，有实际 ANSI 输出并清屏/恢复光标。首轮测试工具错误继承了父进程重定向句柄，定位后改由 ConPTY 提供子进程句柄，重跑通过。
- 本轮发现并修复的画面差异：降水概率经 Python min/max 截断后为 int 0/1，显示 `0%`/`100%`，不显示 `.0`；断线哨兵同样为整数。修复后上述种子/时间/输入范围内没有未解决差异。
- 最终 Release 资源：**Credits 21808 字节**，动态峰值最大 **100576 字节**（18 组中），各次销毁后 live=0；最多 496 个渲染分组，最长内部分组文本 1920 字符；三份历史条目峰值 173/28/13。字符串/描述数据逻辑只读大小 13867 字节；整个 Windows EXE `.rdata` 27732 字节、`.text` 44934 字节，均含主机/运行库部分，不代表 MCU 预算。
- 从头播放三个种子的纯核心平均帧耗时 3.605–4.098 微秒，最大单帧 1519.2–1561.9 微秒；所有跳转组合最大 2023.4 微秒。输出 I/O 不在计时内，主机调度会影响最大值。没有基于这些均值盲目优化。
- 编译器单函数静态栈：canvas_clear 7736 字节、ocean_update 3416 字节、场景请求 520 字节、天气绘制 392 字节。未宣称调用链栈峰值。Windows ASan 不提供本轮 LeakSanitizer 检查；使用 ASan/UBSan 与核心显式分配/释放计数，均无报错。
- `git diff --exit-code 18f5cf36a10a7e95aa20d4bf31fd79a5895ccdb0 -- ':(top,glob)*.py' CLIRender colorama` 通过，原始 Python 未修改；`git diff --check` 通过。仅验证 Windows x64 / Clang-MinGW；未验证其他 OS、GCC、MCU。
- 本轮交付是无音频的终端动画：默认在最后事件 6508 后清屏退出；音乐解码、音频时钟同步、由音乐时长退出未实现。framebuffer、字体和 SDL2 均未实施。

## 实时对齐与 P4 验证记录（2026-10-05）

- 真实 ConPTY 基线：核心平均 2.59 µs；ANSI 输出平均 34.441 ms、最大 96.156 ms，超过单拍 41.899 ms 的情况实际存在。跳转应立即追赶的 60 拍，加上逐帧慢输出，造成约 2.5 秒积压；没有修改 179 BPM。
- 批量 ANSI 写入 + player_sync 补齐全部逻辑拍、只呈现最后一帧：同一 ConPTY 测试输出平均 0.08863 ms、最大 0.4147 ms，核心含追赶平均 8.44 µs、最大 95.2 µs；追赶后无正积压。原始逐调用 player_step 保留用于 Python 严格对照。
- Release 21/21 CTest 实际通过（56.98 秒）。包含所有既有 Python 对照、3900 个音频时间/抖动/2秒显示停顿/暂停/快进样本与逐拍 reference player 的格、RNG、事件比较。
- 独立测试解析原始 Python 全曲 ANSI 帧，审计全部 6509 帧的字形，发现仅 U+00B0 缺失（NBSP 显式映射空格）。344 帧逐像素比较通过，包括每 19 拍采样、全部 ASCII、属性组合、末端格及越界读取。
- 4096 字节 1bpp framebuffer 在核心内产生；95 字形只读表为 190 字节。位序 MSB-first、stride 32、原点 (8,4)、3×5 步进。终端属性保留，单色转换单独执行。缺字见 docs/GLYPH_TODO.md。
- 新终端适配使用约 38 KiB 的有界输出栈缓冲，只属于主机，不改变核心状态大小。
- SDL 实时音频和显示随后通过；见下方 P5 记录。

- 补充回归：Release 22/22（65.36 秒），ASan/UBSan 22/22（65.60 秒）；后续 SDL/UI 和终端错误检查改动再跑相关 3 项通过。无 SDL 的独立 build/core 构建及 21/21（56.06 秒）通过。
- 新增单函数静态栈：framebuffer_render 104 字节、player_sync 88 字节、终端适配 terminal_render 38792 字节。海洋/标题真实核心输出预览保存在 docs/images/，不是设计示意图。


## P5 音频、显示及用户追加选项验收（2026-10-05）

- 本地阶段提交 `dd20335` 建立实时补帧、P4 像素输出及可运行 SDL 主机。用户随后要求青绿色颜色条和大写选项，已实现；统一字间距因 319×143 超出原画布而未加入。
- 真实 WASAPI、用户根目录 credits.wav，从头自然播放到 audio-eof，进程退出 0：音频位置 **278.845170 秒**，墙钟 **278.833986 秒**；6587 次呈现、最终 beat 6584、最大核心补帧耗时 1.647 ms、最大正积压 0、队列耗尽 **0**。核心动态峰值 100284 字节、销毁 live=0。证据 `build/sdl-natural-eof.log`。隐藏窗口用于避免人工关闭，显示路径仍执行；另外真实可见窗口已通过非空标题画面 864×480 RGB 回读。
- 时间差约 11.2 ms 是设备消费游标与主机墙钟的观测值，不是声卡物理回环测量。此前有上限/被关闭的试跑明确不作整曲验收；扩大有界队列至 8192 样本帧后，上述最终自然结束测试无耗尽。
- 实测进程峰值工作集至少 148365312 字节（采样时读取进程 PeakWorkingSet64），包含约 49.19 MB PCM、1.66 MB 展开缓冲、纹理、驱动和运行库。PCM 不进入核心，未宣称 MCU RAM 预算。Windows EXE 在颜色控件前 `.text` 48550 / `.rdata` 28824 字节；最终值另见后续追加。
- 最新主机构建位于 **build/vfd**，因为用户运行中的旧 build/host/credits_sdl.exe 被 Windows 锁定；保留旧窗口，不中断用户播放。复现命令 `./tools/build.ps1 -BuildDir build/vfd -SDL`。
- 最新 Release 的 22 项检查全部已通过：完整测试中 21 项通过，颜色条测试最初误把白色滑块遮挡的采样点当作错误颜色，修正预期后该项单独重跑通过。不是跳过色值检查：仍核对四个色值/允许的滑块覆盖、SDL RGB 回读、鼠标事件、U 键、暂停/恢复/快进/EOF。
- 大小写两种模式共 **688 帧**与从原 Python ANSI 帧生成的独立像素预期一致。ASan/UBSan 上两种模式像素对照通过，最新颜色/输入/音频测试重跑通过。此前整套 22/22 ASan/UBSan 通过；未因仅增加 UI 再重复全套未受影响的测试。
- 原 Python 基线不修改。未解决项：`°` 正式字形列 TODO；声卡/屏幕物理延迟未回环测量；统一字间距需重新选择布局；其他操作系统未实测。

- 最终 Release SDL EXE：`.text` **64262** 字节、`.rdata` **29228** 字节（包含主机/UI/运行库部分），不是 MCU 固件大小。最终 `git diff --check` 及原始 Python 基线 diff 均通过。


## 60×20 实验分支（2026-10-05）

- 用户授权在新分支尝试重新布局；分支 `codex/layout-60x20`，起点 `5a463dc`。
- [x] 核心新增按场景分区、按词换行/滚动的 60×20 排版，3×5 字形横纵各 1 像素间距；海洋、历史、天气、加载框、双路文字等分区调整。
- [x] `./tools/build.ps1 -BuildDir build/layout60 -SDL` 构建；原 Python 回归及布局/像素/SDL 检查通过，详见 docs/LAYOUT60.md。
- [x] 19527 帧完整布局运行和相关 ASan/UBSan 检查通过。新增布局状态 4804 字节，无新增堆分配；最多滚出 6 行。
- [ ] 用户目视检查文字完整性、场景覆盖和阅读体验。此项尚未完成，不将构建通过当作内容完整性通过。


## 字形编辑器（2026-10-05）

- 新增离线单文件 `tools/font-editor.html`，提供整套 JSON 导出及当前字形剪贴板复制、JSON/单字导入、撤销重做、缓存和 60×20 预览。
- 项目字体正式数据为 `tools/font-editor-data.json`；导入器支持 ASCII 和额外 BMP 字形，原始 3x5fonts.html 保留。当前仍为原始 95 字形，度数符号未代替用户设计。
- Node DOM 替身逻辑测试通过；临时目录单字导入后实际 C 编译/渲染通过，未修改项目字形。真实浏览器 UI 未验收：自动浏览器禁止 file: URL。
- 操作说明见 docs/FONT_EDITOR.md。


## 用户字体更新（2026-10-05）

- 导入用户粘贴的完整 95 个 ASCII 字形，33 个字形相对上一版有变化；逐项核对项目 JSON 与收到的数据相同。
- 同步 C 字形表和编辑器内嵌默认字体；原始 3x5fonts.html 不变，未增加用户未提供的度数字形。
- `./tools/build.ps1 -BuildDir build/font-preview -SDL` 构建并通过 **24/24 CTest**（68.97 秒），含两种大小写像素对照、60×20 布局、音频/交互及字体编辑器逻辑。内容观感仍由用户目视检查。


## 用户补充度数字形（2026-10-05）

- 合并 U+00B0：010/101/010/000/000，现有 95 个 ASCII 逐项验证未变，共 96 字形。
- 更新编辑器默认字体、附加 C 字形表及缺字清单；build/font-preview 实际重建通过。
- 字体像素、导出一致性和布局测试通过。编辑器测试原先硬编码 95 字形，已改为独立的缺字添加测试数据并重跑通过；不限制用户添加字形。
