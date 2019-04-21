function [plan,opt] = correctKnapsack(v,w,x)
%correctKnapsack    纠正1中的0-1背包问题解法，改为物品个数无限。
%
%输入：
%   v(vector) : 每个物品的价值
%   w(vector) : 每个物品的重量
%   x(vector) : 背包的容量
%
%输出：
%   plan(vector) : 表示第i个物品选了几个
%   opt(number) : 最优的物品价值

leng = length(v);
resultArr = zeros(1,x+1);  % g(x)的结果
s = zeros(x+1,leng);  % 路线

for i = 1:x
    % 赋一个初值 
    resultArr(i+1) = resultArr(i);
    s(i+1,:) = s(i,:);
    
    for j = find(w<=i)  % 找到所有重量比x小的索引  并且前面没有用 
        if v(j) + resultArr(i-w(j)+1) > resultArr(i+1)
            resultArr(i+1) = v(j) + resultArr(i-w(j)+1);
            s(i+1,:) = s(i-w(j)+1,:); 
            s(i+1,j) = s(i+1,j) + 1;
        end
    end
end


plan = s(i+1,:);
opt = resultArr(x+1);

end