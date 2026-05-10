% 测试 2: 对比 prima 的 double 与 quadruple 精度
fprintf('--- 开始测试 2: Double vs Quadruple Precision ---\n');

% 1. 配置测试选项 (基于你的作业要求)
options = struct();
options.ptype = 'ubln';      % 测试所有约束类型：无约束、界约束、线性、非线性
options.mindim = 2;          % 最小维数 2
options.maxdim = 5;         % 最大维数 20

% 2. 定义两个求解器 (参考 example 4 的参数化方式)
% 算法 1: Double 精度
solver1 = @(fun, x0) prima(fun, x0, struct('precision', 'double'));
% 算法 2: Quadruple 精度
solver2 = @(fun, x0) prima(fun, x0, struct('precision', 'quadruple'));

solvers = {solver1, solver2};
options.solver_names = {'PRIMA_Double', 'PRIMA_Quadruple'};

% 3. 测试 'plain' 特征 (无噪声环境)
fprintf('\n正在运行 "plain" 特征测试...\n');
options.feature_name = 'plain';
benchmark(solvers, options);

% 4. 测试 'noisy' 特征 (有噪声环境)
fprintf('\n正在运行 "noisy" 特征测试...\n');
options.feature_name = 'noisy';
benchmark(solvers, options);

fprintf('\n--- 测试 2 全部完成 ---\n');