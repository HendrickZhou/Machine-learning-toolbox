function [usrData, usrLabel] = data_generator(nums, refData, type, maxType)
%DATA_GENERATOR generator the original training and test data for the clustring model
%@ Input1: nums of data to be generated
%@ Input2: reference data(vector) to generate the data set
%@ Output: return the generated usrData and labels
% nums is a inter
% refData is a row vector(a matrix that only contains one data)
% usrData is a nums * length(refData) matrix 
% usrLabel is a matrix which rows is nums and cols is the num of usr type (5)

axis = length(refData);
usrData = [];
for i = 1:axis
    delta = normrnd(0,1,nums,1);
    ref = ones(nums, 1)*refData(1,i);
    new = delta+ref;
    usrData = [usrData, new];
end
usrLabel = ones(nums, 1) * type;