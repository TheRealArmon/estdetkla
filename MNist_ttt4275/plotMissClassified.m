function [] = plotMissClassified(classifiedIndex,labels,...
                                            predictions, testvalues)
    
    %Counting correctly missclassified values targets matrix
    num_false = 0;
    targets = zeros(10, size(testvalues,1));
    for k = 1:size(testvalues,1)
        targets(labels(k)+1,k) = 1;
        [~,i] = max(predictions(:,k));
        if labels(k)+1 ~= i
            num_false = num_false +1;
        end
    end
    
    %Generating array of correctly missclassified indices
    false = zeros(num_false,1);
    index = 1;
    for k = 1:size(testvalues,1)
        [~,i] = max(predictions(:,k));
        if labels(k)+1 ~= i
            false(index) = k;
            index = index + 1;
        end
    end

    %Generate image from vector
    k = classifiedIndex;
    x = zeros(28,28);
    x(:)= testvalues(false(k),:);
    
    figure(1)
    fprintf('True label:  %.f \n', labels(false(k)));
    [~,i] = max(predictions(:,false(k)));
    fprintf('Prediction:  %.f \n', i-1);
    image(x.');
end