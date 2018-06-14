t = 100 * rand(100000,2);
for i = 1 : 100000
    if is_feasible_point(t(i,1),t(i,2)) == 0
        t(i,:) = [0,0];
    end
end
plot(t(:,1),t(:,2),'.');
