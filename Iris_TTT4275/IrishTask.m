clear all 
close all 
clc


features = [1,2,3,4];       %Remove numbers to remove correspong features
C = 3;                      %Num classes
D = size(features,2);       %Num features

%Swap these for different tasks
N_train = 20;               %Num training cases
N_test = 30;                %Num test cases

%Loading data
class1 = load('class_1');   % Setosa
class2 = load('class_2');   % Versicolour
class3 = load('class_3');   % Virginica

%Remove "Unwanted features"
class1 = class1(:,features); 
class2 = class2(:,features);
class3 = class3(:,features);

%Combining classes into complete test and trainging sets
train_set = [class1(1:N_train,:).', ...
    class2(1:N_train,:).', class3(1:N_train,:).'];
test_set = [class1(N_train+1:end,:).', ...
    class2(N_train+1:end,:).', class3(N_train+1:end,:).'];

%targets
t1 = [1 0 0].';
t2 = [0 1 0].';
t3 = [0 0 1].';
targets = [repmat(t1, 1, N_train), repmat(t2,1,N_train),repmat(t3,1,N_train)];


%function to calculate gradient used in training
grad_MSE = @(gk, tk, xk) ((gk-tk).*gk.*(1-gk))*xk.' ;

%Gradient descent training
W = eye(C, D + 1);
alpha = 0.001;
tol = 0.2;

tic
while true
   grad = zeros(size(W));
   
   for k = 1:size(train_set,2)
       xk = [train_set(:,k); 1];
       gk = sigmoid(W*xk);
       tk = targets(:,k);
       grad = grad + grad_MSE(gk, tk, xk);
   end
   
   W = W - alpha*grad;
   
   %Stopping condition: if gradient i "small enough"
   if (norm(grad) < tol)
       break
   end
end
toc


%Testing classifier on test cases
pred_test =  zeros(C, size(test_set,2));
for k = 1:size(test_set,2)
    xk = [test_set(:,k);1];
    gk = sigmoid(W*xk);
    [~, class] = max(gk);
    pred_test(class, k) = 1;
end

%Testing classifier on training cases
pred_train = zeros(C, size(train_set,2));
for k = 1:size(train_set,2)
    xk = [train_set(:,k);1];
    gk = sigmoid(W*xk);
    [~, class] = max(gk);
    pred_train(class, k) = 1;
end

test_labels = [ones(1, N_test), 2*ones(1,N_test),3*ones(1,N_test)];
train_labels = [ones(1, N_train), 2*ones(1,N_train),3*ones(1,N_train)];

figure(1)
plotConfIris(test_labels, pred_test);
title("Confusion Matrix for Test Cases");

figure(2)
plotConfIris(train_labels, pred_train);
title("Confusion Matrix for Training Cases");
