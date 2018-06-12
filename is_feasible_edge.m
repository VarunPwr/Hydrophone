function f = is_feasible_edge(x_initial,x_final)
check = 1;
f = 1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for t = 0 : 0.001 : 1;%steps associated with the robot consider here a 3 d robot
    x = t * x_initial + (1-t) * x_final;
    if is_feasible_point(x(1),x(2)) == 0  
        check = 0;
        break;
    end
    %associated array is horizontal one
end
t = [];
f = check;    


%purpose of this check is to find the feasiblility of check
end