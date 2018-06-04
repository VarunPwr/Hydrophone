clear;close;
global domain;
domain(:,:) = [];


for i = 1:20
    for j = 1:20
        domain = vertcat(domain,[i j 1 0]); %last variable defines
      %the count 
    end
end
%%initial and final points%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
initial_point = [1,5];
final_point = [10,18];
%%%%%%%%%%%%%%%%%Adding points to domain which are infeasible%%%%%%%%%%
x = [1 6];
domain(10 * (x(1)-1)  + x(2),3) = -1;

x = [7 4];
domain(10 * (x(1)-1)  + x(2),3) = -1;

x = [11 14];
domain(10 * (x(1)-1)  + x(2),3) = -1;

x = [8 3];
domain(10 * (x(1)-1)  + x(2),3) = -1;

x = [7 5];
domain(10 * (x(1)-1)  + x(2),3) = -1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%global A ;
%best_path(initial_point,final_point)
%%%learning step%%%%
%obstacle_path(domain)
% path = feasible_path_dp_2(initial_point,final_point,domain);
% pos = print_domain_spatially(domain);
% 
% path         %end point gives the most feasible path to travel 
% %from initial to final point
% pos
