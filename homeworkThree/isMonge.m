function bool = isMonge(A)
% isMongo 判断A是否为Monge矩阵
% 
% 输入
%    A: m×n的矩阵
% 输出
%    bool： bool值

% 如果矩阵A的维度小于 2×2，那么返回false；
if any(size(A) < 2)
    bool = 0;
    return;
end
% 先在水平方向进行diff，然后在竖直方向进行diff，最后判断是否所有的元素都小于等于0；
bool = all( all( diff(diff(A,1,2),1,1) <= 0 ) ,2) ;
end 