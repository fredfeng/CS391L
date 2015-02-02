function [ m, vector ] = hw1FindEigendigits( A )
%HW1FINDEIGENDIGITS Computing Eigendigits.
% A: Matrix
% m: mean of A
% vector: eigenvector of sigma
% Step 1: Mean of matrix A
%mean = mean2(A);
m = mean(A, 2);

%disp(m);

%total number of samples.
num = size(A, 2);

A = double(A);
% Step 2: Covariance matrix.
tmp = A - m * ones(1, num);
cov = (1/num) * tmp * transpose(tmp);

%disp(cov);

% Step 3: eigen value and vector
cov_trans = transpose(cov);

[eig_vec, eig_val] = eig(cov_trans * cov);

unsort_vec = cov * eig_vec;

% Step 4: order and normalize the result.
diag_vec = diag(eig_val);
[eig_val, I] = sort(diag_vec, 'descend');
% I is the desending order.
sort_vec = unsort_vec(:, I);
vector = normc(sort_vec);

end

