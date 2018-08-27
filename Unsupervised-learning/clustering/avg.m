function result = avg(C, p)
% C is the matrix of a cluster
% D is the sample set
% p is a param of minkowski distance
% if p is not set, p = 2 by default

if nargin < 2
    p = 2;
end

len = size(C, 1);

sum = 0;
for i = 1 : len
    for j = i + 1 : len
        x_i = C(i, :);
        x_j = C(j, :);
        sum = sum + minkoDist(x_i, x_j, p);
    end
end

result = 2/(len*(len-1))*sum;