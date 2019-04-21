x = [0];
y = [0];
for i = 1:10:1000
    d = randi(10,1,i);
    k = randi(10,1,i);
    c = randi(10,1,i);
    h = randi(10,1,i);
    x(end+1) = i;
    tic 
    OnDySolution(d,k,c,h);
    y(end+1) = toc;
end
figure;
[p,s] = polyfit(x,y,1);
[y1,d] = polyval(p,x,s);

plot(x,y,'o');
hold on;
plot(x,y1);

title('线性算法-运行时间随规模变化拟合图');
xlabel('规模-向量的长度');
ylabel('时间');
legend('实际值','拟合曲线');
hold off;

disp(p);
disp(y1);
disp(d);