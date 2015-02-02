function [ output_args ] = hw1RunSamples( num_train, num_test, num_top_eig_vec, num_k )
%HW1RUNSAMPLES Summary of this function goes here
%   Detailed explanation goes here
% Step 1: Load data and pick up samples: k
load digits.mat;

A = trainImages(:,:,1:num_train);
A = reshape(A,28*28,num_train);

% Step 2: Compute eigenvalue and eigenvector.
[mean, eig_vec] = hw1FindEigendigits(A);

% only pick top num_K eigen value.

eig_vec_trans = transpose(eig_vec);
% Step 3: Plot training data to eigenspace.
proj_train = [];

for i = 1 : num_train
    Train = trainImages(:,:,1,i);
    % FIXME.
    Train = double(Train(:)) - mean;
    %avg_Train = Train - mean;
    train_data = eig_vec_trans * Train;
    proj_train = [proj_train, train_data];
end       

% Step 4: Plot testing data to eigenspace.
proj_test = [];
for i = 1 : num_test
    Test = testImages(:,:,1,i);
    avg_test = double(Test(:)) - mean;
    test_data = eig_vec_trans * avg_test;
    proj_test = [proj_test, test_data];
end

% Step 5: Perform classification by KNN
group = knn(proj_train',proj_test',trainLabels,num_k);

% Step 6: Compute accuracy.
succ_rate = sum(group == testLabels(1:num_test)')/num_test

disp(group');
disp(testLabels(1:num_test));
disp(succ_rate);
end

