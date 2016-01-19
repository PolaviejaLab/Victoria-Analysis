[~, cube] = orderresponses ();

% define questions of ownership and agency
owQuestions = 1:4;
agQuestions = 7:9;
locQuestions = 13:14;

% cubes for ownership and agency
owCube = cube(owQuestions, :, :);
agCube = cube(agQuestions, :, :);
locCube = cube(locQuestions, :, :);

mnOwn = squeeze(mean(owCube, 1))';
mnAgn = squeeze(mean(agCube, 1))';
mnLoc = squeeze(mean(locCube, 1))';


%% Correlations Coefficients
[owCorCoef, owPval] = corrcoef(mnOwn);
[agCorCoef, agPval] = corrcoef(mnAgn);
[locCorCoef, locPval] = corrcoef(mnLoc);


%% Correlation Coefficients Ow-Loc
[OwLocC1_coef, OwLocC1_pval] = corrcoef(mnOwn(:, 1), mnLoc(:, 1));
[OwLocC2_coef, OwLocC2_pval] = corrcoef(mnOwn(:, 2), mnLoc(:, 2));
[OwLocC3_coef, OwLocC3_pval] = corrcoef(mnOwn(:, 3), mnLoc(:, 3));
[OwLocC4_coef, OwLocC4_pval] = corrcoef(mnOwn(:, 4), mnLoc(:, 4));
[OwLocC5_coef, OwLocC5_pval] = corrcoef(mnOwn(:, 5), mnLoc(:, 5));
[OwLocC6_coef, OwLocC6_pval] = corrcoef(mnOwn(:, 6), mnLoc(:, 6));

%% ownership, continuous conditions

fig = figure;
plot(mnOwn(:,1), mnOwn(:,2),'.b', 'MarkerSize', 20); hold on; 
plot(mnOwn(:,2), mnOwn(:,3),'.r', 'MarkerSize', 20); hold on; 
plot(mnOwn(:,1), mnOwn(:,3),'.g', 'MarkerSize', 20);
title('Ownership in continuous condition, different offsets',...
    'FontWeight', 'bold');
legend('C0-C5', 'C5-C10', 'C0-C10');
formatcorrelations();
set(fig,'units','normalized', 'Position', [0.1 0.1 0.5 0.7])




fig = figure; 

subplot (1, 3, 1);
plot(mnOwn(:,1),mnOwn(:,2),'.b', 'MarkerSize', 20);
% title('Ownership - Continuous Limb', 'FontSize', 16, 'FontWeight', 'bold');
text(1, 6.75, strcat('R = ',num2str(owCorCoef(1, 2))), 'FontSize', 11);
text(1, 6.5, strcat('p val = ',num2str(owPval(1, 2))), 'FontSize', 11);
formatcorrelations();
xlabel('Means responses (offset = 0 cm)', 'FontSize', 14);
ylabel('Means responses (offset = 5 cm)', 'FontSize', 14);

subplot(1, 3, 2);
plot(mnOwn(:,2), mnOwn(:,3),'.r', 'MarkerSize', 20);
title('Ownership - Continuous Limb', 'FontSize', 16, 'FontWeight', 'bold');
text(1, 6.75, strcat('R = ',num2str(owCorCoef(2, 3))), 'FontSize', 11);
text(1, 6.5, strcat('p val = ',num2str(owPval(2, 3))), 'FontSize', 11);
formatcorrelations();
xlabel('Means responses (offset = 5 cm)', 'FontSize', 14);
ylabel('Means responses (offset = 10 cm)', 'FontSize', 14);

subplot(1, 3, 3);
plot(mnOwn(:,1), mnOwn(:,3),'.g', 'MarkerSize', 20);
% title('Ownership - Continuous Limb', 'FontSize', 16, 'FontWeight', 'bold');
text(1, 6.75, strcat('R = ',num2str(owCorCoef(1, 3))), 'FontSize', 11);
text(1, 6.5, strcat('p val = ', num2str(owPval(1, 3))), 'FontSize', 11);
formatcorrelations();
xlabel('Means responses (offset = 0 cm)', 'FontSize', 14);
ylabel('Means responses (offset = 10 cm)', 'FontSize', 14);

