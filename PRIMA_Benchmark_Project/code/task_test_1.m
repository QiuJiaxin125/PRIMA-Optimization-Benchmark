% 测试 1: 对比 prima 的 double 与 single 精度
fprintf('--- 开始测试 1: Double vs Single Precision ---\n');

% 1. 定义问题设置
options = struct();
options.ptype = 'ubln';    % 测试所有约束类型
options.mindim = 2;        % 最小维数 2
options.maxdim = 2;       % 最大维数 20 

% 2. 定义两个求解器 (参考 example 4 的参数化定义方式)
% 算法 1: Double 精度
solver1 = @(fun, x0) prima(fun, x0, struct('precision', 'double'));
% 算法 2: Single 精度
solver2 = @(fun, x0) prima(fun, x0, struct('precision', 'single'));

solvers = {solver1, solver2};
options.solver_names = {'PRIMA_Double', 'PRIMA_Single'};

% 3. 测试 'plain' 特征 (无噪声)
fprintf('\n正在进行 "plain" 特征测试...\n');
options.feature_name = 'plain';
benchmark(solvers, options);

% 4. 测试 'noisy' 特征 (有噪声)
fprintf('\n正在进行 "noisy" 特征测试...\n');
options.feature_name = 'noisy';
benchmark(solvers, options);

fprintf('\n--- 测试 1 全部完成 ---\n');