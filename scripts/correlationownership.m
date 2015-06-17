function [] = correlationownership ()
global config_;

[~, cube] = orderresponses();

cla;
subj_by_cond = squeeze(cube(1, :, :))';
shift = repmat(linspace(-0.1, 0.1, 6), 10, 1);

X = repmat(1:10, 6, 1)';

% plot(X + shift, subj_by_cond + shift, 'o-')
% figure (9)
% subj_by_cond = squeeze(cube(1, :, :))';


for i_question = 1:6
    
    subj_by_cond = squeeze(cube(i_question, :, :));
    
    figure (8),
    subplot (2, 3, i_question);
    plot (subj_by_cond');
    title(config_.questions(i_question));
    
    xlim([0.5, 10.5]);
    set(gca, 'XTick', 1:10);
    
    ylim([0.5, 7.5]);
    set(gca, 'YTick', 1:7);
    
    
    figure(9) % scatter the points per condition
    subplot (2, 3, i_question);
    subj_by_cond1 = squeeze(cube(i_question, :, :))'
    
    plot(X + shift, subj_by_cond1 + shift, 'o-')
    title(config_.questions(i_question));
    
    xlim([0.5, 10.5]);
    set(gca, 'XTick', 1:10);
    
    ylim([0.5, 7.5]);
    set(gca, 'YTick', 1:7);
    
    xlim([0.5, 10.5]);
    set(gca, 'XTick', 1:10);
    
end