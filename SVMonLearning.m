tic;
%load fisheriris
  domain_neo = vertcat(feasible_domain,infeasible_domain);
  X = domain_neo;
  Y = label;
% Y = species;
%load fisheriris
%X = meas(:,3:4);
%Y = species;
figure
gscatter(X(:,1),X(:,2),Y);
h = gca;
lims = [h.XLim h.YLim]; % Extract the x and y axis limits
title('{\bf Scatter Diagram of Nodes}');
xlabel('X cordinate (cm)');
ylabel('Y cordinate (cm)');
legend('Location','Northwest');
SVMobject = fitcsvm(X,Y,'ClassNames',{'feasible','infeasible'},...
    'KernelFunction','Gaussian','Standardize',true);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
d = 0.2; % Step size of the grid
[x1Grid,x2Grid] = meshgrid(min(X(:,1)):d:max(X(:,1)),...
    min(X(:,2)):d:max(X(:,2)));
xGrid = [x1Grid(:),x2Grid(:)];        % The grid
[labell,scores] = predict(SVMobject,[50 50]); % The scores 
%Train the SVM Classifier
%visuals are vaguue in SVM model
%model must have one obstacle 
%for multi obstacle system the labels must be obstacle1 ...2 3
%use the predictors score for djackstrav algorithm
toc;