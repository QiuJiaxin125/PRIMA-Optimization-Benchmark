function task_1_3()
    % 设置维数 n
    n = 10; 
    % 初始点: [-1, ..., -1] 
    x0 = -ones(n, 1); 

    % 定义 n 维 Rosenbrock 目标函数
    % f(x) = sum_{i=1}^{n-1} [100(x_{i+1} - x_i^2)^2 + (1 - x_i)^2]
    rosen = @(x) sum(100*(x(2:end) - x(1:end-1).^2).^2 + (1 - x(1:end-1)).^2);

    fprintf('开始测试 Rosenbrock 函数 (n=%d)...\n', n);

    % --- 1. 无约束 ---
    fprintf('\n测试类型: 无约束\n');
    [x, f, exitflag, output] = prima(rosen, x0);
    print_results(f, exitflag, output);

    % --- 2. 界约束: x <= 0 ---
    fprintf('\n测试类型: 界约束 (x <= 0)\n');
    lb = []; % 无下界
    ub = zeros(n, 1); % 上界为 0
    [x, f, exitflag, output] = prima(rosen, x0, [], [], [], [], lb, ub);
    print_results(f, exitflag, output);

    % --- 3. 线性约束: sum(x) <= 1, x >= 0 ---
    fprintf('\n测试类型: 线性约束 (sum(x) <= 1, x >= 0)\n');
    % A*x <= b -> ones(1, n) * x <= 1
    A = ones(1, n); 
    b = 1;
    lb = zeros(n, 1); % 下界为 0
    ub = [];
    [x, f, exitflag, output] = prima(rosen, x0, A, b, [], [], lb, ub);
    print_results(f, exitflag, output);

    % --- 4. 非线性约束: sum(x^2) <= 1, x >= 0 ---
    fprintf('\n测试类型: 非线性约束 (sum(x^2) <= 1, x >= 0)\n');
    lb = zeros(n, 1);
    % 非线性约束定义在下方子函数 nlc 中
    [x, f, exitflag, output] = prima(rosen, x0, [], [], [], [], lb, [], @nlc);
    print_results(f, exitflag, output);
end

% 定义非线性约束函数
function [cineq, ceq] = nlc(x)
    % sum(x^2) <= 1  等价于  sum(x^2) - 1 <= 0
    cineq = sum(x.^2) - 1; 
    ceq = [];
end

% 辅助打印函数
function print_results(f, exitflag, output)
    fprintf('最优值: %e\n', f);
    fprintf('退出标志: %d\n', exitflag);
    fprintf('函数计算次数: %d\n', output.funcCount);
end