function f = is_feasible_point(x)
sz = length(x);
if sz == 2
    valc_1 = (x(1)-50).^2 + (x(2)-70).^2 - 100 ;
    valc_2 = (x(1)-25).^2 + (x(2)-50).^2 - 45 ;
    val_1 = 0;
    val_2 = 0;
    val_3 = 0;
    val_4 = 0;
    val_5 = 0;
    if x(2) - 10 >= 0
        val_1 = 1;
    end
    if x(2) - x(1) <= 0
        val_2 = 1;    
    end
    if 3*x(1) + 5*x(2) - 480 <= 0
        val_3 = 1;
    end
    if x(2) -10 - 3 * x(1) >= 0
        val_4 = 1;
    end
    if x(2) - x(1) -50 <= 0
        val_5 = 1;    
    end
    val =  val_1 * val_2 * val_3  ;
    val_6 = 0;
    if x(2) - x(1) -70 >=0
        val_6 = 1;
    end
        val_7 = 0;
    if x(1) -75 >= 0
        val_7 = 1;
    end
    val_8 = 0;
    if x(2) -80 <= 0
        val_8 = 1;
    end
    val_9 = 0;
    if x(2) -60 >= 0
        val_9 = 1;
    end
    if val == 1 
        f = 0;
    elseif  val_6  == 1
        f = 0;
    elseif val_4 * val_5 * val_1 == 1
        f = 0;
    elseif val_7 * val_8 * val_9 == 1
        f = 0;
    elseif valc_1 < 0
        f = 0;
    elseif valc_2 < 0
        f = 0;
    else
         f = 1;
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
elseif sz ==3
    f = 1;
    obstacle = [];
    % obstacle 2
%     obstacle_2 = [];
%     obstacle_2 = horzcat(obstacle_2, x(1) + x(2) - 20 > 0);
%     obstacle_2 = horzcat(obstacle_2, x(1) + x(2)  + x(3)- 40 < 0);
%     obstacle_2 = horzcat(obstacle_2, x(3) > 0);
%     obstacle_2 = horzcat(obstacle_2, 1);
    obstacler = [  x(1) + x(2) - 20 > 0, x(1) + x(2)  + x(3)- 40 < 0, x(3) > 0, 1];
    obstacle = vertcat(obstacle, obstacler);
%     % obstacle 3
    obstacler = [ x(1) + 2 * x(2) - 250 > 0, x(1) + 2 * x(2) - 275 < 0, x(3) > 75, x(3) < 100];
    obstacle = vertcat(obstacle, obstacler);
    obstacler = [];
    %%%%%%%%%%%%%%% lets begin
    obstacle = obstacle * [1 ;1 ;1 ;1];
    if sum(obstacle == 4 ) > 0
        f = 0;
    end
else
    disp('Not enough input arguments');
end
end