set(fig,'units','normalized', 'Position', [0.1 0.1 0.9 0.45])

%% ownership, discontinuous conditions
    
fig = figure;
plot(mnOwn(:,4), mnOwn(:,5),'.b', 'MarkerSize', 20); hold on; 
plot(mnOwn(:,5), mnOwn(:,6),'.r', 'MarkerSize', 20); hold on; 
plot(mnOwn(:,4), mnOwn(:,6),'.g', 'MarkerSize', 20);
title('Ownership in discontinuous condition, different offsets',...
    'FontWeight', 'bold');
legend('D0-D5', 'D5-D10', 'D0-D10');
formatcorrelations();
set(fig,'units','normalized', 'Position', [0.1 0.1 0.5 0.7])


fig = figure; 
subplot (1, 3, 1);
plot(mnOwn(:,4),mnOwn(:,5),'.b', 'MarkerSize', 20);
title('Ownership - Discontinuous Limb, Offset = 0 cm vs 5 cm', ...
    'FontWeight', 'bold');
% legend('D0-D5');
text(1, 6.5, strcat('R = ',num2str(owCorCoef(4, 5))));
text(1, 6.25, strcat('p val = ',num2str(owPval(4, 5))));
formatcorrelations();

subplot(1, 3, 2);
plot(mnOwn(:,5), mnOwn(:,6),'.r', 'MarkerSize', 20);
title('Ownership - Discontinuous Limb, Offset = 5 cm vs 10 cm', ...
    'FontWeight', 'bold');
% legend('D5-D10');
text(1, 6.5, strcat('R = ',num2str(owCorCoef(5, 6))));
text(1, 6.25, strcat('p val = ',num2str(owPval(5, 6))));
formatcorrelations();

subplot(1, 3, 3);
plot(mnOwn(:,4), mnOwn(:,6),'.g', 'MarkerSize', 20);
title('Ownership - Discontinuous Limb, Offset = 0 cm vs 10 cm', ...
    'FontWeight', 'bold');
% legend('D0-D10');
text(1, 6.5, strcat('R = ',num2str(owCorCoef(4, 6))));
text(1, 6.25, strcat('p val = ',num2str(owPval(4, 6))));
formatcorrelations();
set(fig,'units','normalized', 'Position', [0.1 0.1 0.9 0.45])

%% agency, continuous condition

fig = figure;
plot(mnAgn(:,1), mnAgn(:,2),'.b', 'MarkerSize', 20); hold on; 
plot(mnAgn(:,2), mnAgn(:,3),'.r', 'MarkerSize', 20); hold on; 
plot(mnAgn(:,1), mnAgn(:,3),'.g', 'MarkerSize', 20);
title('Agency - Continuous condition, different offsets',...
    'FontWeight', 'bold');
legend('C0-C5', 'C5-C10', 'C0-C10', 'Location','northwest');
formatcorrelations();
set(fig,'units','normalized', 'Position', [0.1 0.1 0.5 0.7])


fig = figure; 
subplot (1, 3, 1);
plot(mnAgn(:,1),mnAgn(:,2),'.b', 'MarkerSize', 20);
title('Agency - Continuous Limb, Offset = 0 cm vs 5 cm', ...
    'FontWeight', 'bold');
% legend('C0-C5', 'Location','northwest');
text(1, 6.5, strcat('R = ',num2str(agCorCoef(1, 2))));
text(1, 6.25, strcat('p val = ',num2str(agPval(1, 2))));
formatcorrelations();


subplot(1, 3, 2);
plot(mnAgn(:,2), mnAgn(:,3),'.r', 'MarkerSize', 20);
title('Agency - Continuous Limb, Offset = 5 cm vs 10 cm', ...
    'FontWeight', 'bold');
