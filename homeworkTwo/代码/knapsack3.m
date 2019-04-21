function [plan,opt] = knapsack3(v,w,x)
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

leng = length(v);
resultArr = zeros(1,x+1);  % g(x)的结果
s = zeros(x+1,leng);  % 路线

for i = 1:x
    % 赋一个初值 
    resultArr(i+1) = resultArr(i);
    s(i+1,:) = s(i,:);
    for j = find(w<=i)  % 找到所有重量比x小的索引  并且前面没有用 
        if ismember(j,find(s(i-w(j)+1,:) == 1) )
            continue;
        end
        if v(j) + resultArr(i-w(j)+1) > resultArr(i+1)
            resultArr(i+1) = v(j) + resultArr(i-w(j)+1);
            s(i+1,:) = s(i-w(j)+1,:); 
            s(i+1,j) = 1;
        end
    end
end

plan = s(i+1,:);
opt = resultArr(x+1);

end