%
% This script makes an alternative plot for on the 2015 retreat poster
%

% Conditions:
%  1. Continuous limb, offset = 0cm
%  3. Continuous limb, offset = 10cm
%  4. Discontinuous limb, offset = 0cm
%  6. Discontinuous limb, offset = 10 cm 
%
% Question groups (plots):
%  1-4. Ownership
%  7-9. Agency

[~, cubeMaster] = orderresponses();

handedness = [0 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 1 1];
[right, left] = divide_by_condition (cubeMaster, handedness);
conditions = [1 3 4 6];


figure (1)
ownership_right = nan(numel(conditions), size(right, 3) * 4);
agency_right = nan(numel(conditions), size(right, 3) * 4);

for i = 1:numel(conditions)
    ownership_right(i, :) = reshape(squeeze(right(1:4, conditions(i), :)), 1, size(right, 3) * 4);
    agency_right(i, :) = reshape(squeeze(right(7:10, conditions(i), :)), 1, size(right, 3) * 4);
end

mean_ownership_male = mean(ownership_right, 2);
mean_agency_male = mean(agency_right, 2);
x_lim = [-50 60];
text_x = -65;

formatstackedbars(ownership_right, agency_right, numel(conditions), ...
    x_lim, text_x);
 

figure(2)
ownership_left = nan(numel(conditions), size(left, 3) * 4);
agency_left = nan(numel(conditions), size(left, 3) * 4);

for i = 1:numel(conditions)
    ownership_left(i, :) = reshape(squeeze(left(1:4, conditions(i), :)), 1, size(left, 3) * 4);
    agency_left(i, :) = reshape(squeeze(left(7:10, conditions(i), :)), 1, size(left, 3) * 4);
end

mean_ownership_female = mean(ownership_left, 2);
mean_agency_female = mean(agency_left, 2);
x_lim = [-30 30];
text_x = -40;

formatstackedbars(ownership_left, agency_left, numel(conditions), ...
    x_lim, text_x);