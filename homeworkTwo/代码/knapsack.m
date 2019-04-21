function [plan,opt] = knapsack(v,w,x)
%knapsack 使用动态规划求解0-1背包问题
%
%输入：
%   v(vector) : 每个物品的价值
%   w(vector) : 每个物品的重量
%   x(vector) : 背包的容量
%
%输出：
%   plan(vector) : 逻辑1或者逻辑0向量，表示是否选择该物品
%   opt(number) : 最优的物品价值

% 建立一个二维矩阵，存放最优的子问题。
temp = zeros(length(w), x+1);
s = zeros(length(w),x+1);

for i = 0:x
    if i >= w(1)
        temp(1,i+1) = 1;
        s(1,i+1) = 1;
    end
end

for i = 2:length(w)
    for j =0:x   % j表示当前背包的容量
        if j<w(i)            
            temp(i,j+1) = temp(i-1,j+1);
            s(i,j+1) = 0;
        else
            if temp(i-1,j+1) > temp(i-1,j-w(i)+1) + v(i)
                temp(i,j+1) = temp(i-1,j+1);
                s(i,j+1) = 0;
            else
                temp(i,j+1) = temp(i-1,j-w(i)+1) + v(i);
                s(i,j+1) = 1;
            end
        end
   end
end
opt = temp(length(w),x+1);
plan = knapsackRoad(w,x,s);
end