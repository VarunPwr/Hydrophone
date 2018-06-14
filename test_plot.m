function f = test_plot()
t = 100 * rand(1000000,2);
for i = 1 : 1000000
    if is_feasible_point([t(i,1) t(i,2)]) == 1
        t(i,:) = [0,0];
    end
end
f = t;
