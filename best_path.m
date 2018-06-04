function f = best_path(x,y)
%persistent A;
%global A
%%change best_path to feasbible path

    if x == y 
        disp('end')
 %       plot(A);

        f = 0 ;
    elseif x(1) > 0 && x(2) > 0
        if x(1) == y(1)
            disp('N')
            f = 1 + best_path(x+[0,1],y);
  %          A = horzcat(A,x + [0,1]);
        elseif x(2) == y(2)
            disp('S')
            f = 1 + best_path(x+[1,0],y); 
  %          A = horzcat(A,x+[1,0]);
        elseif x ~= y
            %if best_path(x+[1,0],y) > best_path(x+[0,1],y)
             %   A = horzcat(A,x + [0,1]);
             %   f = 1 + best_path 
            [g,pos] = min([best_path(x+[1,0],y),best_path(x+[0,1],y)]);
            switch pos
            case 1
            disp('E')
                f = 1 + best_path(x+[1,0],y);
            case 2
            disp('N')
            f = 1 + best_path(x+[0,1],y);
            end
          %  if(g(2))
           %     A = horzcat(A , x + [0,1]);
           % else
            %    A = horzcat(A, x + [1,0]);
           % end
        end
    end
     
    end
%%,best_path(x+1,y,A),best_path(x,y+1,A)
