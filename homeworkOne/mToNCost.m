function cost = mToNCost(d,k,c,h,m,n)
%mToNCost - 利用自底向上的动态规划算法求解DELS问题
%
%输入：
%   d(vector) : 各阶段的需求
%   k(vector) : 各阶段的固定成本
%   c(vector) : 各阶段的单位边际成本
%   h(vector) : 各阶段的持有库存的边际成本
%   m(number) : 开始的阶段
%   n(number) : 结束的后一阶段
%
%输出：
%   cost(number) : 第m期生产满足第m到n-1期的所有需求带来的成本

% cost = k(m) + c(m) .* sum(d(m:n-1));
% % 遍历从m 到 n-1期的 所有 holding cost 
% for i = m:n-2
%     cost = cost + h(i) .* sum(d(i+1:n-1));
% end

% 第二种实现方式
% \[ c_{m,i} \cdot d_i = c_m * d_i + (h_m + \cdots + h_{i-1}) * d_i  \]
cost = k(m);
for i = m:n-1
  cost = cost + c(m) .* d(i) + sum(h(m:i-1)) .* d(i);
end

% 任务2中c的算法
%disp("第一次cost"+cost);
%cost = k(m) +  ( c(m) + sum(h( m:length(d) )) ) .* sum(d(1:n-1));
%disp("第二次cost"+cost);
end
