function f = print_domain_spatially(domain)
x = size(domain);
pos = zeros(10,10);
for i = 1:x
    x(2)  = rem(i,10);
    if x(2) == 0
        x(2) = 10;
        x(1) = i/10;
        pos(x(1),x(2)) = domain(i,3);
    else
        x(1) = (i-x(2))/10 + 1;
        pos(x(1),x(2)) = domain(i,3);
    end
end
f = pos;
end