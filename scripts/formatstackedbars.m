function [] = formatstackedbars (ownership, agency, conditions, ...
    x_lim, text_x)

axes('ycolor', 'white','ytick',[]); hold on;
set(gcf, 'Color', 'white');

rectangle ('position', [min(x_lim) 0.5 max(x_lim)-min(x_lim) conditions], ...
    'facecolor', [230 230 240]/256, 'linestyle', 'none');
rectangle ('position', [min(x_lim) 5.5 max(x_lim)-min(x_lim) conditions], ...
    'facecolor', [230 230 240]/256, 'linestyle', 'none');

line([0 0], [0.6 4.50], 'LineStyle', '--', 'Color', 'k');
line([0 0], conditions + 1 + [0.6 4.50], 'LineStyle', '--', 'Color', 'k');

plot_diverging_stacked_bar([ownership; agency], [1:4 6:9], ...
    struct('plot_vertical_line', 0));

text(0, 0, 'Ownership', 'HorizontalAlignment', 'Center', 'FontSize', ...
    22, 'FontWeight', 'Bold');
text(0, conditions + 1, 'Agency', 'HorizontalAlignment', 'Center', ...
    'FontSize', 22, 'FontWeight', 'Bold');


xlim (x_lim);
set(gca, 'XTick', min(x_lim):10:max(x_lim), 'FontSize', 17);
xlabel('Frequency', 'FontSize', 19, 'FontWeight', 'Bold');
ylabel('Condition');

for y = [0 conditions + 1]
    text(text_x, y + 0.85, 'Continuous limb', 'FontSize', 15, 'FontWeight', 'Bold');
    text(text_x, y + 1.19, 'No offset (0cm)', 'FontSize', 15, 'FontWeight', 'Bold');

    text(text_x, y + 1.85, 'Continuous limb', 'FontSize', 15, 'FontWeight', 'Bold');
    text(text_x, y + 2.19, 'Offset (10cm)', 'FontSize', 15, 'FontWeight', 'Bold');

    text(text_x, y + 2.85, 'Discontinuous limb', 'FontSize', 15, 'FontWeight', 'Bold');
    text(text_x, y + 3.19, 'Offset (0cm)', 'FontSize', 15, 'FontWeight', 'Bold');
    
    text(text_x, y + 3.85, 'Discontinuous limb', 'FontSize', 15, 'FontWeight', 'Bold');
    text(text_x, y + 4.19, 'Offset (10cm)', 'FontSize', 15, 'FontWeight', 'Bold');
end

shg; 
end 