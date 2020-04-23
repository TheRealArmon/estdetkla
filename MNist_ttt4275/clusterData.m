function [] = clusterData(M)
    load('data_all.mat');
    load('task1_results.mat');
    
    clusters = zeros(M*10,size(trainv,2));
    for i = 0:9
        train_i = trainv(trainlab == i, :);
        [~,C] = kmeans(train_i, M);
        clusters(M*i+1:M*(i+1),:) = C;
    end

    clusterlab = zeros(M*10,1);
    for i = 0:9
        clusterlab(M*i+1:M*(i+1)) = i*ones(M,1);
    end
    
    save('Clustered_train.mat', 'clusters', 'clusterlab');
%     save("Clustered_train.mat", clusterlab);

end

