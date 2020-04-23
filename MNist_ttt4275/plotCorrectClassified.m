close all

num_correct = 0;

labels = zeros(10, 10000);
for k = 1:10000
    labels(testlab(k)+1,k) = 1;
    [~,i] = max(pred(:,k));
    if testlab(k)+1 == i
        num_false = num_false +1;
    end
end

correct = zeros(num_correct,1);
index = 1;
for k = 1:num_test
    
    [~,i] = max(pred(:,k));
    if testlab(k)+1 == i
        correct(index) = k;
        index = index + 1;
    end
end

k = 98; % 98, 

x = zeros(28,28);
x(:)= testv(correct(k),:);
figure(1)

disp(testlab(correct(k)));
[~,i] = max(pred(:,correct(k)));
disp(i-1);
image(x.');