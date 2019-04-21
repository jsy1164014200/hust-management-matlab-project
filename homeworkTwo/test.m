V = randi(50,100,100);
W = randi(50,100,100);
for cap = 1:1000
    for i = 1:100
        [plan1,opt1] = knapsack(V(i),W(i),cap);
        [plan2,opt2] = knapsack3(V(i),W(i),cap);
        if opt1 ~= opt2 
            disp(V(i));
            disp(W(i));
            disp(opt1);
            disp(opt2);
        end
    end
end