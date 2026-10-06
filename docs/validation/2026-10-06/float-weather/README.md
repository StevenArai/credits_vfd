# 原生单精度天气与小表正弦

前后基线均含18-PBS布局。baseline-src.zip保留本次改数值前的有效源码快照（不是旧事故产物），sources.json记录改前/改后SHA256。compare_numeric.py按3种子×6起点比较，完整结果见comparison.json。

- Release相关17/17通过，29.33秒；包含参考随机/数据/场景、原生海洋/布局/时钟、单头和SDL音频。
- ASan/UBSan新数值、charbuf、Animator及单头4/4通过，24.98秒。
- 内嵌WAV重建后隔离启动/音频/新数值/单头/导出5/5通过，10.11秒。音视频测试为dummy设备，不是物理播放验收。
- 720001个角度扫描：正弦最大绝对误差0.0000376085159；20001个整数日目标温度最大误差0.00149934726°F。整数初始相位与双精度参考68513个随机/边界样本相同，保持两次MT抽取。
- 前后72132帧事件/打字节拍摘要一致；RNG不同29099帧，字符不同8304帧，像素不同8255帧。单精度/近似/显示舍入不等价于旧double；weather哈希从初始化即不同，因为量化后的值不同，不代表画面每帧不同。
- profile_ram原始/插桩各18组共72132帧摘要相同，播放零预留增长、销毁live=0。ARM对象34752 B、host40504 B；历史/scratch容量及峰值不变。
- audit_native_float.py编译实际单头实现，使用声明式libc头以便无SDK地检查ARM指令。Cortex-M4 fpv4-sp-d16 hard ABI：零double IR类型、零__aeabi_d辅助调用、无sin/cos/pow/floor导入，生成192处f32指令。没有链接目标libc/启动代码/板端驱动，不宣称真实固件或板端周期。
- 初次审计声明头缺include guard导致重复FILE typedef警告，补guard后重新编译无该警告。生产代码构建没有此问题。
- ARM单函数编译栈最大408 B（场景回调），天气绘制288 B；不包含外部libc或完整调用链/ISR栈。宿主与ARM两组栈文件分开保存。

主要复现入口：tools/compare_numeric.py、tools/profile_ram.py、tools/audit_native_float.py及CTest native_float_math。未把主机时间当成F401实测提速。
