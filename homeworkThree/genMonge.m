function A = genMonge(m,n)
% genMonge 生成一个m×n的Monge矩阵
% 输入
%    m(int): 矩阵的行数
%    n(int): 矩阵的列数
% 输出
%    A: Monge矩阵

if any([m<2,n<2])
    A = [];
    return;
end


CONSTANT = 9999;
A = zeros(m,n);
A(1,1) = randi(CONSTANT);
A(1,2) = randi(CONSTANT);
for i = 


end 