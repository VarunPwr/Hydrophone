function f = initialize_domain
% initialize the domain which is the node along with its association with
% nodes
a = 0;b = 100;
x = (b -a) * rand(100,2) + a;
x = vertcat(x, [0 0]);
figure
plot(x(:,1),x(:,2),'.');
hold on
adj_index = delaunay(x(:,1),x(:,2));
adj_index = triangulation(adj_index,x(:, 1),x(:, 2),zeros(size(x(:, 1))));
trimesh(adj_index);
hold off;
f = [1 1];
end