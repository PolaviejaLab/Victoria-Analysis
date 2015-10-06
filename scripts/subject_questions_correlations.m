[~, cube] = orderresponses ();

% define questions of ownership and agency
owQuestions = 1:4;
agQuestions = 7:9;

% cubes for ownership and agency
owCube = cube(owQuestions, :, :);
agCube = cube(agQuestions, :, :);

mn_owQuestions = squeeze(mean(owCube, 1))';
mn_agQuestions = squeeze(mean(agCube, 1))';


%% Correlations Coefficients
[owQuestions_coef, owQuestions_pval] = corrcoef(mn_owQuestions);
[agQuestions_coef, agQuestions_pval] = corrcoef(mn_agQuestions);


%% ownership, continuous conditions

fig = figure;
plot(mn_owQuestions(:,1), mn_owQuestions(:,2),'o'); hold on; 
plot(mn_owQuestions(:,2), mn_owQuestions(:,3),'or'); hold on; 
plot(mn_owQuestions(:,1), mn_owQuestions(:,3),'og');
legend('C0-C5', 'C5-C10', 'C0-C10');
formatcorrelations();
set(fig,'units','normalized', 'Position', [0.1 0.1 0.5 0.7])


fig = figure; 
subplot (1, 3, 1);
plot(mn_owQuestions(:,1),mn_owQuestions(:,2),'ob');
legend('C0-C5');
formatcorrelations();

subplot(1, 3, 2);
plot(mn_owQuestions(:,2), mn_owQuestions(:,3),'or');
legend('C5-C10');
formatcorrelations();

subplot(1, 3, 3);
plot(mn_owQuestions(:,1), mn_owQuestions(:,3),'og');
legend('C0-C10');
formatcorrelations();
set(fig,'units','normalized', 'Position', [0.1 0.1 0.9 0.45])

%% ownership, discontinuous conditions
    
fig = figure;
plot(mn_owQuestions(:,4), mn_owQuestions(:,5),'o'); hold on; 
plot(mn_owQuestions(:,5), mn_owQuestions(:,6),'or'); hold on; 
plot(mn_owQuestions(:,4), mn_owQuestions(:,6),'og');
legend('D0-D5', 'D5-D10', 'D0-D10');
formatcorrelations();
set(fig,'units','normalized', 'Position', [0.1 0.1 0.5 0.7])


fig = figure; 
subplot (1, 3, 1);
plot(mn_owQuestions(:,4),mn_owQuestions(:,5),'ob');
legend('D0-D5');
formatcorrelations();

subplot(1, 3, 2);
plot(mn_owQuestions(:,5), mn_owQuestions(:,6),'or');
legend('D5-D10');
formatcorrelations();

subplot(1, 3, 3);
plot(mn_owQuestions(:,4), mn_owQuestions(:,6),'og');
legend('D0-D10');
formatcorrelations();
set(fig,'units','normalized', 'Position', [0.1 0.1 0.9 0.45])

%% agency, continuous condition

fig = figure;
plot(mn_agQuestions(:,1), mn_agQuestions(:,2),'o'); hold on; 
plot(mn_agQuestions(:,2), mn_agQuestions(:,3),'or'); hold on; 
plot(mn_agQuestions(:,1), mn_agQuestions(:,3),'og');
legend('C0-C5', 'C5-C10', 'C0-C10', 'Location','northwest');
formatcorrelations();
set(fig,'units','normalized', 'Position', [0.1 0.1 0.5 0.7])


fig = figure; 
subplot (1, 3, 1);
plot(mn_agQuestions(:,1),mn_agQuestions(:,2),'ob');
legend('C0-C5', 'Location','northwest');
formatcorrelations();


subplot(1, 3, 2);
plot(mn_agQuestions(:,2), mn_agQuestions(:,3),'or');
legend('C5-C10', 'Location','northwest');
formatcorrelations();


subplot(1, 3, 3);
plot(mn_agQuestions(:,1), mn_agQuestions(:,3),'og');
legend('C0-C10', 'Location','northwest');
formatcorrelations();

set(fig,'units','normalized', 'Position', [0.1 0.1 0.9 0.45])



%% agency, discontinuous condition

