function result = diam(C, p)
%
% C is the matrix of a cluster
%

if nargin < 2
    p = 2;
end

len = length(C);

dist = [];
for i = 1 : len
    for j = i + 1 : len
        x_i = C(i, :);
        x_j = C(j, :);
        dist = [dist, minkoDist(x_i, x_j, p)];
    end
end

result = max(dist);