# Credits VFD

将 plaaosert 的 Python 字符动画移植为 **C99 可移植核心 + SDL2 显示/音频前端**，模拟 256×128 单色 VFD。

当前默认显示 **60×20 字符**：3×5 字形，横纵各 1 像素间距；每个 VFD 点显示为 2×2 实际像素，点间黑缝 1 像素，四周黑边。支持青绿色调节、大小写切换、音频同步和字形编辑。

60×20 版本在可移植核心中直接写入固定字符画布，再生成同一张 framebuffer；SDL 不负责业务绘制。
当前直接布局已获用户目视接受；最新原生海洋匀步移动修复待复看。自动测试覆盖原始 80×24 参考行为、直接布局业务状态、像素输出和交互，不代表新布局已完全通过视觉验收。实现与内存实测见 [DIRECT60.md](docs/DIRECT60.md)。

## 构建与运行

单文件 Windows 版本：`build/standalone/credits_sdl.exe`，内嵌原始 WAV 并静态链接 SDL，无需旁置 `credits.wav` 或 `SDL2.dll`。仍依赖 Windows 系统组件/UCRT。默认播放内嵌音乐，`--audio 文件路径` 可覆盖。

重建单文件版本：`./tools/build.ps1 -BuildDir build/standalone -Standalone`。CMake 对应 `CREDITS_SDL=ON`、`CREDITS_STANDALONE=ON`，可用 `CREDITS_WAV` 指定要内嵌的 WAV。此 Windows 资源加载只在主机前端，不进入可移植核心；WAV 与 EXE 不提交 Git。

实际验证平台：**Windows x64、Clang/LLVM-MinGW、CMake、Ninja、SDL2 2.32.10**。其他平台未实测；核心不依赖 SDL 或操作系统。

本机已有工具链，项目根目录运行：

```powershell
./tools/build.ps1 -BuildDir build/direct60 -SDL
./build/direct60/credits_sdl.exe --audio ./credits.wav
```

脚本同时配置、编译和运行 CTest。脚本中的 LLVM-MinGW、SDL2 位于 `.tools/`；CMake/Ninja 路径是本机配置。换机器请调整脚本，或使用标准 CMake：

```powershell
cmake -S . -B build/host -G Ninja -DCMAKE_C_COMPILER=clang -DCREDITS_SDL=ON -DSDL2_DIR="你的SDL2/lib/cmake/SDL2" -DPython3_EXECUTABLE="你的Python/python.exe"
cmake --build build/host
ctest --test-dir build/host --output-on-failure
```

原始行为对照固定 **CPython 3.13.11**；无需安装归档 Python 播放器的 keyboard/just-playback 依赖，对照驱动会替换硬件接口。字体编辑器逻辑测试在找到 Node.js 时启用。LLVM-MinGW 和 SDL2 的来源、版本、哈希见 [工具链记录](docs/TERMINAL.md) 和 [VFD 说明](docs/VFD.md)。

仅构建核心与终端程序：

```powershell
./tools/build.ps1 -BuildDir build/core
./build/core/credits.exe
```

Windows 终端需至少 80 列、28 行。终端程序是无音频的原始 80×24 对照模式；SDL 程序是带音频的 60×20 VFD 模式。

### 音频

音乐不随仓库分发。请自行准备合法取得的 Frums《Credits LONG》WAV，默认放在根目录 `credits.wav`，也可通过 `--audio` 指定路径。文件已被 Git 忽略。动画以音频设备消费进度为时钟，保留原始 179 BPM 与时间偏移；声卡及屏幕物理延迟未做回环校准。

### 操作

| 操作 | 功能 |
| --- | --- |
| `1`–`6` | 从开场、标题、资助、加载、间奏、结尾重新开始 |
| `P` | 暂停 / 恢复 |
| `,`、`.`、`/` | 沿用原程序的快进规则，非固定倍速 |
| `U` | 切换小写按大写绘制，默认开启 |
| 拖动底部颜色条 | 在 `#00CFA0 → #00E89B → #20E6A0 → #00FFC0` 间调色 |
| `Esc` / 关闭窗口 | 退出 |

常用参数：`--jump 1..6`、`--seed N`、`--original-case`。程序默认音频结束后退出。`--seconds N`、`--snapshot file.bmp` 用于短测和显示回读；更多参数见 `--help`。

## 编辑字体

用 Edge/Chrome 双击打开 [tools/font-editor.html](tools/font-editor.html)，无需服务器或网络。

- 点击或拖动像素，支持撤销、重做、清空、反色、添加 Unicode 字形和 60×20 预览。
- 少量修改：点“复制当前字形”，将 JSON 发给助手合并。
- 整套修改：导出 JSON 文件，用于备份、重新导入或应用到项目。
- 浏览器草稿不会自动修改项目。当前正式字体含 95 个 ASCII 和 `°`，共 96 字形。

```powershell
python tools/export_font.py --input "你的字体文件.json"
./tools/build.ps1 -SDL
```

正式字体数据为 `tools/font-editor-data.json`；导入器更新 C 字形表和编辑器默认值。[详细说明](docs/FONT_EDITOR.md)。

## 目录

| 目录 | 用途 |
| --- | --- |
| `src/` | C 核心、60×20 排版、字体光栅化、终端及 SDL 适配 |
| `tools/` | 构建、数据导出、字体编辑器与正式字体 JSON |
| `tests/` | C 探针、独立 Python 对照和编辑器逻辑测试 |
| `archive/python/` | 原 Python 播放器、CLIRender、colorama、原 README/依赖/媒体说明，内容原样保留 |
| `archive/fonts/` | 原始用户字体 HTML，仅作参考 |
| `docs/` | 规格说明、阶段证据、布局限制和保留的验证日志 |
| `build/direct60/` | 当前直接布局主机构建产物，不入 Git |
| `build/test-artifacts/` | 可重新生成的测试帧与回放数据，不入 Git |
| `.tools/` | 本机已安装工具链，不入 Git |

原 Python 已从根目录迁移，不是当前应用入口。测试仍直接读取归档源码；`archive/python-manifest.json` 记录原路径、SHA-256 和 Git blob，`reference_archive` 测试验证内容未变。归档中的旧运行说明只作为历史资料。

开发约定见 [AGENTS.md](AGENTS.md)，技术规格见 [SPEC.md](SPEC.md)，实际验收见 [PLAN.md](PLAN.md)，60×20 排版限制见 [docs/LAYOUT60.md](docs/LAYOUT60.md)。

## 来源与致谢

- 原动画与字符渲染：**plaaosert**，[credits_public](https://github.com/plaaosert/credits_public)。[原演示视频](https://youtu.be/o3cKQzrtFgQ)。
- 音乐：**Frums**，[Credits EX](https://soundcloud.com/frums/credits-ex)；本播放器时间线使用 Credits LONG。
- 原始附带的 colorama 和媒体说明保存在 Python 归档中。本仓库不授予音乐使用权，也不额外声明原作者未提供的许可证。
