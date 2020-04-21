clear all 
close all 
clc

class1 = load('class_1');   % Setosa
class2 = load('class_2');   % Versicolour
class3 = load('class_3');   % Virginica

C = 3;                      %Num classes
D = size(class1, 2);        %Num traits
N_train = 30;
N_test = 20;

train_set = [class1(1:N_train,:).', ...
    class2(1:N_train,:).', class3(1:N_train,:).'];
test_set = [class1(N_train+1:end,:).', ...
    class2(N_train+1:end,:).', class3(N_train+1:end,:).'];


grad_MSE = @(gk, tk, xk) ((gk-tk).*gk.*(1-gk))*xk.' ;

%targets
t1 = [1 0 0].';
t2 = [0 1 0].';
t3 = [0 0 1].';
T = [repmat(t1, 1, N_train), repmat(t2,1,N_train),repmat(t3,1,N_train)];
W = eye(C, D + 1);
alpha = 0.001;
tol = 0.2;
it = 0;
cond = 1;
while true
   grad = zeros(size(W));
   for k = 1:size(train_set,2)
       xk = [train_set(:,k); 1];
       gk = sigmoid(W*xk);
       tk = T(:,k);
       
       grad = grad + grad_MSE(gk, tk, xk);
   end
   
%    cond = norm(grad) >= tol;
   W = W - alpha*grad;
   
   if (norm(grad) < tol)
       break
   end
   it = it + 1;
end

disp(it)

test_labels = [repmat(t1, 1, N_test), repmat(t2,1,N_test),repmat(t3,1,N_test)];
predicted_test =  zeros(C, size(test_set,2));
for k = 1:size(test_set,2)
    xk = [test_set(:,k);1];
    gk = sigmoid(W*xk);
    [wk, class] = max(gk);
    predicted_test(class, k) = 1;
end

predicted_train = zeros(C, size(train_set,2));
for k = 1:size(train_set,2)
    xk = [train_set(:,k);1];
    gk = sigmoid(W*xk);
%     display(gk);
    [wk, class] = max(gk);
    predicted_train(class, k) = 1;
end

% testconf = confusion1(T,predicted_train)
% trainconf = confusion1(test_labels, predicted_test)

figure(1)
plotconfusion(T, predicted_train);

figure(2)
plotconfusion(test_labels, predicted_test);

