d = randi(100 ,100 ,20);
k = randi(100 ,100 ,20);
c = randi(100 ,100 ,20);
h = randi(100 ,100 ,20);

for i = 1:100
    [opt,plan] = dySolution(d(i,:),k(i,:),c(i,:),h(i,:));
    [opt2,plan2] = OnDySolution(d(i,:),k(i,:),c(i,:),h(i,:));
    if opt ~= opt2
        disp(d(i,:));
        disp(k(i,:));
        disp(c(i,:));
        disp(h(i,:));
        disp(opt);
        disp(opt2);
        disp(plan);
        disp(plan2);
        
    end
end