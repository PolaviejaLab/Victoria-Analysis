%% data from first pilots

% Run the analyzedata from the ar event and get cubeInverted

[~, cube] = orderresponses ();

cubeAr = cubeInverted;

%% Define variables

qOwnership = 1:4;
qOwnershipControl = 5:6;
qAgency = 7:9;
qAgencyControl = 10:12;
qLocation = 13:14;

conditions = [1 3 4 6];

qOwnershipAr = 1:2;
qAgencyAr = 3:4;

%% matrices with the results

owFirst = cubeFirst(qOwnership, conditions, :);
agFirst = cube(qAgency, conditions, :);

owAr = cubeAr(:, qOwnershipAr, :);
agAr = cubeAr(:, qAgencyAr, :);

%% real matrices 

ownership_nogap_nonoise = mean(squeeze(cube(qOwnership, 1, :)));
ownership_nogap_noise = mean(squeeze(cube(qOwnership, 3, :)));
ownership_gap_nonoise = mean(squeeze(cube(qOwnership, 4, :)));
ownership_gap_noise = mean(squeeze(cube(qOwnership, 6, :)));

agency_nogap_nonoise = mean(squeeze(cube(qAgency, 1, :)));
agency_nogap_noise = mean(squeeze(cube(qAgency, 3, :)));
agency_gap_nonoise = mean(squeeze(cube(qAgency, 4, :)));
agency_gap_noise = mean(squeeze(cube(qAgency, 6, :)));

%% better plot 

c = parula;
c  =  c([1 6 11 16 42 47 52 57], :);


edge = 1:1:7;
h1 = hist(ownership_nogap_nonoise, edge);
h2 = hist(ownership_nogap_noise, edge);
h3 = hist(ownership_gap_nonoise, edge);
h4 = hist(ownership_gap_noise,edge);


h5 = hist(agency_nogap_nonoise, edge);
h6 = hist(agency_nogap_noise, edge);
h7 = hist(agency_gap_nonoise, edge);
h8 = hist(agency_gap_noise, edge);

fig1 = figure(1);

subplot(1, 2, 1)
plot(edge, h1/19, 'color', c(8, :), 'LineWidth', 5); hold on,
plot(edge, h3/19, 'color', c(6, :), 'LineWidth', 5); 
plot(edge, h5/19, 'color', c(1, :), 'LineWidth', 5); 
plot(edge, h7/19+0.01, 'color', c(3, :), 'LineWidth', 5); 
hold off, 

xlim([0.5 7.5]);
ylim([-0.025 0.66]);
xlabel('questionnaire responses', 'FontSize', axis_fontsize, 'FontWeight', 'bold');
ylabel('probability density', 'FontSize', axis_fontsize, 'FontWeight', 'bold');
set(gca, 'FontSize', 12, 'FontWeight', 'bold');

title('interfering with ownership', 'FontSize', title_fontsize, 'FontWeight', 'bold');
line([mean(ownership_nogap_nonoise), mean(ownership_nogap_nonoise)], [-0.1 0.7], ...
    'LineStyle', '-', 'color', c(8, :));
line([mean(ownership_gap_nonoise), mean(ownership_gap_nonoise)], [-0.1 0.7], ...
    'LineStyle', '-', 'color', c(6, :));
line([mean(agency_nogap_nonoise), mean(agency_nogap_nonoise)], [-0.1 0.7], ...
    'LineStyle', '-', 'color', c(1, :));
line([mean(agency_gap_nonoise), mean(agency_gap_nonoise)], [-0.1 0.7], ...
    'LineStyle', '-', 'color', c(3, :));
line([0 8],[0 0], 'LineStyle', ':', 'color', [211/256 211/256 211/256]);

legend({'ownership - no gap', 'onwership - gap', 'agency - no gap', ...
    'agency - gap'}, 'location', 'northwest');

text(0.75, 0.4, strcat('p =', num2str(pvals_mean_ownership(2), '%.3f')), 'FontSize', 12, 'color', c(6,:));
text(0.75, 0.375, strcat('p =', num2str(pvals_mean_agency(2), '%.3f')), 'FontSize', 12, 'color', c(3,:));
 
