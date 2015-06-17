function [] = questionbycondition ()
global config_;

[~, cube] = orderresponses();

shift = repmat(linspace(-0.25, 0.25, 6), 14, 1);
shift2 = repmat(linspace(-0.25, 0.25, 14), 6, 1);
X = repmat(1:14, 6, 1)';
X2 = repmat(1:6, 14, 1)';

for i_subject= 1:10
    
    quest_by_cond = squeeze(cube(:, :, i_subject))
    
    figure (10),
    subplot (3, 4, i_subject);
    plot(X' + shift', (quest_by_cond') + shift', 'o-');
    title(['Subject ' num2str(i_subject)]);
    xlim([0.5, 15.5]);
    set(gca, 'XTick', 1:14);
    ylim([0.5, 7.5]);
    set(gca, 'YTick', 1:7);
    
    figure (11),
    subplot (3, 4, i_subject);
    plot(X + shift, (quest_by_cond) + shift, 'o-');
    title(['Subject ' num2str(i_subject)]);
    xlim([0.5, 15.5]);
    set(gca, 'XTick', 1:14);
    ylim([0.5, 7.5]);
    set(gca, 'YTick', 1:7);
    
    figure (12)
    
    subplot (3, 4, i_subject);
    plot(X2 + shift2, (quest_by_cond') + shift', 'o-');
    quest_by_cond'
    xlim([0.5, 6.5]);
    set(gca, 'XTick', 1:6);
    ylim([0.5, 7.5]);
    set(gca, 'YTick', 1:7);

end