
function [] = plotConf1(labels, predictions)

targets = zeros(10, 10000);

for k = 1:10000
    targets(labels(k)+1,k) = 1;
end

figure(1)
plotconfusion(predictions, targets);
xlabel("Classifier output",'FontSize', 12, 'FontWeight', 'bold');
ylabel("True label",'FontSize', 12, 'FontWeight', 'bold');
xticklabels({'0','1','2','3','4','5','6','7','8','9'});
yticklabels({'0','1','2','3','4','5','6','7','8','9'});
end
