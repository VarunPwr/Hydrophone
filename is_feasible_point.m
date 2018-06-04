function f = is_feasible_point(x, y)
%disp('hi');add some fu
%suppose it is a circle at origin with radius 10
val_1 = (x-50).^2 + (y-50).^2 - 100 ;
val_2 = (x-30).^2 + (y-45).^2 - 45 ;
val_3 = (x-80).^2 + (y-90).^2 - 25 ;
val =  val_1 * val_2 * val_3;
if val > 0 
    f = 1;
else
     f = 0;
end 
end