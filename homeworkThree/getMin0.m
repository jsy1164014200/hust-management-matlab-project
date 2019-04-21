function [a,b] = getMin0(A)
% getMin0 得到A矩阵中的最小元素的坐标
% 
% 输入
%    A：矩阵
% 输出
%    a：行索引
%    b：列索引

[r,c] = find( A == min(min(A)) );
a = r(1);
b = c(1);
end 