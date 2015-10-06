function [mnArray_ownership, mnArray_agency] = findmeans ()

[~, cube] = orderresponses();

conditions = [1 3 4 6];

mnArray_ownership = zeros(4,1);
mnArray_agency = zeros (4, 1);
stdvArray_ownership = zeros(4, 1);
stdvArray_agency = zeros (4, 1);

for i_condition = 1:length(conditions)
    ownership = reshape(squeeze(cube(1:4, i_condition, :)), [19*4, 1]);
    agency = reshape(squeeze(cube(7:9, i_condition, :)), [19*3, 1]);
    
    mnArray_ownership(i_condition) = mean(ownership);
    mnArray_agency(i_condition) = mean(agency);
    
    stdvArray_ownership(i_condition) = std(ownership);
    stdvArray_agency(i_condition) = std(agency);
end

end