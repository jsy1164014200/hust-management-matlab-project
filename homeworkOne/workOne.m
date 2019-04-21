% 测试第一问中的结论
d = randi(10,10,10);
k = randi(10,10,10);
c = randi(10,10,10);
h = randi(10,10,10);
tem = rand();
for i = 1:10
    [a1,b1] = dySolution(d(i,:),k(i,:),c(i,:),h(i,:));
    [a2,b2] = dySolution(d(i,:),k(i,:) + tem,c(i,:),h(i,:));
    [a3,b3] = dySolution(d(i,:),k(i,:),c(i,:) + tem,h(i,:));
    [a4,b4] = dySolution(d(i,:),k(i,:)+tem,c(i,:)+tem,h(i,:));
    if ~all([checkOptRoad(d(i,:),k(i,:),c(i,:) + tem,h(i,:),b1),checkOptRoad(d(i,:),k(i,:) + tem,c(i,:),h(i,:),b1),checkOptRoad(d(i,:),k(i,:)+tem,c(i,:)+tem,h(i,:),b1)]) 
        disp('测试不通过');
    end
end