load ionosphere
rng(1); % For reproducibility
CVSVMModel = fitcsvm(X,Y,'Holdout',0.15,'ClassNames',{'b','g'},...
    'Standardize',true);
CompactSVMModel = CVSVMModel.Trained{1}; % Extract trained, compact classifier
testInds = test(CVSVMModel.Partition);   % Extract the test indices
XTest = X(testInds,:);
YTest = Y(testInds,:);
[label,score] = predict(CompactSVMModel,XTest(1,:));
%table(YTest(1:10),label(1:10),score(1:10,2),'VariableNames',...
  % {'TrueLabel','PredictedLabel','Score'})