% legend('C5-C10', 'Location','northwest');
text(1, 6.5, strcat('R = ',num2str(agCorCoef(2, 3))));
text(1, 6.25, strcat('p val = ',num2str(agPval(2, 3))));
formatcorrelations();


subplot(1, 3, 3);
plot(mnAgn(:,1), mnAgn(:,3),'.g', 'MarkerSize', 20);
title('Agency - Continuous Limb, Offset = 0 cm vs 10 cm', ...
    'FontWeight', 'bold');
% legend('C0-C10', 'Location','northwest');
text(1, 6.5, strcat('R = ',num2str(agCorCoef(1, 3))));
text(1, 6.25, strcat('p val = ',num2str(agPval(1, 3))));
formatcorrelations();

set(fig,'units','normalized', 'Position', [0.1 0.1 0.9 0.45])



%% agency, discontinuous condition

fig = figure;
plot(mnAgn(:,4), mnAgn(:,5),'.b', 'MarkerSize', 20); hold on; 
plot(mnAgn(:,5), mnAgn(:,6),'.r', 'MarkerSize', 20); hold on; 
plot(mnAgn(:,4), mnAgn(:,6),'.g', 'MarkerSize', 20);
title('Agency in discontinuous condition, different offsets',...
    'FontWeight', 'bold');
legend('D0-D5', 'D5-D10', 'D0-D10', 'Location','northwest');
formatcorrelations();
set(fig,'units','normalized', 'Position', [0.1 0.1 0.5 0.7])


fig = figure; 
subplot (1, 3, 1);
plot(mnAgn(:,4),mnAgn(:,5),'.b', 'MarkerSize', 20);
title('Agency - Discontinuous Limb, Offset = 0 cm vs 5 cm', ...
    'FontWeight', 'bold');
% legend('D0-D5', 'Location','northwest');
text(1, 6.5, strcat('R = ',num2str(agCorCoef(4, 5))));
text(1, 6.25, strcat('p val = ',num2str(agPval(4, 5))));
formatcorrelations();

subplot(1, 3, 2);
plot(mnAgn(:,5), mnAgn(:,6),'.r', 'MarkerSize', 20);
title('Agency - Discontinuous Limb, Offset = 5 cm vs 10 cm', ...
    'FontWeight', 'bold');
% legend('D5-D10', 'Location','northwest');
text(1, 6.5, strcat('R = ',num2str(agCorCoef(5, 6))));
text(1, 6.25, strcat('p val = ',num2str(agPval(5, 6))));
formatcorrelations();

subplot(1, 3, 3);
plot(mnAgn(:,4), mnAgn(:,6),'.g', 'MarkerSize', 20);
title('Agency - Discontinuous Limb, Offset = 0 cm vs 10 cm', ...
    'FontWeight', 'bold');
% legend('D0-D10', 'Location','northwest');
text(1, 6.5, strcat('R = ',num2str(agCorCoef(4, 6))));
text(1, 6.25, strcat('p val = ',num2str(agPval(4, 6))));
formatcorrelations();

set(fig,'units','normalized', 'Position', [0.1 0.1 0.9 0.45])


%% Ownership - comparisons continuous discontinuous

fig = figure;
plot(mnOwn(:,1), mnOwn(:,4),'.b', 'MarkerSize', 20); hold on;
plot(mnOwn(:,3), mnOwn(:,6),'.r', 'MarkerSize', 20); hold on; 
plot(mnOwn(:,1), mnOwn(:,6),'.g', 'MarkerSize', 20); hold on; 
title('Continuous Limb vs Discontinuous Limb', 'fontweight', 'bold');
legend('C0-D0', 'C10-D10', 'C0-D10');
formatcorrelations();
set(fig,'units','normalized', 'Position', [0.1 0.1 0.5 0.7]);

