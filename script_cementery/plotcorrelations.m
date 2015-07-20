%% ownership no offset/ownership offset

function [] = plotcorrelations (vector1, vector2)

scatter (vector1, vector2);
line([9 0], [9 0], 'color', [0.827451 0.827451 0.827451]);

xlim([0.5, 7.5]);
set(gca, 'XTick', 1:7);
ylim([0.5, 7.5]);
set(gca, 'YTick', 1:7);

end