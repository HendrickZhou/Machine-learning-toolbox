function index = intIndex(C, type, p)
%
%
%
%
%
%

if nargin < 3
    p = 2;
end

numCluster = length(C);
switch type
    case 1
        % Davis-Bouldin Index
        max_R = 0;
        for i = 1 : numCluster
            temp = [];
            for j = 1 : numCluster
                if i == j
                    continue
                end
                C_i = C{i};
                C_j = C{j};
                R_i_j = (avg(C_i) + avg(C_j))/d_cen(C_i, C_j);
                temp = [temp, R_i_j];
            end
            max_i = max(temp);
            max_R = max_R + max_i;
        end
        index = max_R/numCluster;
        
    case 2
        % Dunn Index
        min_out = [];
        for i = 1 : numCluster
            min_in_array = [];
            for j = 1 : numCluster
                if i == j
                    continue
                end
                
                C_i = C{i};
                C_j = C{j};
                
                max_in_array = [];
                for l = 1 : numCluster
                    max_in_array = [max_in_array, diam(C{l})];
                end
                max_in = max(max_in_array);
                
                x = d_min(C_i, C_j)/max_in;
                min_in_array = [min_in_array, x];
            end
            min_in = min(min_in_array);
            
            min_out = [min_out, min_in];
        end
        index = min(min_out);
end
        