fig = figure;
plot(mn_agQuestions(:,4), mn_agQuestions(:,5),'o'); hold on; 
plot(mn_agQuestions(:,5), mn_agQuestions(:,6),'or'); hold on; 
plot(mn_agQuestions(:,4), mn_agQuestions(:,6),'og');
legend('D0-D5', 'D5-D10', 'D0-D10', 'Location','northwest');
formatcorrelations();
set(fig,'units','normalized', 'Position', [0.1 0.1 0.5 0.7])


fig = figure; 
subplot (1, 3, 1);
plot(mn_agQuestions(:,4),mn_agQuestions(:,5),'ob');
legend('D0-D5', 'Location','northwest');
formatcorrelations();

subplot(1, 3, 2);
plot(mn_agQuestions(:,5), mn_agQuestions(:,6),'or');
legend('D5-D10', 'Location','northwest');
formatcorrelations();

subplot(1, 3, 3);
plot(mn_agQuestions(:,4), mn_agQuestions(:,6),'og');
legend('D0-D10', 'Location','northwest');
formatcorrelations();
set(fig,'units','normalized', 'Position', [0.1 0.1 0.9 0.45])


%% Ownership - comparisons continuous discontinuous

fig = figure;
plot(mn_owQuestions(:,1), mn_owQuestions(:,4),'ob'); hold on;
plot(mn_owQuestions(:,3), mn_owQuestions(:,6),'or'); hold on; 
plot(mn_owQuestions(:,1), mn_owQuestions(:,6),'og'); hold on; 
legend('C0-D0', 'C10-D10', 'C0-D10');
formatcorrelations();
set(fig,'units','normalized', 'Position', [0.1 0.1 0.5 0.7]);

fig = figure; 
subplot (1, 3, 1);
plot(mn_owQuestions(:,1),mn_owQuestions(:,4),'ob');
legend('D0-D5');
formatcorrelations();

subplot(1, 3, 2);
plot(mn_owQuestions(:,3), mn_owQuestions(:,6),'or');
legend('D5-D10');
formatcorrelations();

subplot(1, 3, 3);
plot(mn_owQuestions(:,1), mn_owQuestions(:,6),'og');
legend('D0-D10');
formatcorrelations();
set(fig,'units','normalized', 'Position', [0.1 0.1 0.9 0.45])

%% Agency - Comparisons Continuous-Discontinuous

fig = figure;
plot(mn_agQuestions(:,1), mn_agQuestions(:,4),'ob'); hold on;
plot(mn_agQuestions(:,3), mn_agQuestions(:,6),'or'); hold on; 
plot(mn_agQuestions(:,1), mn_agQuestions(:,6),'og'); hold on; 
legend('C0-D0', 'C10-D10', 'C0-D10');
formatcorrelations();
set(fig,'units','normalized', 'Position', [0.1 0.1 0.5 0.7]);

fig = figure; 
subplot (1, 3, 1);
plot(mn_agQuestions(:,1),mn_agQuestions(:,4),'ob');
legend('D0-D5');
formatcorrelations();

subplot(1, 3, 2);
plot(mn_agQuestions(:,3), mn_agQuestions(:,6),'or');
legend('D5-D10');
formatcorrelations();

subplot(1, 3, 3);
plot(mn_agQuestions(:,1), mn_agQuestions(:,6),'og');
legend('D0-D10');
formatcorrelations();
set(fig,'units','normalized', 'Position', [0.1 0.1 0.9 0.45])

%%

    
% for iSubject = 1:size(cube, 3)
%     iSubject
%     [owSubject_coef, owSubject_pval] = ...
%         corrcoef(squeeze(owCube(:, :, iSubject)))
%     [agSubject_coef, agSubject_pval] = ...
%         corrcoef(squeeze(agCube(:, :, iSubject)))
% end

%  
% for iQuestions = 1:length(owQuestions)
%     iQuestions
%     [owQuestions_coef, owQuestions_pval] = ...
%         corrcoef(squeeze(owCube(iQuestions, :, :))')
% end
% 
% for iQuestions = 1:length(agQuestions)
%     iQuestions
%     [agQuestions_coef, agQuestions_pval] = ...
%         corrcoef(squeeze(agCube(iQuestions, :, :))')
% end
% 
