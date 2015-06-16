function [ conditionMatrix ] = getconditionorder (protocolFile)
% GETCONDITIONORDER Matrix with the order of the condition
%   Generates a matrix resulting from transforming the conditions of the
%   each into a numerical id.

% import the .cvsfile with the conditions and create two different
% matrices with them. 
protocolFile = readtable (protocolFile, 'Delimiter',',');
GapStatus = protocolFile (2:7, 1);
Offset = protocolFile (2:7, 2);

% generate a new matrix with the numerical values of GapStatus. 
GapStatusNum = zeros(size(GapStatus,1),1);

for i = 1 : length(GapStatusNum)
    if strcmp(GapStatus{i,1}, 'Active')
        GapStatusNum(i) = 1;
    end
end

% generate a new matrix with numerical values of Offset
OffsetNum = zeros(size(GapStatus,1),1);

for i = 1 : length(OffsetNum)
    if Offset{i,1} == 0
        OffsetNum(i) = 1;
    elseif Offset{i,1} == 5
        OffsetNum(i) = 2;
    elseif Offset{i,1} == 10
        OffsetNum(i) = 3;
    end
end

% generate variables to later categorize by type of trial 
conditionMatrix = zeros(size(GapStatus,1),1);

for j = 1 : length(OffsetNum)
    conditionMatrix(j) = (OffsetNum(j) * GapStatusNum(j)) + (OffsetNum(j) + (2*GapStatusNum(j)));
end
end

