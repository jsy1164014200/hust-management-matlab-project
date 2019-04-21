function road = dyRoad(leng,s)
%dyRoad - 根据动态规划给出的s，递归的给出最优决策方案
%
%路径的递归定义： 1 ---> ... ---> s(s(n) - 1) --->  s(n) ---> N 
%输入：
%   leng(number):阶段数目
%   s(vector):在动态规划算法中给出的s
%输出：
%   road(vector) : 达到最小成本的方案(0代表不生产，1代表生产)

road = zeros(1,leng);
point = leng;
while point > 0 
    road(s(point)) = 1;
    point = s(point) - 1;
end
end