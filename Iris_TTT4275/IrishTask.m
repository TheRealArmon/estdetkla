clear all 
close all 

%Init values
features = [1,2,3,4];       %Remove numbers to remove corresponding features
C = 3;                      %Num classes
D = size(features,2);       %Num features

N_train = 30;               %Num training cases
N_test = 20;                %Num test cases
N_tot = N_train + N_test;   %Total number of cases

%Training/test indices
%First 30 training, last 20 testing
idx_train = 1:N_train;
idx_test  = N_train+1:N_tot;

%First 20 testing, last 30 training
% idx_train = N_test+1:N_tot;
% idx_test = 1:N_test;

%Loading data
class1 = load('class_1');
class2 = load('class_2');
class3 = load('class_3');

%Removing "Unwanted features"
class1 = class1(:,features); 
class2 = class2(:,features);
class3 = class3(:,features);

%Combining classes into complete test and training sets
train_set = [class1(idx_train,:).', ...
    class2(idx_train,:).', class3(idx_train,:).'];
test_set = [class1(idx_test,:).', ...
    class2(idx_test,:).', class3(idx_test,:).'];

%Targets used for training
t1 = [1 0 0].';
t2 = [0 1 0].';
t3 = [0 0 1].';
targets = [repmat(t1, 1, N_train), repmat(t2,1,N_train),repmat(t3,1,N_train)];

%Gradient descent training
W = eye(C, D + 1);
alpha = 0.01;
tol = 0.2;
grad_MSE = @(gk, tk, xk) ((gk-tk).*gk.*(1-gk))*xk.' ; %Gradient function

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
   
   %Stopping condition: if gradient is "small enough"
   if (norm(grad) < tol)
       break
   end
end
toc

%Testing classifier on test cases
pred_test =  zeros(C, size(test_set,2));
for k = 1:size(test_set,2)
    xk = [test_set(:,k);1];
    [~, class] = max(W*xk);
    pred_test(class, k) = 1;
end

%Testing classifier on training cases
pred_train = zeros(C, size(train_set,2));
for k = 1:size(train_set,2)
    xk = [train_set(:,k);1];
    [~, class] = max(W*xk);
    pred_train(class, k) = 1;
end

%Label arrays for plotting
test_labels = [ones(1, N_test), 2*ones(1,N_test),3*ones(1,N_test)];
train_labels = [ones(1, N_train), 2*ones(1,N_train),3*ones(1,N_train)];

figure(1)
plotConfIris(test_labels, pred_test);
title('Test Cases');

figure(2)
plotConfIris(train_labels, pred_train);
title("Training Cases");
