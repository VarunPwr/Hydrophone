tic;
clear;close;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('hi');
global domain ;
domain = [];
a = 0;
b = 100;
x_domain = (b-a).*rand(10000,1) + a;
y_domain = (b-a).*rand(10000,1) + a;
z_domain = (b-a).*rand(10000,1) + a;
count = zeros(10000,1);
domain = [x_domain y_domain z_domain count];
x_domain = [];
y_domain = [];
z_domain = [];
count = [];
figure
plot3(domain(:,1),domain(:,2),domain(:,3),'.')
title('Nodes generated before search');
global feasible_domain;
feasible_domain = [];
global infeasible_domain;
infeasible_domain = [];
%%%%
x = 0;%%defined first point as 0,0  which is feasible and last point as random x_2
y = 0;
z = 0;
x_2 = (b-a).*rand(1,1) + a;
y_2 = (b-a).*rand(1,1) + a;
z_2 = (b-a).*rand(1,1) + a;
figure
% t = test_plot();
% plot(t(:,1),t(:,2),t(:,3),'.y')
% hold on
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 for i =1 : 400
% while size(domain) ~= size(feasible_domain) - count 
    dist_prev =10000;
    pos = [];
    while x ~= x_2 && y ~= y_2 & z ~= z_2 %i am here right now
        if is_feasible_point([x y z]) == 1 %a dynamic step for moving from feasible previously to x,y !chANGE HERE
            feasible_domain = vertcat(feasible_domain, [x y z]) ;%cell typpe for svm
            dist_i = sqrt((domain(:,1) - x).^2 + (domain(:,2) - y).^2 + (domain(:,3) - z).^2);
            dist_f = sqrt((domain(:,1) - x_2).^2 + (domain(:,2) - y_2).^2 + (domain(:,3) - z_2).^2)  ;
            dist = dist_i+dist_f;
            count = [];
            count = 1;
            sz = size(dist);
            while sz(1) ~= count
                if is_feasible_point([domain(count,1) domain(count,2) domain(count,3)]) == 0 && dist_i(count) <= 0.3
                    %above condition dist_i < 0.3 is the IR bound for the
                    %robot
                    infeasible_domain = vertcat(infeasible_domain, [domain(count,1) domain(count,2) domain(count,3)]);
                    dist(count) = [];
                    dist_i(count) = [];
                    dist_f(count) = [];
                    domain(count,:) = [];
                end
                count = count +1;
                sz = [];
                sz = size(dist);
            end
            [val pos] = min(dist);
            while dist_i(pos) >= 0.3 && domain(pos,1) == x && domain(pos,2) == y && domain(pos,3) == z || domain(pos,4) == 1
%this step is very important dis_i(pos) >= dist_f(pos) suggest that the
%robt should follow nodes  such that it should be halfway from the destined
%node / it could be compensated for dist_i(pos) >= ir bound so that robot
%will only travel the visible nodes(dead reckoning)
                dist(pos) = 10000000;
                [val pos] = min(dist);
            end    
            if dist_prev > dist_f(pos)
                x = domain(pos,1);
                y = domain(pos,2);
                z = domain(pos,3);
                domain(pos,4) = 1;  
                dist_prev = dist_f(pos)
            else
                x = x_2;
                y = y_2;
                z = z_2;
                break;
            end
            dist_i = [];
            dist_f = [];
            dist = [];
            
        else
            infeasible_domain = vertcat(infeasible_domain, [x y z]);
            t = is_feasible_edge(feasible_domain(end,:),[x y z]);
            x = t(1);
            y = t(2);
            z = t(3);
            domain(pos,:) = [];
            break;
        end   
    end
    domain(:,4) = 0;
    x_2 = (b-a).*rand(1,1) + a;
    y_2 = (b-a).*rand(1,1) + a;
    z_2 = (b-a).*rand(1,1) + a;
    plot3(feasible_domain(:,1),feasible_domain(:,2),feasible_domain(:,3),'.g')
    if isnan(infeasible_domain) == 0
        hold on
        plot3(infeasible_domain(:,1),infeasible_domain(:,2),infeasible_domain(:,3),'.r')
    end
    pause(0.01)
    hold on
end
hold off;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
dist = [];
dist_i = [];
dist_f = [];
a = [];
b = [];
i = [];
x = [];
y = [];
z = [];
x_2 = [];
y_2 = [];
z_2 = [];
val = [];
dist_prev = [];
count = [];
sz = [];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
domain = [];
% x_f = [];
% y_f = [];
% x_boundary = [];
% y_boundary = [];
toc