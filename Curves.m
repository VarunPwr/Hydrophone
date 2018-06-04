clear;
close;
x = [1 2 3 4 5];
y = [5.5 43.1 128 290.7 498.4];
p = polyfit(x,y,3);
x2 = 1:.1:5;
y2 = polyval(p,x2);
plot(x,y,'o',x2,y2)
grid on