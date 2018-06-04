function f = feasible_path_dp_2(x,y,domain)
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
           if i == x(1)                 %change this shit
                if j == x(2) 
                    path(i,j) = 1;
                else
                    path(i,j) = path(i,j-1) + 1;
                end
           elseif j > i-1
                path(i,j) = 1 + min(path(i,j-1),path(i-1,j));
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
                    path(j,i) = path(j-1,i) + 1;
                end
            elseif j > i-1
                path(j,i) = 1 + min(path(j-1,i),path(j,i-1));    
            end 
       end     
    end
end
f = path;