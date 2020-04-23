

labels = zeros(10, 10000);

for k = 1:10000
    labels(testlab(k)+1,k) = 1;
end

figure(2)
plotconfusion(pred,labels);
