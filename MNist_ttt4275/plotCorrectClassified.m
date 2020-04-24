function [] = plotCorrectClassified(classifiedIndex,labels,...
                                            predictions, testvalues)
    
    %Counting correctly classified values
    num_correct = 0;
    targets = zeros(10, 10000);
    for k = 1:10000
        targets(labels(k)+1,k) = 1;
        [~,i] = max(predictions(:,k));
        if labels(k)+1 == i
            num_correct = num_correct +1;
        end
    end
    
    %Generating array of correctly classified indices
    correct = zeros(num_correct,1);
    index = 1;
    for k = 1:size(testvalues,1)
        [~,i] = max(predictions(:,k));
        if labels(k)+1 == i
            correct(index) = k;
            index = index + 1;
        end
    end

    %Generate image from vector
    k = classifiedIndex;
    x = zeros(28,28);
    x(:)= testvalues(correct(k),:);
    
%     fprintf('True label:  %.f \n', labels(correct(k)));
    [~,i] = max(predictions(:,correct(k)));
%     fprintf('Prediction:  %.f \n', i-1);
    disp(num_correct);
    image(x.');
    title(['True label: ' num2str(labels(correct(k))) ...
        '     Prediction: ' num2str(i - 1)])
end