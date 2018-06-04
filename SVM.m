tic;
load fisheriris
inds = ~strcmp(species,'setosa');
X = meas(inds,3:4);
y = species(inds);
SVMModel = fitcsvm(X,y);
toc;