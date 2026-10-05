# Animator 封装验证（2026-10-06）

- profile_core.py --native --out build/profile-animator，Clang LLVM-MinGW 20260922。保存三种子 timing/counts、ABI 数据；timing 为未插桩主机耗时，counts 为插桩统计，不能用插桩耗时推断提速。
- baseline-comparison.json 是实际读取上一版 lookup-fixed 与本版 timing 的 digest 后断言一致的结果，覆盖全曲6509帧字符/fb/主RNG。
- abi-m0.ll 来自 clang -target arm-none-eabi -mcpu=cortex-m0 -DCREDITS_DIRECT60=1 -Isrc -S -emit-llvm tools/profile_abi.c；只验证对象布局，不是链接成功的固件。
- sanitizer-wrapper.log 保存新增实例隔离和重新init后的最终测试：1/1，17.53秒。此前相关sanitizer7/7通过（25.47秒）；中间LastTest被后续定向回归覆盖，不伪造旧完整日志。
- standalone-tests.log 保存本轮重建后单文件隔离启动、SDL音频交互的2/2测试（7.45秒）。dummy设备不代表物理音频验收。
- Release相关11/11（17.72秒），最终头文件命名隔离后3/3（0.74秒），新增实例测试后wrapper1/1（2.57秒）；执行输出已记录在工作会话，旧LastTest已被后续定向测试覆盖。
- 最终export_animator_header.py --check及git diff --check通过。板端示例仅编译成主机object；尚无实际MCU链接/周期/栈测量。

当前sizeof Animator：主机40584 B，ARM34872 B（含工作区和4096 B fb）。核心32次初始化预留、播放零预留、无显式堆调用。目标libc仍需单独审计。
