function f = feasible_path_dp_3(x,y,domain)
% followings needs to be changed but algorithm is correct
path = zeros(10,10);
%disp('ho')
path(1,1) = 1;
for i =1 : 10;
    for j = 1 : 10;
%         if domain(10*(i-1)+j,3) == -1 ;  %change this shit
%             disp('hi')%% place value is subjective 
%             path(i,j) = 0;
        if i ==1
            if j == 1 
                continue;
            else
                if domain(10*(i-1)+j,3) ~= -1
                    path(i,j) = path(i,j-1) + 1;
                else
                    path(i,j) = -1;
                    break;
                end
                if domain(10*(j-1)+i,3) ~= -1
                    path(j,i) = path(j-1,i) + 1;
                else
                    path(j,i) = -1;
                    break;
                end
            end
        elseif j > i-1
            if domain(10*(i-1)+j,3) ~= -1
                path(i,j) = 1 + mean_custom(path(i,j-1),path(i-1,j));
            else
                path(i,j) = -1;
            end
            if domain(10*(j-1)+i,3) ~= -1
                path(j,i) = 1 + mean_custom(path(j-1,i),path(j,i-1));
            else 
                path(j,i) = -1;
            end
        end 
    end
end
f = path;