fig = figure; 
subplot (1, 3, 1);
plot(mnOwn(:,1),mnOwn(:,4),'.b', 'MarkerSize', 20);
title('Ownership - Continuous Limb vs Discontinuous limb, offset = 0', ...
    'fontweight', 'bold');
% legend('D0-D5');
text(1, 6.5, strcat('R =', num2str(owCorCoef(1, 4))));
text(1, 6.25, strcat('R =', num2str(owPval(1, 4))));
formatcorrelations();

subplot(1, 3, 2);
plot(mnOwn(:,3), mnOwn(:,6),'.r', 'MarkerSize', 20);
title('Ownership - Continuous Limb vs Discontinuous limb, offset = 5 cm', ...
    'fontweight', 'bold');
% legend('D5-D10');
text(1, 6.5, strcat('R =', num2str(owCorCoef(2, 5))));
text(1, 6.25, strcat('R =', num2str(owPval(2, 5))));
formatcorrelations();

subplot(1, 3, 3);
plot(mnOwn(:,1), mnOwn(:,6),'.g', 'MarkerSize', 20);
title('Ownershup - Continuous Limb vs Disocontinuous Limb, offset = 10 cm', ...
    'fontweight', 'bold');
% legend('D0-D10');
text(1, 6.5, strcat('R =', num2str(owCorCoef(3, 6))));
text(1, 6.25, strcat('R =', num2str(owPval(3, 6))));
formatcorrelations();
set(fig,'units','normalized', 'Position', [0.1 0.1 0.9 0.45])

%% Agency - Comparisons Continuous-Discontinuous

fig = figure;
plot(mnAgn(:,1), mnAgn(:,4),'.b', 'MarkerSize', 20); hold on;
plot(mnAgn(:,3), mnAgn(:,6),'.r', 'MarkerSize', 20); hold on; 
plot(mnAgn(:,1), mnAgn(:,6),'.g', 'MarkerSize', 20); hold on; 
legend('C0-D0', 'C10-D10', 'C0-D10');
formatcorrelations();
set(fig,'units','normalized', 'Position', [0.1 0.1 0.5 0.7]);

fig = figure; 
subplot (1, 3, 1);
plot(mnAgn(:,1),mnAgn(:,4),'.b', 'MarkerSize', 20);
legend('D0-D5');
formatcorrelations();

subplot(1, 3, 2);
plot(mnAgn(:,3), mnAgn(:,6),'.r', 'MarkerSize', 20);
legend('D5-D10');
formatcorrelations();

subplot(1, 3, 3);
plot(mnAgn(:,1), mnAgn(:,6),'.g', 'MarkerSize', 20);
legend('D0-D10');
formatcorrelations();
set(fig,'units','normalized', 'Position', [0.1 0.1 0.9 0.45])



%% location, continuous condition 

fig = figure;
plot(mnLoc(:,1), mnLoc(:,2),'.b', 'MarkerSize', 20); hold on; 
plot(mnLoc(:,2), mnLoc(:,3),'.r', 'MarkerSize', 20); hold on; 
plot(mnLoc(:,1), mnLoc(:,3),'.g', 'MarkerSize', 20);
legend('C0-C5', 'C5-C10', 'C0-C10', 'Location','northwest');
formatcorrelations();
set(fig,'units','normalized', 'Position', [0.1 0.1 0.5 0.7])


fig = figure; 
subplot (1, 3, 1);
plot(mnLoc(:,1),mnLoc(:,2),'.b', 'MarkerSize', 20);
legend('C0-C5', 'Location','northwest');
text(1, 6.5, strcat('R = ',num2str(locCorCoef(1, 2))));
text(1, 6.25, strcat('p val = ',num2str(locPval(1, 2))));
formatcorrelations();


subplot(1, 3, 2);
plot(mnLoc(:,2), mnLoc(:,3),'.r', 'MarkerSize', 20);
legend('C5-C10', 'Location','northwest');
text(1, 6.5, strcat('R = ',num2str(locCorCoef(2, 3))));
text(1, 6.25, strcat('p val = ',num2str(locPval(2, 3))));
formatcorrelations();


