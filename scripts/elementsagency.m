%% Get the data - from the first set of data
[~, cube] = orderresponses();

% Define the questions
qLocalAgency = 7:8;
qOutcomeAgency = 9;

% Select conditions
vecConditions = [1 3 4 6];

% cubes for local and outcome agency NxM, where N are the conditions, and
% M are the subjects. Means are calculated for the elements that have more
% than one questions addressing it.
matLocalAgency = squeeze(mean(cube(qLocalAgency, vecConditions, :)));
matOutcomeAgency = squeeze(cube(qOutcomeAgency, vecConditions, :));


%% Analyses of the means reported answers

meanLocalAgency = mean(matLocalAgency, 2);
meanOutcomeAgency = mean(matOutcomeAgency, 2);

% medianLocalAgency = median(matLocalAgency, 2);
% medianOutcomeAgency = median(matOutcomeAgency, 2);

%% Statistics - bootstrapping

ii = 10000;
% Comparing continuous hand with and without offset (noise added due to
% tracking mistakes, that will be used as a modification on the local
% agency).

diffMeansContinuousLocalAgency = meanLocalAgency(1) - meanLocalAgency(2);
diffMeansContinuousOutcomeAgency = meanOutcomeAgency(1) - meanOutcomeAgency(2);

vecContinuousLocalAgency = [matLocalAgency(1, :) matLocalAgency(2, :)];
vecCompareLocalAgency = repmat(diffMeansContinuousLocalAgency, 1, ii);
resLocalAgency = zeros(1, ii);

vecContinousOutcomeAgency = [matOutcomeAgency(1, :) matOutcomeAgency(2, :)];
vecCompareOutomeAgency = repmat(diffMeansContinuousOutcomeAgency, 1, ii);
resOutcomeAgency = zeros(1, ii);

for i = 1:ii
    ind_LocalAgency = randperm(length(vecContinuousLocalAgency));
    ind_OutcomeAgency = randperm(length(vecContinousOutcomeAgency));
    
    permVecLocalAgency = vecContinuousLocalAgency(ind_LocalAgency);
    permVecOutcomeAgency = vecContinousOutcomeAgency(ind_OutcomeAgency);
    
    resLocalAgency(i) = abs(mean(permVecLocalAgency(1:19)) - ...
        mean(permVecLocalAgency(20:38)));
    resOutcomeAgency(i) = abs(mean(permVecOutcomeAgency(1:19)) - ...
        mean(permVecOutcomeAgency(20:38)));    
end

pvalsLocalAgency = sum(resLocalAgency >= vecCompareLocalAgency, 2)/ii;
pvalsOutcomeAgency = sum(resOutcomeAgency >= vecCompareOutomeAgency, 2)/ii;


%% Without considering subject 5 (outlier?)

% matLocalAgency2 = matLocalAgency;

% matLocalAgency2 = matLocalAgency2(:, [1:4 6:19]); 
% interesante metodo de angel que mejora
% cualitativamente el resultado mi analisis y mi vida! yeah!


%% Plot questions
matPlotLocalAgency = [matLocalAgency(1, :); matLocalAgency(2, :)];
matPlotOutcomeAgency = [matOutcomeAgency(1, :); matOutcomeAgency(2, :)];

deflightgrey = [211/256 211/256 211/256];
defthistle	= [216/256 191/256 216/256];
defblanchedalmond = [255/256 235/256 205/256];	

colorline = defthistle;

fig1 = figure(1);
subplot(1, 2, 1)

