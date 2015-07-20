
%% Load the data
% cube is a 3d matrix question-by-condition-by-subject
[~, cube] = orderresponses();

%% Plot results per question
condition_labels = {'NG0', 'NG5', 'NG10', 'G0', 'G5', 'G10'};
questions_labels = {'"looking at my own hand, not a VH"', ...
    '"virtual hand was my hand"', '"virtual hand belonged to me "', ...
    '"virtual hand was part of my body"', ...
    '"physically resembling my hand"', ...
    '"my real hand was turning virtual"',  ...
    '"I could control the virtual hand"', ...
    '"virtual movements were caused by me"', ...
    '"my movement turned the lights off"', ...
    '"focussing only on the virtual hand"', ...
    '"the virtual hand was controlling mine"', ...
    '"virtual hand caused the movement of mine"', ...
    '"my hand was located where the VH was"',...
    '"my hand moved where the VH moved"'};

figure (4)    
for i_question = 1:size(cube, 1)
    cond_by_subj = squeeze(cube(i_question, :, :));
    
    subplot(3, 5, i_question);
    plot(cond_by_subj, '.-');
           
    set(gca, 'XTick', 1:6);
    set(gca, 'YTick', 1:7);
    set(gca, 'XTickLabel', condition_labels);
    title(questions_labels{i_question});
    
    xlim([0.5, 6.5]);
    ylim([0, 8]);
end

% 
%         plot(drift(i_participant, 1:3) * 100, 'bo-');
%         plot(handp(i_participant, 1:3) / 10, 'rx-');
% 
%         plot(4:6, drift(i_participant, 4:6) * 100, 'bo-');
%         plot(4:6, handp(i_participant, 4:6) / 10, 'rx-');