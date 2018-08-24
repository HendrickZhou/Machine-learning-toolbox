function Mu = clusterCenter(C)
% calculate the center point of one cluster
% @Input: a matrix that contains a data vec every row
% @Output: the center point vec of the cluster

% Exception handle
len = size(C, 1);
Mu = sum(C,1)/len;