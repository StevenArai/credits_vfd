# 保留的验证证据

- ctest-clean-build.log：Python 归档迁移后，干净 build/host 的 25/25 检查。
- sdl-natural-eof.log：此前实际 WASAPI 整曲自然结束记录。
- timing-before.csv / timing-after.csv：终端输出优化前后的真实 ConPTY 测量。

大体积逐帧数据可由测试重新生成，已移至项目外可恢复清理归档。日志里的旧文件路径反映当时运行现场，不是当前入口；当前构建说明见根目录 README。
