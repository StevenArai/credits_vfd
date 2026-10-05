# 终端重建的复现记录

## 运行

在至少 80 列、28 行的 Windows 终端中：

```powershell
./tools/build.ps1
./build/host/credits.exe
# 也可直接选择起点和受控 seed：
./build/host/credits.exe --play --jump 3 --seed 42
```

无参数运行显示两秒跳转菜单；1–6 对应 start/title/funding/loading/break/final。
`p` 暂停/恢复，`,`、`.`、`/` 快进，Ctrl+C 终止并清屏。
默认 seed=1。此程序不播放音乐，以单调时钟驱动，在最后事件 6508 后结束。
原始标题文本（如 running pure Python 3.6）按参考原样保留。

快进沿用源行为：第一次任意快进输入只设置共享状态，之后每次 30 Hz 输入轮询分别 seek 3/7/15 拍；释放键不会清除此状态，同次轮询的多个键按逗号、句号、斜杠顺序处理。每次主循环最多请求一个动画拍，暂停也不会抹去尚未追赶的积压拍。
Windows 控制台适配接收键事件，保持按下状态，并将终端短按事件送入一次采样；可移植 Player 接口直接接受时间和按键位掩码。

无窗口回放和诊断：

```powershell
./build/host/credits.exe --seed 1 --last 6508 --replay build/c.bin --state build/c.json --trace build/events.txt
./build/host/credits.exe --last 1079 --ansi build/ocean.ansi
python tests/compare.py build/host/credits.exe --last 6508 --seeds 0,1,42 --jumps 1,2,3,4,5,6
./tools/build.ps1 -BuildDir build/sanitize -BuildType Debug -Sanitize
```

`--ansi -` 将 ANSI 流写入标准输出；此模式不等待真实时钟。`--play` 用于实际终端播放。
完整测试输出在各构建目录的 `Testing/Temporary/LastTest.log`，最终数字和已知边界见 `PLAN.md`。

## 已验证环境

Windows x64，CPython 3.13.11（`C:/ProgramData/miniconda3/python.exe`）。
LLVM-MinGW UCRT 20260922 / Clang 23.1.2，CMake 3.24.0，Ninja 1.11.1。

工具链下载自 https://github.com/mstorsjo/llvm-mingw/releases/download/20260922/llvm-mingw-20260922-ucrt-x86_64.zip ，解压至 `.tools/`。
下载文件 190725905 字节，SHA-256 `e3ad77d117a4bea19a7a3b333341824d79a5a371004a10e25b8504e7b3047666`。
工具、参考二进制、临时帧、构建产物均不进入 Git。

```powershell
./tools/build.ps1
python tests/ansi_test.py
python tests/semantics.py build/host/semantics_probe.exe
python tests/scheduler_test.py build/host/scheduler_probe.exe
python tests/reference.py --seed 1 --out build/reference-full.bin
python tools/export_data.py --check
python tools/export_events.py --check
```

参考驱动在任何业务模块导入前 seed；仅替换键盘、音频、启用 ANSI 的主机入口，使用 AST 截取原始 credits.py 的初始化部分。原始 SceneManager、所有业务场景和原始 Canvas.render_all 都实际运行。`tests/player_test.py` 另外直接执行原始菜单、完整交互循环体及退出分支；外部 cls/clear 使用明确的默认属性清屏适配。

帧格式为 little-endian int32 beat，随后 1920 个 uint32。每格低 16 位字符，位 16–21 前景 ANSI 编号，位 22–27 背景编号，位 28–29 亮度（0 normal、1 bright、2 dim）。此格式仅供主机测试；核心按 Unicode 字符操作。

## 已记录的源特殊行为

- Canvas 坐标宽 80，Layer 内部容量却再次翻倍为 3840；可见区仍为 1920 格。noise 的 x 会到 79，映射后可能跨行。
- set_char 的 mod_char 使用绝对 loc 作为字符串切片下标，并且只有 append 分支更新 length/end。subtract_char 使用 end-loc 切片。C 保留这些可见行为。
- set_string 使用 start_i + bisect 的插入位置，分组不总按起点有序；必须按原分组顺序渲染，不能用 full_str 或普通覆盖画布替代。
- 每次 render_all 先恢复 bright/default foreground；空 code 继承当前渲染组属性。清除写入空格，也有属性。
- Scene.start 先执行所有 on_create，再立即请求一帧；request_next 先请求现有场景，再增加全局拍并按源顺序执行事件。render=False 只跳过请求绘制，仍推进场景拍和事件。
- 1080 拍包含两次 beats start，中间 layer title。不能合并掉重复事件。
- 播放终端至少需要 80 列、28 行；参考 footer 把光标移到第 27 行。比较区域始终为前 24 行。

这些是兼容要求，不是推荐给新渲染器的一般算法。

## 核心接口和内存归属

- 调用者持有 Credits；`credits_init` 初始化 seed、海洋时间及文本，`credits_destroy` 释放其所有动态内存。
- `credits_next` 接受显式拍推进；`Player` 借用 Credits，`player_step` 接受单调时间、按键掩码和 active 状态。核心没有 Windows/POSIX/SDL 头文件。
- Text 的原始文本及 WordLine 表在初始化时分配；只读导出片段永不修改。模板损坏在运行时按 RNG 生成；模板行在 Credits 生命周期内稳定。
- History 只持有模板行引用、前缀和颜色；三份条目数组独立增长，reset 复用容量，destroy 释放。没有在每个通用值中嵌入历史或海洋。
- Canvas 拥有分组数组和各组 Unicode 文本；每次呈现后释放该帧文本，数组容量复用。临时业务字符串使用 Credits 的可复用 scratch。海洋每个实例为独立的 10×80 状态。
- 分配大小和峰值由 Memory 记录。非法状态、容量/分配失败有诊断并终止，源定义的画布裁剪单独保留。测量只统计核心显式分配，不包括 Windows 终端、CRT 内部或 ASan 开销。
- 每个主机测试检查 destroy 后 live=0；ASan/UBSan 覆盖完整矩阵。Windows 本次没有运行 LeakSanitizer；`.su` 栈数据是单函数静态开销。

仅 Windows x64 主机已经运行验证。无音频终端验收不等于完整音乐播放器；framebuffer、字体、单色映射和 SDL2 留给下一阶段。
