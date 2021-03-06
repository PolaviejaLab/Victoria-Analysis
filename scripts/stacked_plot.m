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

[~, cube] = orderresponses();



figure,
conditions = [1 3 4 6];
ownership = nan(numel(conditions), size(cube, 3) * 4);
agency = nan(numel(conditions), size(cube, 3) * 4);

for i = 1:numel(conditions)
    ownership(i, :) = reshape(squeeze(cube(1:4, conditions(i), :)), ...
        1, size(cube, 3) * 4);
    agency(i, :) = reshape(squeeze(cube(7:10, conditions(i), :)), ...
        1, size(cube, 3) * 4);
end


x_lim = [-60 80];

    
%     C = [1.0 0.0 0.0;
%          1.0 0.3 0.3;
%          1.0 0.6 0.6;
%          0.6 0.6 0.6;
%          0.6 0.6 1.0;
%          0.3 0.3 1.0;
%          0.0 0.0 1.0];


formatstackedbars (ownership, agency, numel(conditions), x_lim, -80);


fig3 = figure(3);
   set(fig3,'units','normalized', 'Position', [0.1 0.1 0.6 0.8])