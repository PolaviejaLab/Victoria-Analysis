function [own_mnArray, owcont_mnArray, agn_mnArray] = ...
    findmeans ()

[~, cube] = orderresponses();

ow_questions = 1:4;
owcnt_questions = 5:6;
ag_questions = 7:9;

conditions = [1 3 4 6];

own_mnArray = zeros(4, 1);
owcont_mnArray = zeros(4, 1);
agn_mnArray = zeros (4, 1);

ow_stdvArray = zeros(4, 1);
owcnt_stdvArray = zeros(4, 1); 
agn_stdvArray = zeros (4, 1);

for i_condition = 1:length(conditions)
    ownership = reshape(squeeze(cube(ow_questions, ...
        conditions(i_condition), :)), [19*4, 1]);
    owControl = reshape(squeeze(cube(owcnt_questions, ...
        conditions(i_condition), :)), [19*2, 1]);
    agency = reshape(squeeze(cube(ag_questions, ...
        conditions(i_condition), :)), [19*3, 1]);
    
    
    own_mnArray(i_condition) = mean(ownership);
    owcont_mnArray(i_condition) = mean(owControl);
    agn_mnArray(i_condition) = mean(agency);
    
    ow_stdvArray(i_condition) = std(ownership);
    owcnt_stdvArray(i_condition) = std(owControl);
    agn_stdvArray(i_condition) = std(agency);
end
end