function f = is_feasible_point(x , y)
%disp('hi');add some fu
%suppose it is a circle at origin with radius 10
% 
 valc_1 = (x-50).^2 + (y-70).^2 - 100 ;
 valc_2 = (x-25).^2 + (y-50).^2 - 45 ;
%  valc_3 = (x-800).^2 + (y-900).^2 - 6250 ;
%  valc_4 = (x-190).^2 + (y-810).^2 - 4500 ;
%  valc_5 = (x-400).^2 + (y).^2 - 10000 ;

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
 val_7 = 0;
if x -75 >= 0
    val_7 = 1;
end
val_8 = 0;
if y -80 <= 0
    val_8 = 1;
end
val_9 = 0;
if y -60 >= 0
    val_9 = 1;
end
% end

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
% elseif valc_3 < 0
%     f = 0;
% elseif valc_4 < 0
%     f = 0;
% elseif valc_5 < 0
%     f = 0;
else
     f = 1;
end 
end