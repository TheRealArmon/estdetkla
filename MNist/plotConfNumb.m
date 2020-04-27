function [] = plotConfNumb(labels, predictions)

%Generates targets for plotconfusion function
targets = zeros(10, size(predictions,2));
for k = 1:size(predictions,2)
    targets(labels(k)+1,k) = 1;
end

%Plots confusion matrix
plotconfusion(predictions, targets);
xlabel("Classifier output",'FontSize', 12, 'FontWeight', 'bold');
ylabel("True label",'FontSize', 12, 'FontWeight', 'bold');
xticklabels({'0','1','2','3','4','5','6','7','8','9'});
yticklabels({'0','1','2','3','4','5','6','7','8','9'});
end
