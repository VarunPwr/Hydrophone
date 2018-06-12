function f = is_feasible_point(x , y)
%disp('hi');add some fu
%suppose it is a circle at origin with radius 10
% 
% val_1 = (x-50).^2 + (y-50).^2 - 100 ;
% val_2 = (x-30).^2 + (y-45).^2 - 45 ;
% val_3 = (x-80).^2 + (y-90).^2 - 25 ;
% val_4 = (x-10).^2 + (y-10).^2 - 15 ;

val_1 = 0;
val_2 = 0;
val_3 = 0;

val_4 = 0;
val_5 = 0;

if y - 10 >= 0
    val_1 = 1;
end
if y - x <= 0
    val_2 = 1;    
end
if 3*x + 5*y - 480 <= 0
    val_3 = 1;
end
if y -10 - 3 * x >= 0
    val_4 = 1;
end
if y - x -50 <= 0
    val_5 = 1;    
end
    
    val =  val_1 * val_2 * val_3  ;
val_6 = 0;
if y-x -70 >=0
    val_6 = 1;
end

if val == 1 
    f = 0;
elseif val_6 == 1
    f = 0;
elseif val_4 * val_5 * val_1 == 1
    f = 0;
else
     f = 1;
end 
end