function index = exIndex(refLabel, label, type)
%
%
%
%
%
% type:
%   1: JC index
%   2: FMI
%   3: RI

% judge if size(refLabel) == size(label)


% get the totel num of sample set
m = length(label);

% cal the params
[a, b, c, d] = calParam(m, refLabel, label);

% cal the index according to the type 
switch type
    case 1
        % Jaccard Coefficient
        index = a/(a+b+c);
    case 2
        % Fowlkes and Mallows Index
        index = sqrt(a/(a+b)*a/(a+c));
    case 3
        % Rand Index
        index = 2*(a+d)/(m*(m-1));
end

end

function [a, b, c, d] = calParam(m, refLabel, label)
a = 0, b = a, c = b, d = c;
for i = 1 : m
    for j = i+1 : m
        lambda_i = label(i);
        lambda_j = label(j);
        lambda_i_star = refLabel(i);
        lambda_j_star = refLabel(j);
        if lambda_i == lambda_j
            if lambda_i_star == lambda_j_star
                a = a + 1;
            else
                b = b + 1;
            end
        else
            if lambda_i_star == lambda_j_star
                c = c + 1;
            else
                d = d + 1;
            end
        end     
    end
end

end