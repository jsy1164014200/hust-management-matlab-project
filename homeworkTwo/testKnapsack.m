v = [2 3 4 1 2];
w = [1 3 4 1 3];
x = 10;

[plan1,opt1] = knapsack(v,w,x)
[plan2,opt2] = greedy(v,w,x)