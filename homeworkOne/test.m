d = randi(10,1000,10);
k = zeros(1,10);
c = randi(10,1,10);
h = randi(10,1,10);

[opt1,plan1] = dySolution(d(1,:),k,c,h);
for i = 1:1000
    [opt,plan] = dySolution(d(i,:),k,c,h);
    if plan ~= plan1
        disp(plan);
    end 
    if ~checkOptRoad(d(i,:),k,c,h,plan1)
        disp("测试不通过");
    end
end