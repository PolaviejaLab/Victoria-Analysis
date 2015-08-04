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

figure (1)
[cube, ~] = divide_by_gender (cubeMaster, gender);
conditions = [1 3 4 6];
ownership_male = nan(numel(conditions), size(cube, 3) * 4);
agency_male = nan(numel(conditions), size(cube, 3) * 4);

for i = 1:numel(conditions)
    ownership_male(i, :) = reshape(squeeze(cube(1:4, conditions(i), :)), 1, size(cube, 3) * 4);
    agency_male(i, :) = reshape(squeeze(cube(7:10, conditions(i), :)), 1, size(cube, 3) * 4);
end

mean_ownership_male = mean(ownership_male, 2);
mean_agency_male = mean(agency_male, 2);

 title ('Male');
 
clf; axes('ycolor', 'white','ytick',[]); hold on;
set(gcf, 'Color', 'white');
line([0 0], [0.6 4.50], 'LineStyle', '--', 'Color', 'k');
line([0 0], numel(conditions) + 1 + [0.6 4.50], 'LineStyle', '--', 'Color', 'k');

plot_diverging_stacked_bar( ...
    [ownership_male; agency_male], [1:4 6:9], ...
    struct('plot_vertical_line', 0));
xlim([-50 50]);

text(0, 0, 'Ownership', 'HorizontalAlignment', 'Center', 'FontSize', 14, 'FontWeight', 'Bold');
text(0, numel(conditions) + 1, 'Agency', 'HorizontalAlignment', 'Center', 'FontSize', 14, 'FontWeight', 'Bold');

text_x = -60;
for y = [0 numel(conditions) + 1]
    text(text_x, y + 0.85, 'Continuous limb');
    text(text_x, y + 1.15, 'No offset (0cm)');

    text(text_x, y + 1.85, 'Continuous limb');
    text(text_x, y + 2.15, 'Offset (10cm)');

    text(text_x, y + 2.85, 'Discontinuous limb');
    text(text_x, y + 3.15, 'Offset (0cm)');
    
    text(text_x, y + 3.85, 'Discontinuous limb');
    text(text_x, y + 4.15, 'Offset (10cm)');
end

xlabel('Frequency');
ylabel('Condition');
shg
 

figure(2)
[~, cube] = divide_by_gender (cubeMaster, gender);
conditions = [1 3 4 6];
ownership_female = nan(numel(conditions), size(cube, 3) * 4);
agency_female = nan(numel(conditions), size(cube, 3) * 4);



for i = 1:numel(conditions)
    ownership_female(i, :) = reshape(squeeze(cube(1:4, conditions(i), :)), 1, size(cube, 3) * 4);
    agency_female(i, :) = reshape(squeeze(cube(7:10, conditions(i), :)), 1, size(cube, 3) * 4);
end

mean_ownership_female = mean(ownership_female, 2);
mean_agency_female = mean(agency_female, 2);

clf; axes('ycolor', 'white','ytick',[]); hold on;
set(gcf, 'Color', 'white');
line([0 0], [0.6 4.50], 'LineStyle', '--', 'Color', 'k');
line([0 0], numel(conditions) + 1 + [0.6 4.50], 'LineStyle', '--', 'Color', 'k');

plot_diverging_stacked_bar( ...
    [ownership_female; agency_female], [1:4 6:9], ...
    struct('plot_vertical_line', 0));
xlim([-30 30]);

text(0, 0, 'Ownership', 'HorizontalAlignment', 'Center', 'FontSize', 14, 'FontWeight', 'Bold');
text(0, numel(conditions) + 1, 'Agency', 'HorizontalAlignment', 'Center', 'FontSize', 14, 'FontWeight', 'Bold');

text_x = -35;
for y = [0 numel(conditions) + 1]
    text(text_x, y + 0.85, 'Continuous limb');
    text(text_x, y + 1.15, 'No offset (0cm)');

    text(text_x, y + 1.85, 'Continuous limb');
    text(text_x, y + 2.15, 'Offset (10cm)');

    text(text_x, y + 2.85, 'Discontinuous limb');
    text(text_x, y + 3.15, 'Offset (0cm)');
    
    text(text_x, y + 3.85, 'Discontinuous limb');
    text(text_x, y + 4.15, 'Offset (10cm)');
end

xlabel('Frequency');
ylabel('Condition');
shg
