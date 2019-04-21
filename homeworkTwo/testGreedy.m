% count = 0;
% for i = 1:100
%     v = randi(10,1,i);
%     w = randi(10,1,i);
%     [plan1,opt1] = knapsack(v,w,cap);
%     [plan2,opt2] = greedy(v,w,cap);
%     if opt1 ~= opt2
%         count = count + 1;
%     end
% end
% fprintf('不通过次数:%d',count);

x = [0];
x1 = [0];
y = [0];
y1 = [0];
cap = 100;
for i = 1:100
    v = randi(10,1,i);
    w = randi(10,1,i);
    x(end+1) = i;
    tic 
    greedy(v,w,cap);
    y(end+1) = toc;
   
end

figure;
p = polyfit(x,y,1);
y1 = polyval(p,x);

plot(x,y);
hold on;
plot(x,y1);

title('运行时间随规模变化拟合图');
xlabel('规模-x');
ylabel('时间');
legend('实际值','拟合曲线');
hold off;
disp(p);
