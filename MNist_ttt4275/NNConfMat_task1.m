close all
clear all


%Loading data
load('data_all.mat');
load('task1_results.mat');

%Plotting confusion matrix
figure(1)
plotConfNumb(testlab, pred_NN);
title("NN without clustering");