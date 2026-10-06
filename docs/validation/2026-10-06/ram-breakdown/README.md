# 当前原生核心RAM拆解证据

执行：`python tools/profile_ram.py --cc D:/credits_vfd/.tools/llvm-mingw-20260922-ucrt-x86_64/bin/clang.exe`。

- 原生多文件核心，当前工作区含未提交的18-PBS布局修复；source-manifest.json保存源SHA256与工具链。没有修改生产代码。
- ABI探针为Clang `-target arm-none-eabi -mcpu=cortex-m3 -mfloat-abi=soft` 仅编译常量，读出sizeof/offsetof；不是目标固件链接或板端运行。
- plain/counted为相同C驱动的18种seed/start组合。counted只在build副本的credits_scratch入口计请求字节，逐回放要求字符/fb/主RNG摘要一致。
- 两组各72132帧，销毁live=0，每帧校验预留次数及工作区used不变。历史峰值与scratch请求是主机受控场景观察，不是全部任意外部输入的形式上界。
- ARM工作区逐项按目标sizeof和4B对齐重算。相同方法的host偏移与实际分配指针逐项吻合，payload/used汇总也一致。
- host-stack.json来自当前普通Release核心对象的.su，是单函数静态栈，不是ARM/调用链峰值。host-sections.txt和host-writable-symbols.txt来自单头实现对象库，仅分析核心，不包含SDL/PCM/Windows进程。
- 驱动自己的静态Credits、元数据副本、输出缓冲/哈希计数器等只服务于测量，不计入被分析库的RAM。
- 统计汇总及优化边界见 [RAM_USAGE.md](../../../RAM_USAGE.md)。
