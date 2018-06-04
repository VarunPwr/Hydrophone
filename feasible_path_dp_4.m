function f = feasible_path_dp_4(x,y,domain)
% followings needs to be changed but algorithm is correct
s = size(domain);
g = sqrt(s(1));
path = zeros(g,g);
%disp('ho')
for i =1 : g;
    for j = 1 : g;
%         if domain(10*(i-1)+j,3) == -1 ;  %change this shit
%             disp('hi')%% place value is subjective 
%             path(i,j) = 0;
       if  i >= x(1) && i <= y(1) && j >= x(2) && j <= y(2)
           if i ==x(1)                 %change this shit
                if j == x(2) 
                    path(i,j) = 1;
                else
                    if domain(10*(i-1)+j,3) ~= -1
                        path(i,j) = path(i,j-1) + 1;
                    else
                        path(i,j) = -1;
                        break;
                    end
                end
            elseif j > i-1
                if domain(10*(i-1)+j,3) ~= -1
                    path(i,j) = 1 + mean_custom(path(i,j-1),path(i-1,j));
                else
                    path(i,j) = -1;
                end
           end
       end     
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i =1 : g;
    for j = 1 : g;
%         if domain(10*(i-1)+j,3) == -1 ;  %change this shit
%             disp('hi')%% place value is subjective 
%             path(i,j) = 0;
        if i >= x(2) && i <= y(2) && j >= x(1) && j <= y(1)
            if i ==x(2)%change this shit
                if j == x(1) 
                    continue;
                else
                    if domain(10*(j-1)+i,3) ~= -1
                        path(j,i) = path(j-1,i) + 1;
                    else
                        path(j,i) = -1;
                        break;
                    end
                end
            elseif j > i-1
                if domain(10*(j-1)+i,3) ~= -1
                    path(j,i) = 1 + mean_custom(path(j-1,i),path(j,i-1));
                else
                    path(j,i) = -1;
                end    
            end 
       end     
    end
end
f = path(y(1),y(2));