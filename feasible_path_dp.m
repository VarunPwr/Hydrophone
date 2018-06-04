function f = feasible_path_dp(x,y,domain)
path = zeros(10,10);
%disp('ho')
path(1,1) = 1;

for i =1 : max(y(1),y(2));
    for j = 1 : max(y(1),y(2));
        if i ==1
            if j ==1
                continue;
            else 
                path(i,j) = path(i,j-1) + 1;
                path(j,i) = path(j-1,i) + 1; 
            end
        else
            if j > i-1
                path(i,j) = 1 + min(path(i,j-1),path(i-1,j));
                path(j,i) = 1 + min(path(j-1,i),path(j,i-1));
            end
        end
    end
end
f = path;
end
