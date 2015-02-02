function [ group ] = knn( trainSet, testSet, labels, k )
%K-nearest neigbour.
%   Detailed explanation goes here
num_test = size(testSet,1);
num_train = size(trainSet,1);

group = [];
for i = 1 : num_test
    point = testSet(i, :);
    point_rep = trainSet - repmat(point,num_train,1);
    dist_vec = sum((trainSet - point_rep).^2, 2);
    
    [min_vec, order] = sort(dist_vec,'ascend');
    order_labels = labels(order);
    order_labels = order_labels(1:k);
    
    min = mode(order_labels);
    group = [group; min];
end

end

