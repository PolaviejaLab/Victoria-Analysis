%% data 

data_cube = mReactions;

%% set the variables

nonoise_nooffset = 1;
noise_nooffset = 2;
nonoise_offset = 3;

%% Vectors to plot

vec_nonoise_nooffset = data_cube(nonoise_nooffset, :);
vec_noise_nooffset = data_cube(noise_nooffset, :);
vec_nonoise_offset = data_cube(nonoise_offset, :);

%% bar graph

cc = parula;
cc = cc([15 37 60], :);

value0_nonoise_nooffset = sum(vec_nonoise_nooffset == 0)/19;
value1_nonoise_nooffset = sum(vec_nonoise_nooffset == 1)/19;
value2_nonoise_nooffset = sum(vec_nonoise_nooffset == 2)/19;

value0_noise_nooffset = sum(vec_noise_nooffset == 0)/19;
value1_noise_nooffset = sum(vec_noise_nooffset == 1)/19;
value2_noise_nooffset = sum(vec_noise_nooffset == 2)/19;

value0_nonoise_offset = sum(vec_nonoise_offset == 0)/19;
value1_nonoise_offset = sum(vec_nonoise_offset == 1)/19;
value2_nonoise_offset = sum(vec_nonoise_offset == 2)/19;

vec_bargraph = [...
    value0_nonoise_nooffset, value2_nonoise_nooffset, value1_nonoise_nooffset;
    value0_noise_nooffset, value2_noise_nooffset, value1_noise_nooffset;
    value0_nonoise_offset, value2_nonoise_offset, value1_nonoise_offset];

fig1 = figure(1);

b = bar(vec_bargraph, 0.4, 'stacked');

set(b(1), 'FaceColor', cc(1, :));
set(b(3), 'FaceColor', cc(3, :));
set(b(2), 'FaceColor', cc(2, :));

title('Reaction to the threat', 'FontSize', title_fontsize, 'FontWeight', 'bold');

legend({'no reaction' 'no data' 'reacted'}, 'location', 'northeastoutside', 'FontSize', 11);
set(gca, 'XTickLabel', {'', '', ''});
text(0.25, -0.065, 'noise', 'FontWeight', 'bold', 'FontSize', 10);
text(1, -0.065, '–');
text(2, -0.065, '+');
text(3, -0.065, '–');
text(0.25, -0.115, 'threat offset', 'FontWeight', 'bold', 'FontSize', 10);
text(1, -0.115, '–');
text(2, -0.115, '–');
text(3, -0.115, '+');
ylabel('proportion', 'FontSize', axis_fontsize, 'FontWeight', 'bold');

set(fig1,'units','normalized', 'Position', [0.2 0.2 0.5 0.55])