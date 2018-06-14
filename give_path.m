answer = inputdlg('Enter space-separated intial point:',...
             'Sample', [1 50])
x_initial = str2num(answer{1});

answer = inputdlg('Enter space-separated final point:',...
             'Sample', [1 50])
x_final = str2num(answer{1});
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
initial_assign = [x_initial(1);x_initial(2)];
final_assign = [x_final(1);x_final(2)];
if is_feasible_point(initial_assign(1),initial_assign(2)) && is_feasible_point(final_assign(1),final_assign(2)) 
    V = vertcat(feasible_domain(:,1:2),infeasible_domain(:,1:2),initial_assign',final_assign');
    sz = size(V);
    r = randi([0 sz(1)],1,2);
    I = delaunay(V(:,1),V(:,2));
    J = I(:,[2 3 1]); E = [I(:) J(:)];
    [costs,paths] = dijkstra(V,E,[sz],[sz-1]);
    %%%%%%%%%%%%%%%%%%
    if isnan(paths{1,1}) == 0
        t = paths{1,1};
    elseif isnan(paths{2,1}) == 0
        t = paths{2,1};
    elseif isnan(paths{1,2}) == 0
        t = paths{1,2};
    elseif isnan(paths{2,2}) == 0
        t = paths{2,2};    
    end
    %%%%%%%%%%%%%%%%%%
    x_path = V(t',1);
    y_path = V(t',2);
    figure
    t = test_plot();
    plot(t(:,1),t(:,2),'.y')
    hold on
    plot(x_path,y_path,'-r')
    hold on
    plot(feasible_domain(:,1),feasible_domain(:,2),'.g')
    hold on 
    plot(infeasible_domain(:,1),infeasible_domain(:,2),'.r')
    hold off;
else
    disp('invalid input')
end