function f= mean_custom(x,y)
if x > 0 && y > 0
    if x > y
        f = y;
    else
        f = x;
    end
else
    if x <= 0 && y > 0
        f = y;
    elseif x > 0 && y <= 0
        f = x;
    elseif x <= 0 && y <=0
        f= -2;
    end
end
end