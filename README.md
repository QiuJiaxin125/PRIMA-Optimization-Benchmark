# PRIMA-Optimization-Benchmark
# PRIMA & Optiprofiler Benchmark Test

本项目主要测试了 PRIMA 求解器在不同约束条件下的表现，以及在不同数值精度下的对比。

## 运行环境
- MATLAB (R202X)
- PRIMA 求解器 (已按照项目说明安装)
- Optiprofiler 工具箱

## 如何复现结果
1. 确保已配置好 MEX 环境。
2. 手动进入相关目录执行 `setup`。
3. 运行 `test_rosenbrock.m` 查看 Rosenbrock 函数求解结果。
4. 运行 `run_benchmark.m` 生成 Double vs Quadruple 的对比图表。

## 文件夹说明
- /Report: 包含 LaTeX 源码及生成的 PDF 报告。
- /Results: 包含测试生成的性能剖面图。
