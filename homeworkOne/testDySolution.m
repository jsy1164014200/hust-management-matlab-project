% % 测试代码,边界测试
% [result1,road1] = dySolution(1,1,1,1);
% [result2,road2] = dySolution(1,1,1,1);

% disp(result1==result2);
% disp(road1==road2);
% 
% 任务2中第一问结论正确
d = randi(10,100,10);
k = ones(1,10);
c = randi(10,1,10);
h = randi(10,1,10);

[a1,b1] = dySolution(d(1,:),k,c,h);
for i = 1:100
    if ~checkOptRoad(d(i,:),k,c,h,b1)
        disp("测试不通过");
    end  
end

d = randi(10,1,40);
k = randi(10,1,40);
c = randi(10,1,40);
h = randi(10,1,40);

for i = 1:40
    [opt,road] = dySolution(d(1,1:i),k(1,1:i),c(1,1:i),h(1,1:i));
    disp(road);
end

x = [0];
y = [0];
for i = 1:10:400
    d = randi(10,1,i);
    k = randi(10,1,i);
    c = randi(10,1,i);
    h = randi(10,1,i);
    x(end+1) = i;
    tic 
    dySolution(d,k,c,h);
    y(end+1) = toc;
end
figure;
p = polyfit(x,y,2);
y1 = polyval(p,x);
plot(x,y,'o');
hold on;
plot(x,y1);

title('平方算法-运行时间随规模变化拟合图');
xlabel('规模-向量的长度');
ylabel('时间');
legend('实际值','拟合曲线');
hold off;
disp(p);
