tic;
clear;close;
java(1) = 1;
java(2) = 0;
global label
label = [];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('hi');
global domain ;
domain = [];
global neo_domain
neo_domain = [];
a = 0;
b = 100;
x_domain = (b-a).*rand(10000,1) + a;
y_domain = (b-a).*rand(10000,1) + a;
count = zeros(10000,1);
domain = [x_domain y_domain count];
global feasible_domain;
feasible_domain = [];
global infeasible_domain;
infeasible_domain = [];

for i =1 : 2000
    %check domain
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     x_2 = [];
%     y_2 = [];
%     Problem is find an obstacle get to a new path
    x_1 = (b-a).*rand(1,1) + a;
    y_1 = (b-a).*rand(1,1) + a;
    x_2 = (b-a).*rand(1,1) + a;
    y_2 = (b-a).*rand(1,1) + a;
%     x_1 = 0;
%     y_1 =  0;
%     x_2 = 100;
%     y_2 = 100;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    x = [];
    y = [];
    x = x_1;%later check the feasibility of the intial and end point
    y = y_1;
    dist_prev =10000;
%     a = [x y];
    pos = [];
    while x ~= x_2 && y ~= y_2
    % for i =1: 3   
        if is_feasible_point(x, y) == 1
            feasible_domain = vertcat(feasible_domain, [x y ]) ;%cell typpe for svm
%             label = vertcat(label, cell(1));%previously a feasible domain
            dist_i = sqrt((domain(:,1) - x).^2 + (domain(:,2) - y).^2);
            dist_f = sqrt((domain(:,1) - x_2).^2 + (domain(:,2) - y_2).^2)  ;
            dist = dist_i+dist_f;
            
            %priority between whether the point is in the domain or the point
            %is near the body or the point is repeated one
%             while is_feasible_point(domain(pos,1), domain(pos,2)) == 0
%                 infeasible_domain = vertcat(infeasible_domain, [domain(pos,1) domain(pos,2)]);
%                 dist(pos) = [];
%                 dist_i(pos) = [];
%                 dist_f(pos) = [];
%                 domain(pos,:) = [];%keep this number as large as possible
%                 [val pos] = min(dist);
%             end
%             while dist_i(pos) >= dist_f(pos)
%                 dist(pos) = 10000000; %keep this number as large as possible
%                 [val pos] = min(dist);
%             end %check whether the point is same, niether repeated one
%             while domain(pos,1) == x && domain(pos,2) == y || domain(pos,3) == 1
%                 dist(pos) = 10000000;
%                 [val pos] = min(dist);
%             end
            count = [];
            count = 1;
            sz = size(dist);
            while sz(1) ~= count
                if is_feasible_point(domain(count,1),domain(count,2)) == 0 && dist_i(count) <= 5
                    infeasible_domain = vertcat(infeasible_domain, [domain(count,1) domain(count,2)]);
                    %previously infeasible domain
%                     label = vertcat(label, cell(-1));
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
            while dist_i(pos) >= 5 && domain(pos,1) == x && domain(pos,2) == y || domain(pos,3) == 1
%                 if is_feasible_point(domain(pos,1), domain(pos,2)) == 0
% %                     %keep this number as large as possible
%                      infeasible_domain = vertcat(infeasible_domain, [domain(pos,1) domain(pos,2)]);
%                      dist(pos) = [];
%                      dist_i(pos) = [];
%                      dist_f(pos) = [];
%                      domain(pos,:) = [];
%                 else
%                 dist(pos) = 10000000;
%                 end
                dist(pos) = 10000000;
                [val pos] = min(dist);
            end
            domain(pos,3) = 1;  
            if dist_prev > dist_f(pos)
                x = domain(pos,1);
                y = domain(pos,2);
                dist_prev = dist_f(pos)
            else
                x = x_2;
                y = y_2;
                break;
            end
            dist_i = [];
            dist_f = [];
            dist = [];
            
        else
            infeasible_domain = vertcat(infeasible_domain, [x y]);
            %previously infeasible domain
%             label = vertcat(label, cell(-1));
            domain(pos,:) = [];
            break;
        end   
%         a = vertcat(a, [x y]); 

    end
    domain(:,3) = 0;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if is_feasible_point(x, y) == 1
        feasible_domain = vertcat(feasible_domain, [x y]);
%         label = vertcat(label, cell(1));
        %previously feasible domain
    end
%     a =  vertcat(a, [x y]);
%      x= a(:,1);
%      y = a(:,2);
%      figure
%      plot(x_domain,y_domain,'.');
%      figure
%      plot(x,y);
end
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   x= infeasible_domain(:,1);%following is a plot of the domian 
   %g - feasible r - infeasible y - unexplored
   y= infeasible_domain(:,2);
   x_f= feasible_domain(:,1);
   y_f= feasible_domain(:,2);
   t = 1:0.5:360;
   x_boundary = sin(t).*sqrt(100) + 50;
   y_boundary = cos(t).*sqrt(100) + 50;
   figure
  % scatter(domain(:,1), domain(:,2),1,'y')
  % hold on
   scatter(x, y,1,'k')
   hold on
   scatter(x_f, y_f,1,'b');
 %  hold on
  % plot(x_boundary, y_boundary);
  
%    
%      figure
%      plot(x_domain,y_domain,'.');
%      figure
%      plot(x,y);
unexplored = 1;
for i =1 : size(domain)
    if is_feasible_point(domain(unexplored,1),domain(unexplored,2)) == 1
        unexplored = unexplored + 1;
    end
end
sizea = size(feasible_domain) + size(infeasible_domain);
label = cell(sizea(1),1);
for i =1 : size(feasible_domain) + size(infeasible_domain)
    if i > size(feasible_domain)
         label{i,1} = 'infeasible';
    else
         label{i,1} = 'feasible';
    end
end
toc