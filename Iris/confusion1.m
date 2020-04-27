function [confusion] = confusion1(true_label,classified)
    confusion = zeros(size(true_label,1));
    
    for k = 1:size(true_label,2)
        [~, label] = max(true_label(:,k));
        [~, class_label] = max(classified(:,k));
        confusion(label,class_label) = confusion(label,class_label) + 1;
    end
    
    
end

