function [plan,opt] = greedy(v,w,x)
%greedy 使用贪婪算法求解0-1背包问题的近似解。
%
%输入：
%   v(vector) : 每个物品的价值
%   w(vector) : 每个物品的重量
%   x(vector) : 背包的容量
%
%输出：
%   plan(vector) : 逻辑1或者逻辑0向量，表示是否选择该物品
%   opt(number) : 最优的物品价值
unit = v./w;
plan = zeros(1,length(w));
opt = 0;

i = find(unit==max(unit));
i = i(1);

while x >= w(i)
    plan(i) = 1;
    opt = opt + v(i);
    x = x - w(i);
    unit(i) = 0;
    i = find(unit==max(unit));
    i = i(1);
end

end