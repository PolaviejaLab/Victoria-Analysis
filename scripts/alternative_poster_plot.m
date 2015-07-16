%
% This script makes an alternative plot for on the 2015 retreat poster
%

% Conditions:
%  1. Continuous limb, offset = 0cm
%  3. Continuous limb, offset = 10cm
%  4. Discontinuous limb, offset = 0cm
%
% Question groups (plots):
%  1-4. Ownership
%  7-10. Agency

[~, cube] = orderresponses();

conditions = [1 3 4 6];
ownership = nan(numel(conditions), size(cube, 3) * 4);
agency = nan(numel(conditions), size(cube, 3) * 4);

for i = 1:numel(conditions)
    ownership(i, :) = reshape(squeeze(cube(1:4, conditions(i), :)), 1, size(cube, 3) * 4);
    agency(i, :) = reshape(squeeze(cube(7:10, conditions(i), :)), 1, size(cube, 3) * 4);
end

clf; axes('ycolor', 'white','ytick',[]); hold on;
set(gcf, 'Color', 'white');
line([0 0], [0.6 4.50], 'LineStyle', '--', 'Color', 'k');
line([0 0], numel(conditions) + 1 + [0.6 4.50], 'LineStyle', '--', 'Color', 'k');

plot_diverging_stacked_bar( ...
    [ownership; agency], [1:4 6:9], ...
    struct('plot_vertical_line', 0));
xlim([-80 80]);

text(0, 0, 'Ownership', 'HorizontalAlignment', 'Center', 'FontSize', 14, 'FontWeight', 'Bold');
text(0, numel(conditions) + 1, 'Agency', 'HorizontalAlignment', 'Center', 'FontSize', 14, 'FontWeight', 'Bold');

text_x = -90;
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

