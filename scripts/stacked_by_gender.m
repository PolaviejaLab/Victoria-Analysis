%
% This script makes an stacked plots for ownership and agency, dividing by
% male and female
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

gender = [0 0 0 0 0 0 0 1 0 1 0 1 1 0 0 0 1 1 0];
conditions = [1 3 4 6];

[male, female] = divide_by_condition (cubeMaster, gender);

figure (1)
ownership_male = nan(numel(conditions), size(male, 3) * 4);
agency_male = nan(numel(conditions), size(male, 3) * 4);

for i = 1:numel(conditions)
    ownership_male(i, :) = reshape(squeeze(male(1:4, conditions(i), :)), ...
        1, size(male, 3) * 4);
    agency_male(i, :) = reshape(squeeze(male(7:10, conditions(i), :)), ...
        1, size(male, 3) * 4);
end

mean_ownership_male = mean(ownership_male, 2);
mean_agency_male = mean(agency_male, 2);
x_lim = [-50 50];
text_x = -65;

formatstackedbars(ownership_male, agency_male, numel(conditions), ...
    x_lim, text_x)


figure(2)
ownership_female = nan(numel(conditions), size(female, 3) * 4);
agency_female = nan(numel(conditions), size(female, 3) * 4);

for i = 1:numel(conditions)
    ownership_female(i, :) = reshape(squeeze(female(1:4, ...
        conditions(i), :)), 1, size(female, 3) * 4);
    agency_female(i, :) = reshape(squeeze(female(7:10, ...
        conditions(i), :)), 1, size(female, 3) * 4);
end

mean_ownership_female = mean(ownership_female, 2);
mean_agency_female = mean(agency_female, 2);
x_lim = [-30 30];
text_x = -40;

formatstackedbars(ownership_female, agency_female, numel(conditions), ...
    x_lim, text_x)