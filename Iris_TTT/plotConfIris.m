function [] = plotConfIris(labels, predictions)


%Generating targets for plotconfusion function from labels
targets = zeros(3, size(predictions,2));
for k = 1:size(predictions,2)
    targets(labels(k),k) = 1;
end

plotconfusion(predictions, targets);
xlabel("Classifier output",'FontSize', 12, 'FontWeight', 'bold');
ylabel("True label",'FontSize', 12, 'FontWeight', 'bold');
xticklabels({'Setosa','Versicolour','Virginica'});
yticklabels({'Setosa','Versicolour','Virginica'});
end

