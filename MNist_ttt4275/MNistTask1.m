

pred = zeros(10, num_test);

tic
for k = 1:num_test
    d = dist(trainv, testv(k,:).');
    [~, i] = min(d);
    pred_num = trainlab(i);
    pred(pred_num + 1,k) = 1;
    
    if mod(k,100) == 0
        k
    end
end
toc
