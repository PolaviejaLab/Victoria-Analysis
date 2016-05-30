% ANALZELEMAGENCY takes the results from the datasets that included noise
% and analyzes the differences between noise and no-noise conditions. 


%% Formatting variables
axis_fontsize = 15;
tick_fontsize = 13;
title_fontsize = 17;

%% Getting the data

% Run first the scripts elementsagency.m tand analyzedata.m to get the
% proper data sets. 
% From the first one: matLocalAgency and matOutcomeAgency,  and from the
% second one: agNoNoiseLocal, agNoiseLocal, agNoNoiseOutcome, and
% agNoiseOutcome

local_nonoise_exp1 = matLocalAgency (1, :);
local_noise_exp1 = matLocalAgency (2, :);

outcome_nonoise_exp1 = matOutcomeAgency (1, :);
outcome_noise_exp1 = matOutcomeAgency (2, :);


local_nonoise_exp2 = agNoNoiseLocal;
local_noise_exp2 = agNoiseLocal;

outcome_nonoise_exp2 = agNoNoiseOutcome;
outcome_noise_exp2 = agNoiseOutcome;

%% make common matrices for all the conditions

local_nonoise_all = [local_nonoise_exp1, local_nonoise_exp2];
local_noise_all = [local_noise_exp1, local_noise_exp2];

outcome_nonoise_all = [outcome_nonoise_exp1, outcome_nonoise_exp2];
outcome_noise_all = [outcome_noise_exp1, outcome_noise_exp2];

%% Bootstrapping

it = 100000;
nComp = size(local_nonoise_all, 1);
% Comparing continuous hand with and without offset (noise added due to
% tracking mistakes, that will be used as a modification on the local
% agency).

diff_means_local = abs(mean(local_nonoise_all) - mean(local_noise_all));
diff_means_outcome = abs(mean(outcome_nonoise_all) - mean(outcome_noise_all));

valuesvec_local = [local_nonoise_all, local_noise_all];
compvec_local = repmat(diff_means_local, nComp, it);
resvec_local = zeros(nComp, it);

valuesvec_outcome = [outcome_nonoise_all, outcome_noise_all];
compvec_outcome = repmat(diff_means_outcome, nComp, it);
resvec_outcome = zeros(nComp, it);

% removed the abs(), to see that it decreases

for i = 1:it
    i_local = randperm(length(valuesvec_local));
    i_outcome = randperm(length(valuesvec_outcome));
    
    permvec_local = valuesvec_local(i_local);
    permvec_outcome = valuesvec_outcome(i_outcome);
    
    resvec_local(i) = mean(permvec_local(1:19)) - ...
        mean(permvec_local(20:38));
    resvec_outcome(i) = mean(permvec_outcome(1:19)) -  ...
        mean(permvec_outcome(20:38));
end

pval_local = sum(resvec_local > compvec_local, 2)/it;
pval_outcome = sum(resvec_outcome > compvec_outcome, 2)/it;


%% Plot the results

fig1 = figure(1);
subplot(1, 2, 1)

boxplot([local_nonoise_all', local_noise_all']);

text(2.1, 0.75, strcat('p-val= ', num2str(pval_local)), 'FontSize', 8);
text(0.95, 0.25, 'No noise'); text(1.95, 0.25, 'Noise');
line([0 3], [4 4], 'LineStyle', ':', 'Color', colorline);

title('Bodily agency', 'FontWeight', 'bold', 'FontSize', 11);
ylim([0.5 7.5]);
set(gca,'XTickLabel', {''; ''});
xlabel('Conditions', 'FontWeight', 'bold', 'FontSize', 10);
ylabel('Questionnaire responses', 'FontWeight', 'bold', 'FontSize', 10)

subplot(1, 2, 2)

boxplot([outcome_nonoise_all', outcome_noise_all']);

text(2.1, 0.75, strcat('p-val= ', num2str(pval_outcome)), 'FontSize', 8);
text(0.95, 0.25, 'No noise'); text(1.95, 0.25, 'Noise');
line([0 3], [4 4], 'LineStyle', ':', 'Color', colorline);

title('Outcome agency', 'FontWeight', 'bold', 'FontSize', 11);
ylim([0.5 7.5]);
set(gca,'XTickLabel', {''; ''});
xlabel('Conditions', 'FontWeight', 'bold', 'FontSize', 10);
ylabel('Questionnaire responses', 'FontWeight', 'bold', 'FontSize', 10)


set(fig1,'units','normalized', 'Position', [0.1 0.1 0.75 0.55])


