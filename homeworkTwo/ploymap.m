x = [0];
x1 = [0];
y = [0];
y1 = [0];
cap = 1000;
for i = 1:100
    v = randi(10,1,i);
    w = randi(10,1,i);
    x(end+1) = i .* cap;
    tic 
    knapsack3(v,w,cap);
    y(end+1) = toc;
   
end

for i = 1:100
    v = randi(10,1,i);
    w = randi(10,1,i);
    x1(end+1) = i .* cap;

    tic 
    knapsack(v,w,cap);
    y1(end+1) = toc;
end
figure;
%p = polyfit(x,y,1);
%y1 = polyval(p,x);

plot(x,y);
hold on;
plot(x1,y1);

title('运行时间随规模变化拟合图');
xlabel('规模-nx');
ylabel('时间');
legend('第一种','第二种');
hold off;
disp(p);

% 0.0000   -0.1203 稀疏点

% 0.0000   -0.0054 密集点
