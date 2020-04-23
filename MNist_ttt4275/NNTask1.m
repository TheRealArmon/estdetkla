
%Takes about an hour to run (results stored in task1_results.mat)
load('data_all.mat');
load('task1_results.mat');

pred = zeros(10, num_test);

tic
for k = 1:num_test
    d = dist(trainv, testv(k,:).');
    [~, i] = min(d);
    pred_num = trainlab(i);
    pred(pred_num + 1,k) = 1;
end
toc

save('task1_results.mat', pred);
