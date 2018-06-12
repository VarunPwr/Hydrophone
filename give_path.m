a = 0;
b = 100;
%initial_assign = (b-a).*rand(2,1) + a;
%final_assign = (b-a).*rand(2,1) + a;
initial_assign = [1;60];
final_assign = [60;1];
if is_feasible_point(initial_assign(1),initial_assign(2)) && is_feasible_point(final_assign(1),final_assign(2)) 
    V = vertcat(feasible_domain(:,1:2),infeasible_domain(:,1:2),initial_assign',final_assign');
    sz = size(V);
    r = randi([0 sz(1)],1,2);
    I = delaunay(V(:,1),V(:,2));
    J = I(:,[2 3 1]); E = [I(:) J(:)];
    [costs,paths] = dijkstra(V,E,[sz],[sz-1]);
    t = paths{1,1}   ;
    x_path = V(t',1);
    y_path = V(t',2);
    figure
    plot(x_path,y_path)
    hold on
    plot(feasible_domain(:,1),feasible_domain(:,2),'.y')
    hold on 
    plot(infeasible_domain(:,1),infeasible_domain(:,2),'.r')
    hold off
title('Travelling from (15,10) to (99,85)');
else
    disp('invalid input')
end