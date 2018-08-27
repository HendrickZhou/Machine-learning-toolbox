function result = d_cen(C_i, C_j, p)
%
% C_i, C_j is matrix of this cluster that contains the data as a vector 
%

if nargin < 3
    p = 2;
end

mu_i = clusterCenter(C_i);
mu_j = clusterCenter(C_j);

result = minkoDist(mu_i, mu_j, p);