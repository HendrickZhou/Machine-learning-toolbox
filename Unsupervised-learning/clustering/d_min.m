function result = d_min(C_i, C_j, p)
%
% C_i, C_j is matrix of this cluster that contains the data as a vector 
%
%

if nargin < 3
    p = 2;
end

dist = [];
for i = 1 : length(C_i)
    for j = 1 : length(C_j)
        x_i = C_i(i, :);
        x_j = C_j(j, :);
        dist = [dist, minkoDist(x_i, x_j, p)];
    end
end

result = min(dist);