%% better plot 

c = parula;
c  =  c([9 18 50 60], :);

edge = 1:1:7;
h1 = hist(local_nonoise_all, edge);
h2 = hist(local_noise_all, edge);
h3 = hist(outcome_nonoise_all, edge);
h4 = hist(outcome_noise_all,edge);


fig2 = figure(2);
plot(edge, h1/38, 'color', c(1, :), 'LineWidth', 5); hold on,
plot(edge, h2/38, 'color', c(2, :), 'LineWidth', 5, 'LineStyle', ':'); 
plot(edge, h3/38, 'color', c(4, :), 'LineWidth', 5); 
plot(edge, h4/38, 'color', c(3, :), 'LineWidth', 5, 'LineStyle', ':');
hold off,

xlim([0.5 7.5]);
ylim([-0.025 0.55]);

line([0 8],[0 0], 'LineStyle', ':', 'color', [211/256 211/256 211/256])


fig3 = figure(3);

subplot(1, 2, 1)
plot(edge, h1/38, 'color', c(1, :), 'LineWidth', 5); hold on,
plot(edge, h2/38, 'color', c(2, :), 'LineWidth', 5, 'LineStyle', ':'); hold off, 

xlim([0.5 7.5]);
ylim([-0.025 0.55]);
xlabel('questionnaire responses', 'FontSize', axis_fontsize, 'FontWeight', 'bold');
ylabel('probability density', 'FontSize', axis_fontsize, 'FontWeight', 'bold');
set(gca, 'FontSize', 12, 'FontWeight', 'bold');

title('agency over movement', 'FontSize', title_fontsize, 'FontWeight', 'bold');
line([mean(local_nonoise_all), mean(local_nonoise_all)], [-0.1 0.6], ...
    'LineStyle', '-', 'color', c(1, :));
line([mean(local_noise_all), mean(local_noise_all)], [-0.1 0.6], ...
    'LineStyle', '--', 'color', c(2, :));
line([0 8],[0 0], 'LineStyle', ':', 'color', [211/256 211/256 211/256]);

legend({'without noise', 'with noise', 'mean without noise',...
    'mean with noise'}, 'location', 'northwest');

text(0.75, 0.4, strcat('p-val =', num2str(pval_local, '%.3f')), 'FontSize', 12);


subplot(1, 2, 2)
plot(edge, h3/38, 'color', c(4, :), 'LineWidth', 5); hold on, 
plot(edge, h4/38, 'color', c(3, :), 'LineWidth', 5, 'LineStyle', ':'); hold off, 

title('agency over outcome', 'FontSize', title_fontsize, 'FontWeight', 'bold');
xlim([0.5 7.5]);
ylim([-0.025 0.55]);
xlabel('questionnaire responses', 'FontSize', axis_fontsize, 'FontWeight', 'bold');
ylabel('probability density', 'FontSize', axis_fontsize, 'FontWeight', 'bold');
set(gca, 'FontSize', 12, 'FontWeight', 'bold');

line([mean(outcome_nonoise_all), mean(outcome_nonoise_all)], [-0.1 0.6], ...
    'LineStyle', '-', 'color', c(4, :));
line([mean(outcome_noise_all), mean(outcome_noise_all)], [-0.1 0.6], ...
    'LineStyle', '--', 'color', c(3, :));
line([0 8],[0 0], 'LineStyle', ':', 'color', [211/256 211/256 211/256]);

legend({'without noise', 'with noise', 'mean without noise',...
    'mean with noise'}, 'location', 'northwest');

text(0.75, 0.4, strcat('p-val =', num2str(pval_outcome, '%.3f')), 'FontSize', 12);


set(fig3,'units','normalized', 'Position', [0.1 0.1 0.75 0.55])


% fig4 = figure(4);
% 
% [f1, xi1] = ksdensity(local_nonoise_all);
% [f2, xi2] = ksdensity(local_noise_all);
% 
% plot(xi1, f1); hold on, 
% plot (xi2, f2); hold off

%% Correlations - questions

fig5 = figure(5);
subplot(1, 2, 1)
plot(local_nonoise_all, outcome_nonoise_all, 'og');
xlim([0.5 7.5]);
ylim([0.5 7.5]);

subplot(1, 2, 2)
plot(local_noise_all, outcome_noise_all, 'or');
xlim([0.5 7.5]);
ylim([0.5 7.5]);


% corrcoef para ver la correlacion entre las preguntas para ver si son
% diferents. 

% sacar un test de significancia 