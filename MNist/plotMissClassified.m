function [] = plotMissClassified(classifiedIndex,labels,...
                                            predictions, testvalues)
    
    %Counting targets matrix for missclassified values
    num_false = 0;
    targets = zeros(10, size(testvalues,1));
    for k = 1:size(testvalues,1)
        targets(labels(k)+1,k) = 1;
        [~,i] = max(predictions(:,k));
        if labels(k)+1 ~= i
            num_false = num_false +1;
        end
    end
    
    %Generating array of missclassified indices
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
    
    [~,i] = max(predictions(:,false(k)));
    disp(num_false);
    image(x.');
    title(['True label: ' num2str(labels(false(k))) ...
        '     Prediction: ' num2str(i - 1)])
end