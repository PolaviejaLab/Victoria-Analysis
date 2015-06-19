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

conditions = [1 3 4];
ownership = nan(numel(conditions), size(cube, 3) * 4);
agency = nan(numel(conditions), size(cube, 3) * 4);

for i = 1:numel(conditions)
    ownership(i, :) = reshape(squeeze(cube(1:4, conditions(i), :)), 1, size(cube, 3) * 4);
    agency(i, :) = reshape(squeeze(cube(7:10, conditions(i), :)), 1, size(cube, 3) * 4);
end

clf; axes('ycolor', 'white','ytick',[]); hold on;
set(gcf, 'Color', 'white');
line([0 0], [0.6 3.50], 'LineStyle', '--', 'Color', 'k');
line([0 0], [4.6 7.50], 'LineStyle', '--', 'Color', 'k');

plot_diverging_stacked_bar( ...
    [ownership; agency], [1:3 5:7], ...
    struct('plot_vertical_line', 0));
xlim([-40 40]);

text(0, 0, 'Ownership', 'HorizontalAlignment', 'Center', 'FontSize', 14, 'FontWeight', 'Bold');
text(0, 4, 'Agency', 'HorizontalAlignment', 'Center', 'FontSize', 14, 'FontWeight', 'Bold');

for y = [0 4]
    text(-50, y + 0.85, 'Continuous limb');
    text(-50, y + 1.15, 'No offset (0cm)');

    text(-50, y + 1.85, 'Continuous limb');
    text(-50, y + 2.15, 'Offset (10cm)');

    text(-50, y + 2.85, 'Discontinuous limb');
    text(-50, y + 3.15, 'Offset (0cm)');
end

xlabel('Frequency');
ylabel('Condition');

