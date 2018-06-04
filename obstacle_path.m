function f =  obstacle_path(domain)
x = [5 8];
domain(10 * x(1)  + x(2),3) = -1;
f = 0;
end