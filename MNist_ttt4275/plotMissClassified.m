
close all

num_false = 0;

labels = zeros(10, 10000);
for k = 1:10000
    labels(testlab(k)+1,k) = 1;
    [~,i] = max(pred(:,k));
    if testlab(k)+1 ~= i
        num_false = num_false +1;
    end
end

misclasified = zeros(num_false,1);
index = 1;
for k = 1:num_test
    
    [~,i] = max(pred(:,k));
    if testlab(k)+1 ~= i
        misclasified(index) = k;
        index = index + 1;
    end
end

k = 2;

x = zeros(28,28);
x(:)= testv(misclasified(k),:);
figure(1)

disp(testlab(misclasified(k)));
[~,i] = max(pred(:,misclasified(k)));
disp(i-1);
image(x.');







