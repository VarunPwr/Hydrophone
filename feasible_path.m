function f = feasible_path(x,y,domain,path)
 % f=0;
place_value = 101 * x(1)  + x(2) +1 ;
f_place_value = 101 * y(1)  + y(2) +1 ;
if domain(place_value,3) == 0 && domain(f_place_value,3) == 0
    disp('Invalid Inputs');
    f = 0;
%f =  domain(place_value+1,1:3);% + 101 x increases and + 1 y increases
else
    if domain(place_value + 101,3) == 1 && domain(place_value + 1,3) == 1
        %f =1;
        if x == y
           f = 0; 

        elseif x(1) == y(1)
                    %disp('N')
                    f = 1 + feasible_path(x+[0,1],y,domain,path);

        elseif x(2) == y(2)
                    %disp('E')
                    f = 1 + feasible_path(x+[1,0],y,domain,path); 



        elseif x(1) > 0 && x(2) > 0
            %[cost , pos]  = min([best_path(x+[1,0],y),best_path(x+[0,1],y)]);
           [cost , pos]  = min([feasible_path(x+[1,0],y,domain,path),feasible_path(x+[0,1],y,domain,path)]);
            switch pos
            case 1
                %disp('E')
                f = 1 + feasible_path(x+[1,0],y,domain,path);
            case 2
               % disp('N')
                f = 1 + feasible_path(x+[0,1],y,domain,path);
           % case 3
            %    disp('W')
             %   f = 1 + feasible_path(x-[1,0],y,domain);
            %case 4
             %   disp('S')
              %  f = 1 + feasible_path(x-[0,1],y,domain);
            otherwise
                disp('invalid')
                f = 0;
            end


        end
    else
        f = 0;
    end
end
path(place_value,3) = f;
end
%%,best_path(x+1,y,A),best_path(x,y+1,A)
