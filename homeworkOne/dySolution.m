function [result,road] = dySolution(d,k,c,h)
%dySolution - 利用自底向上的动态规划算法求解DELS问题
%
%算法时间复杂度为O(n^2),n为维度
%输入：
%   d(vector) : 各阶段的需求
%   k(vector) : 各阶段的固定成本
%   c(vector) : 各阶段的单位边际成本
%   h(vector) : 各阶段的持有库存的边际成本
%
%输出：
%   result(number) : 最小成本
%   road(vector) : 达到最小成本的方案(0代表不生产，1代表生产)
%
%example(d,k,c,h都为n维向量):
%   [optResult,road] = dySolution(d,k,c,h)

% 验证输入向量的维度
if any([size(d)~=size(k),size(d)~=size(c),size(d)~=size(h)]) 
    disp('请输入维度相同的向量');
    result = -1;
    road = -1;
    return 
end

% 预分配内存
% r(n) 表示从第1期到第n期的最小成本，该问题是动态规划的子问题。
% s(n) 表示r(n)对应最优子方案中最后一次生产的时期是在 第s(n)阶段。
r = zeros(1,length(d));
s = zeros(1,length(d));

% 遍历求解子问题
% 所有的子问题 都只计算了一次，算法的时间复杂度为 O(n^2) 
for i = 1:length(d)
    r(i) = mToNCost(d,k,c,h,1,i+1);
    s(i) = 1;
    for j = 1:i-1
        temp = r(j) + mToNCost(d,k,c,h,j+1,i+1);
        if temp < r(i) 
            r(i) = temp;
            s(i) = j+1;
        end
    end
end
% 最小成本
result = r(length(d));
% 根据s(n)计算路径 
road = dyRoad(length(d),s);
end