subplot(1, 2, 2)


plot(edge, h1/19, 'color', c(8, :), 'LineWidth', 5); hold on, 
plot(edge, h2/19, 'color', c(6, :), 'LineWidth', 5);
plot(edge, h5/19, 'color', c(1, :), 'LineWidth', 5);
plot(edge, h6/19, 'color', c(3, :), 'LineWidth', 5);
hold off, 

title('interfering with agency', 'FontSize', title_fontsize, 'FontWeight', 'bold');
xlim([0.5 7.5]);
ylim([-0.025 0.65]);
xlabel('questionnaire responses', 'FontSize', axis_fontsize, 'FontWeight', 'bold');
ylabel('probability density', 'FontSize', axis_fontsize, 'FontWeight', 'bold');
set(gca, 'FontSize', 12, 'FontWeight', 'bold');

line([mean(ownership_nogap_nonoise), mean(ownership_nogap_nonoise)], [-0.1 0.7], ...
    'LineStyle', '-', 'color', c(8, :));
line([mean(ownership_nogap_noise), mean(ownership_nogap_noise)], [-0.1 0.7], ...
    'LineStyle', '-', 'color', c(6, :))
line([mean(agency_nogap_nonoise), mean(agency_nogap_nonoise)], [-0.1 0.7], ...
    'LineStyle', '-', 'color', c(1, :));
line([mean(agency_nogap_noise), mean(agency_nogap_noise)], [-0.1 0.7], ...
    'LineStyle', '-', 'color', c(3, :));
line([0 8],[0 0], 'LineStyle', ':', 'color', [211/256 211/256 211/256]);

legend({'ownership - no noise', 'onwership - noise', 'agency - no noise', ...
    'agency - noise'}, 'location', 'northwest');


text(0.75, 0.4, strcat('p =', num2str(pvals_mean_ownership(1), '%.3f')), 'FontSize', 12, 'color', c(6,:));
text(0.75, 0.375, strcat('p =', num2str(pvals_mean_agency(1), '%.3f')), 'FontSize', 12, 'color', c(3,:));


set(fig1,'units','normalized', 'Position', [0.1 0.1 0.75 0.55])


%% Plot the results

% fig1 = figure(1);
% subplot(1, 2, 1)
% 
% boxplot([local_nonoise_all', local_noise_all']);
% 
% text(2.1, 0.75, strcat('p-val= ', num2str(pval_local)), 'FontSize', 8);
% text(0.95, 0.25, 'No noise'); text(1.95, 0.25, 'Noise');
% line([0 3], [4 4], 'LineStyle', ':', 'Color', colorline);
% 
% title('Bodily agency', 'FontWeight', 'bold', 'FontSize', 11);
% ylim([0.5 7.5]);
% set(gca,'XTickLabel', {''; ''});
% xlabel('Conditions', 'FontWeight', 'bold', 'FontSize', 10);
% ylabel('Questionnaire responses', 'FontWeight', 'bold', 'FontSize', 10)
% 
% subplot(1, 2, 2)
% 
% boxplot([outcome_nonoise_all', outcome_noise_all']);
% 
% text(2.1, 0.75, strcat('p-val= ', num2str(pval_outcome)), 'FontSize', 8);
% text(0.95, 0.25, 'No noise'); text(1.95, 0.25, 'Noise');
% line([0 3], [4 4], 'LineStyle', ':', 'Color', colorline);
% 
% title('Outcome agency', 'FontWeight', 'bold', 'FontSize', 11);
% ylim([0.5 7.5]);
% set(gca,'XTickLabel', {''; ''});
% xlabel('Conditions', 'FontWeight', 'bold', 'FontSize', 10);
% ylabel('Questionnaire responses', 'FontWeight', 'bold', 'FontSize', 10)
% 
% 
% set(fig1,'units','normalized', 'Position', [0.1 0.1 0.75 0.55])


