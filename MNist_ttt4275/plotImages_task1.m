clear all
close all

%loading data
load('data_all.mat');
load('task1_results.mat');

%indices in the arrays of respectivly missclassified images and correctly
%classified images
missInd = [3,69,169,300];           %Indices must be less than 310
corrInd = [2355,3581,8739,9689];    %Indices must be less than 9690

figure(1)
sgtitle("Missclassified Pictures")
for i = 1:size(missInd, 2)
    subp = 220 + i;
    subplot(subp);
    plotMissClassified(missInd(i), testlab, pred_NN, testv);
end

figure(2)
sgtitle("Correctly Classified Pictures")
for i = 1:size(corrInd,2)
    subp = 220 + i;
    subplot(subp);
    plotCorrectClassified(corrInd(i), testlab, pred_NN, testv);
end