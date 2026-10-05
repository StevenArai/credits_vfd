# 参考资料归档

`python/` 是原始 Python 播放器与随附依赖、媒体说明、原 README。文件只迁移位置，内容未改写。基线为 18f5cf36a10a7e95aa20d4bf31fd79a5895ccdb0。

`python-manifest.json` 保存迁移前逐文件 SHA-256、规范化 Git blob 和原路径。迁移时逐字节校验通过，持续测试按 Git blob 校验以兼容不同 checkout 换行。当前 C 项目的测试适配位于 `tests/`，不会修改归档。

`fonts/3x5fonts.html` 为最初提供的字体编辑页面；当前正式字体和新版编辑器在 `tools/`。

这些文件不是当前应用入口；请按根目录 README 构建 C/SDL 程序。不要按归档 README 的旧路径安装依赖或启动主程序。
