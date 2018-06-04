function f = best_path_array(domain, x_1, y_1, x_2, y_2)
g = size(domain);
dist = sqrt((domain(:,1) - x_1).^2 + (domain(:,2) - y_1).^2) + sqrt((domain(:,1) - x_2).^2 + (domain(:,2) - y_2).^2)  ;
f_prev = 1000;
for i = 1 : 100
    [val pos] = min(dist);
    if is_feasible_point(domain(pos, 1), domain(pos, 2)) && is_feasible_edge(x_1, y_1, domain(pos, 1), domain(pos, 2)) && domain(pos,3) == 0
        f = domain(pos,1:2)
        if f < f_prev
            domain(pos,3) = 1;
        else
            f = [x_2 y_2];
        end
    end
        return;
    dist(pos,:) = [];
    f_prev = f;
end
f = 0;
end