function [mdArray_ownership, mdArray_agency] = findmedians ()

[~, cube] = orderresponses();

conditions = [1 3 4 6];

mdArray_ownership = zeros(4,1);
mdArray_agency = zeros (4, 1);
stdvArray_ownership = zeros(4, 1);
stdvArray_agency = zeros (4, 1);

for i_condition = 1:length(conditions)
    ownership = reshape(squeeze(cube(1:4, i_condition, :)), [19*4, 1]);
    agency = reshape(squeeze(cube(7:9, i_condition, :)), [19*3, 1]);
    
    mdArray_ownership(i_condition) = median(ownership);
    mdArray_agency(i_condition) = median(agency);
    
    stdvArray_ownership(i_condition) = std(ownership);
    stdvArray_agency(i_condition) = std(agency);
end

end