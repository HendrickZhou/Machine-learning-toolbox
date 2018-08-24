function C_set = modelTrain(D, n)
% this function receive the data, do the clustring, and return the
% clustring result as a cell array
% @Input1: D is the matrix that contains all the samples as row vec
% @Input2: n is the num of cluster client needs
% @Outputs: C_set is the cell array of clustering result. Each cell is the
% matrix t

% Select the init MU
% MU = {mu_1; mu_2; ... mu_k; ...mu_n}
len = size(D, 1);
a = unidrnd(len, n);
MU = [];
for k = 1 : n
    MU = [MU; D(a(k),:)];
end

% start the clustering work
% C_set = {C_1, C_2, ... C_i, ...C_n}
iterations = 0;
while 1
    C_set = cell(1, n);
    %% cluster the data based on updated MU
    % D = {x_1; x_2; ... x_i; ...x_len}
    for i = 1 : len
        x_i = D(i,:);
        minDist = minkoDist(x_i, MU(1,:), 2);
        minIndex = 1;
        for j = 2 : n
            mu_j = MU(j,:);
            temp = minkoDist(x_i, mu_j, 2);
            if temp < minDist
                minDist = temp;
                minIndex = j;
            end
        end
        % put x_i on C_minIndex cluster
        c = C_set{minIndex};
        c = [c;x_i];
        C_set{minIndex} = c;
    end
    
    %% update the new MU
    lastMU = MU;
    for i = 1 : n
        mu_i = clusterCenter(C_set{i});
        MU(i,:) = mu_i;
    end
      
    %% judge the clustering result
    threshold = 0.02;
    maxIterations = 100000;
    delta = MU - lastMU;
    if sum(sum(delta > threshold)) == 0
        break
    end
    
    if iterations > maxIterations
        break
    end
    iterations = iterations + 1
end
        
        
        
        
        
        
        
        
    