subplot(1, 3, 3);
plot(mnLoc(:,1), mnLoc(:,3),'.g', 'MarkerSize', 20);
legend('C0-C10', 'Location','northwest');
text(1, 6.5, strcat('R = ',num2str(locCorCoef(1, 3))));
text(1, 6.25, strcat('p val = ',num2str(locPval(1, 3))));
formatcorrelations();

set(fig,'units','normalized', 'Position', [0.1 0.1 0.9 0.45])



%% sense of location, discontinuous condition

fig = figure;
plot(mnLoc(:,4), mnLoc(:,5),'.b', 'MarkerSize', 20); hold on; 
plot(mnLoc(:,5), mnLoc(:,6),'.r', 'MarkerSize', 20); hold on; 
plot(mnLoc(:,4), mnLoc(:,6),'.g', 'MarkerSize', 20);
legend('D0-D5', 'D5-D10', 'D0-D10', 'Location','northwest');
formatcorrelations();
set(fig,'units','normalized', 'Position', [0.1 0.1 0.5 0.7])


fig = figure; 
subplot (1, 3, 1);
plot(mnLoc(:,4),mnLoc(:,5),'.b', 'MarkerSize', 20);
legend('D0-D5', 'Location','northwest');
text(1, 6.5, strcat('R = ',num2str(locCorCoef(4, 5))));
text(1, 6.25, strcat('p val = ',num2str(locPval(4, 5))));
formatcorrelations();

subplot(1, 3, 2);
plot(mnLoc(:,5), mnLoc(:,6),'.r', 'MarkerSize', 20);
legend('D5-D10', 'Location','northwest');
text(1, 6.5, strcat('R = ',num2str(locCorCoef(5, 6))));
text(1, 6.25, strcat('p val = ',num2str(locPval(5, 6))));
formatcorrelations();

subplot(1, 3, 3);
plot(mnLoc(:,4), mnLoc(:,6),'.g', 'MarkerSize', 20);
legend('D0-D10', 'Location','northwest');
text(1, 6.5, strcat('R = ',num2str(locCorCoef(4, 6))));
text(1, 6.25, strcat('p val = ',num2str(locPval(4, 6))));
formatcorrelations();

set(fig,'units','normalized', 'Position', [0.1 0.1 0.9 0.45])






%% ownership - location, continuous conditions


fig = figure;
plot(mnOwn(:,1), mnLoc(:,1),'.b', 'MarkerSize', 20); hold on; 
plot(mnOwn(:,2), mnLoc(:,2),'.r', 'MarkerSize', 20); hold on; 
plot(mnOwn(:,3), mnLoc(:,3),'.g', 'MarkerSize', 20);
title('Ownership vs Location - Continuous Limb', 'FontWeight', 'bold', 'fontsize', 13);
legend('C0', 'C5', 'C10');
formatcorrelations();
xlabel('Ownership', 'fontsize', 12);
ylabel('Location', 'fontsize', 12);
set(fig,'units','normalized', 'Position', [0.1 0.1 0.5 0.7])


fig = figure; 
subplot (1, 3, 1);
plot(mnOwn(:,1),mnLoc(:,1),'.b', 'MarkerSize', 20);
title('Ownership vs Location - Continuous Limb, Offset = 0 cm', ... 
    'FontWeight', 'bold', 'fontsize', 12);
% legend('C0');
text(5.5, 1.25, strcat('R = ',num2str(OwLocC1_coef(1, 2))));
text(5.5, 1, strcat('p val = ',num2str(OwLocC1_pval(1, 2))));
formatcorrelations();
xlabel('Ownership', 'fontsize', 12);
ylabel('Location', 'fontsize', 12);

subplot(1, 3, 2);
plot(mnOwn(:,2), mnLoc(:,2),'.r', 'MarkerSize', 20);
title('Ownership vs Location - Continuous Limb, Offset = 5 cm', ... 
    'FontWeight', 'bold', 'fontsize', 12);
