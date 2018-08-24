function dist = minkoDist(x1, x2, p)
% This function calculate the minkowski distance of two vector
% @Inputs: two vector(row vec and col vec both works) & the p of minkowski
% distance
% @Outputs: value of distance

% Exception handle

len = length(x1);

% Regulate the input vector as a row vector
reshape(x1, [1, len]);
reshape(x2, [1, len]);

sigmod = 0;
for i = 1:len
    delta = abs(x1(1,i) - x2(1,i));
    sigmod = sigmod + delta.^p;
end

dist = sigmod.^(1/p);

