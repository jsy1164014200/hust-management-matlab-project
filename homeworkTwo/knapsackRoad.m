function plan = knapsackRoad(w,x,s)
% 根据子问题矩阵迭代出最优方案。

plan = zeros(1,length(w));
begin = length(w);% 从最后一个物品开始计算。
leave = x;%剩余的容量 
while begin > 0
    t = s(begin,leave+1);
    if t == 1
        plan(begin) = 1;
        leave = leave - w(begin);
        begin = begin - 1;
    else
        begin = begin - 1;
    end
end

end