% legend('C5');
text(5.5, 1.25, strcat('R = ',num2str(OwLocC2_coef(1, 2))));
text(5.5, 1, strcat('p val = ',num2str(OwLocC2_pval(1, 2))));
formatcorrelations();
xlabel('Ownership', 'fontsize', 12);
ylabel('Location', 'fontsize', 12);

subplot(1, 3, 3);
plot(mnOwn(:,3), mnLoc(:,3),'.g', 'MarkerSize', 20);
title('Ownership vs Location - Continuous Limb, Offset = 10 cm', ... 
    'FontWeight', 'bold', 'fontsize', 12);
% legend('C10');
text(5.5, 1.25, strcat('R = ',num2str(OwLocC3_coef(1, 2))));
text(5.5, 1, strcat('p val = ', num2str(OwLocC3_pval(1, 2))));
formatcorrelations();
xlabel('Ownership', 'fontsize', 12);
ylabel('Location', 'fontsize', 12);
set(fig,'units','normalized', 'Position', [0.1 0.1 0.9 0.45])


%% ownership - location, discontinuous conditions

fig = figure;
plot(mnOwn(:,4), mnLoc(:,4),'.b', 'MarkerSize', 20); hold on; 
plot(mnOwn(:,5), mnLoc(:,5),'.r', 'MarkerSize', 20); hold on; 
plot(mnOwn(:,6), mnLoc(:,6),'.g', 'MarkerSize', 20);
title('Ownership vs Location - Discontinuous Limb', 'FontWeight', 'bold', 'fontsize', 13);
legend('D0', 'D5', 'D10');
formatcorrelations();
xlabel('Ownership', 'fontsize', 12);
ylabel('Location', 'fontsize', 12);
set(fig,'units','normalized', 'Position', [0.1 0.1 0.5 0.7])


fig = figure; 
subplot (1, 3, 1);
plot(mnOwn(:,4),mnLoc(:,4),'.b', 'MarkerSize', 20);
title('Ownership vs Location - Discontinuous Limb, Offset = 0 cm', ... 
    'FontWeight', 'bold', 'fontsize', 12);
% legend('D0');
text(5.5, 1.25, strcat('R = ',num2str(OwLocC4_coef(1, 2))));
text(5.5, 1, strcat('p val = ',num2str(OwLocC4_pval(1, 2))));
formatcorrelations();
xlabel('Ownership', 'fontsize', 12);
ylabel('Location', 'fontsize', 12);

subplot(1, 3, 2);
plot(mnOwn(:,5), mnLoc(:,5),'.r', 'MarkerSize', 20);
title('Ownership vs Location - Discontinuous Limb, Offset = 5 cm', ... 
    'FontWeight', 'bold', 'fontsize', 12);
% legend('D5');
text(5.5, 1.25, strcat('R = ',num2str(OwLocC5_coef(1, 2))));
text(5.5, 1, strcat('p val = ',num2str(OwLocC5_pval(1, 2))));
formatcorrelations();
xlabel('Ownership', 'fontsize', 12);
ylabel('Location', 'fontsize', 12);

subplot(1, 3, 3);
plot(mnOwn(:,6), mnLoc(:,6),'.g', 'MarkerSize', 20);
title('Ownership vs Location - Discontinuous Limb, Offset = 10 cm', ... 
    'FontWeight', 'bold', 'fontsize', 12);
% legend('D10');
text(5.5, 1.25, strcat('R = ',num2str(OwLocC6_coef(1, 2))));
text(5.5, 1, strcat('p val = ', num2str(OwLocC6_pval(1, 2))));
formatcorrelations();
xlabel('Ownership', 'fontsize', 12);
ylabel('Location', 'fontsize', 12);
set(fig,'units','normalized', 'Position', [0.1 0.1 0.9 0.45])
