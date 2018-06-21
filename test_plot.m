function f = test_plot(dim)
if dim == 2
    t = 100 * rand(1000000,2);
    for i = 1 : 1000000
        if is_feasible_point([t(i,1) t(i,2)]) == 1
            t(i,:) = [0,0];
        end
        
    end
    f = t;
elseif dim == 3
    t = 100 * rand(1000000,3);
    for i = 1 : 1000000
        if is_feasible_point([t(i,1) t(i,2) t(i,3)]) == 1
            t(i,:) = [0,0,0];
        end
        
    end
    f = t;
else
    disp('invalid input');
end


