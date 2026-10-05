# 终端重建的复现记录

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

参考驱动在任何业务模块导入前 seed；仅替换键盘、音频、启用 ANSI 的主机入口，使用 AST 截取原始 credits.py 的初始化部分。原始 SceneManager、所有场景和原始 Canvas.render_all 都实际运行。完整交互循环将在 P3 独立受控驱动中验收。

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