boxplot(matPlotLocalAgency');

text(2.1, 0.75, strcat('p-val= ', num2str(pvalsLocalAgency)), 'FontSize', 8);
text(0.95, 0.25, 'No noise'); text(1.95, 0.25, 'Noise');
line([0 3], [4 4], 'LineStyle', ':', 'Color', colorline);

title('Bodily agency in continuous limb', 'FontWeight', 'bold', 'FontSize', 11);
ylim([0.5 7.5]);
set(gca,'XTickLabel', {''; ''});
xlabel('Conditions', 'FontWeight', 'bold', 'FontSize', 10);
ylabel('Questionnaire responses', 'FontWeight', 'bold', 'FontSize', 10);

% text(0, 0, 'Question: During the experiment there were moments that I felt I could control the virtual hand');
% text(0, -0.25, 'Question: During the experiment there were moments that I felt that the movements of the virtual hand were caused by me');


subplot(1, 2, 2)

boxplot(matPlotOutcomeAgency');

text(2.1, 0.75, strcat('p-val= ', num2str(pvalsOutcomeAgency)), 'FontSize', 8);
text(0.95, 0.25, 'No noise'); text(1.95, 0.25, 'Noise');
line([0 3], [4 4], 'LineStyle', ':', 'Color', colorline);

title('Outcome agency in continuous limb', 'FontWeight', 'bold', 'FontSize', 11);
ylim([0.5 7.5]);
set(gca,'XTickLabel', {''; ''});
ylabel('Questionnaire responses', 'FontWeight', 'bold', 'FontSize', 10);
xlabel('Conditions', 'FontWeight', 'bold', 'FontSize', 10);

% text(0, 0, 'Question: During the experiment there were moments that I felt that the movement of my hand was turning off the lights on the table.');

set(fig1,'units','normalized', 'Position', [0.1 0.1 0.75 0.55])


%%
figure(2),
scatter(1*ones(1, length(matLocalAgency(1, :))), matLocalAgency(1, :)); hold on,
scatter(2*ones(1, length(matLocalAgency(2, :))), matLocalAgency(2, :));
xlim([0.5 2.5]);

figure(3), % to get the idea, but needs improvement
subplot(1, 2, 1)
for i = 1:19
    scatter(i*ones(1, length(matLocalAgency(1, i))), matLocalAgency(1, i)); hold on
    scatter(i*ones(1, length(matLocalAgency(2, i))), matLocalAgency(2, i), '*'); hold on
end
xlim([0.5 19.5]);
ylim([0.5 7.5]);
set(gca, 'XTick', 1:1:19);


subplot(1, 2, 2)
for i = 1:19
    scatter(i*ones(1, length(matOutcomeAgency(1, i))), matOutcomeAgency(1, i)); hold on
    scatter(i*ones(1, length(matOutcomeAgency(2, i))), matOutcomeAgency(2, i), '*'); hold on
end
xlim([0.5 19.5]);
ylim([0.5 7.5]);
set(gca, 'XTick', 1:1:19);

figure(4),
for i = 1:19
    scatter(i*ones(1, length(matLocalAgency(1:2, i))), ...
        matLocalAgency(1:2, i)); hold on
    scatter(i*ones(1, length(matOutcomeAgency(1:2, i))), ...
        matOutcomeAgency(1:2, i), '*'); hold on
end
xlim([0.5 19.5]);
ylim([0.5 7.5]);
legend({'LocalAgency' 'OutcomeAgency'});
set(gca, 'XTick', 1:1:19);


% figure(5),
% scatter([1:19; 1:19].*ones(2, length(matLocalAgency(1:2, :))), ...
%     matLocalAgency(1:2, :)); hold on
% scatter([1:19; 1:19].*ones(2, length(matOutcomeAgency(1:2, :))), ...
%     matOutcomeAgency(1:2, :), '*'); hold on


%% Paired plot outcome/local agency, by colors
figure(6),

c = jet(19);
for i = 1:19
    plot([1 2], [matLocalAgency(1, i) matLocalAgency(2, i)], '--o', ...
        'color', c(i,:)); hold on,
    plot([1.1 2.1], [matOutcomeAgency(1, i) matLocalAgency(2, i)], ...
        '-*', 'color', c(i,:)); hold on,
end

xlim([0.5 2.5]);
ylim([0.5 7.5]);
set(gca, 'XTick', 1:1:2);


%% Plot - correlation?

plocal = polyfit(matLocalAgency(1, :), matLocalAgency(2, :), 1);
ylocal = plocal(1)*matLocalAgency(1, :) + plocal(2);

poutcome = polyfit(matOutcomeAgency(1,:), matOutcomeAgency(2, :), 1);
youtcome = poutcome(1)*matOutcomeAgency(1, :) + poutcome(2);

values = 0:1:10;
yvaluesl = values(1, :)*plocal(1) + plocal(2);
yvalueso = values(1, :)*poutcome(1) + poutcome(2);


fig7 = figure(7);
plot(matLocalAgency(1, :) + ...
    (0.015:0.015:0.015*(length(matLocalAgency(1, :)))), ...
    matLocalAgency(2, :) + ...
    (0.015:0.015:0.015*(length(matLocalAgency(1, :)))), ...
    'or', 'MarkerSize', 10); hold on, 
plot(matOutcomeAgency(1, :) + ...
    (0.015:0.015:0.015*(length(matLocalAgency(1, :)))), ...
    matOutcomeAgency(2, :) + ...
    (0.015:0.015:0.015*(length(matLocalAgency(1, :)))), ...
    'ob', 'MarkerSize', 7); hold on, 
plot(matLocalAgency(1, :), ylocal, ':r'); hold on, 
plot(matOutcomeAgency(1, :), youtcome, ':b');
plot(values, yvaluesl, ':r');
plot(values, yvalueso, ':b');
formatcorrelations('', 'No noise', 'Noise');
legend({'Local Agency', 'Outcome Agency'}, 'Location', 'northwest');

set(fig7,'units','normalized', 'Position', [0.1 0.1 0.5 0.7])


