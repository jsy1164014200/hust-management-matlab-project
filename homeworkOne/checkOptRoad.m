function result = checkOptRoad(d,k,c,h,road)
%checkOptRoad - 判断给定路径是否是动态规划的最优解
%
%输入：
%   d(vector) : 各阶段的需求
%   k(vector) : 各阶段的固定成本
%   c(vector) : 各阶段的单位边际成本
%   h(vector) : 各阶段的持有库存的边际成本
%   road(vector) : 路线
%
%输出：
%   result(boolean) : 逻辑1或者逻辑0

plan = find(road == 1);
sum = 0;
for i = 1:length(plan)-1
    sum = sum + mToNCost(d,k,c,h,plan(i),plan(i+1));
end
sum = sum + mToNCost(d,k,c,h,plan(length(plan)),length(d)+1);
% disp(sum);
% disp(dySolution(d,k,c,h));
result = sum == dySolution(d,k,c,h);
end