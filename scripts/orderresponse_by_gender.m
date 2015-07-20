
% ORDERESPONSES_BY_GENDER Takes the questionnaire responses of all the 
% subjects and generates a matrix/condition
%
% results is a struct with fields condition1 to condition6
% every field is a n-by-m matrix with n questions and m participants 
% cube is a 3d matrix question-by-condition-by-subject

global config_;

files = dir(fullfile(config_.dataDirectory, 'Subject*'));

NSubjects = numel (files);
results = struct();

map = [1 2 3 4 0 5 0 6];
cube = nan(14, 6, NSubjects);

for i_subject = 1:NSubjects
    answersFile = fullfile(config_.dataDirectory, files(i_subject).name, 'answers.csv');
    protocolFile = fullfile(config_.dataDirectory, files(i_subject).name, 'protocol.csv');
    
    [conditionOrder] = getconditionorder(protocolFile);
    questionnaireResponses = csvread(answersFile);
    
    NTrials = size(questionnaireResponses, 2);
    
    for i_trial = 1:NTrials
        name = ['condition' num2str(conditionOrder(i_trial))];
        results.(name)(:, i_subject) = questionnaireResponses(:, i_trial);
        
        cube(:, i_trial, i_subject) = questionnaireResponses(:, map(conditionOrder(i_trial)));
    end
    
end
end




% % This plots the stacked plots by gender and by handness
% %
% % Conditions:
% %  1. Continuous limb, offset = 0cm
% %  3. Continuous limb, offset = 10cm
% %  4. Discontinuous limb, offset = 0cm
% %  6. Discontinuous limb, offset = 10 cm 
% %
% % Question groups (plots):
% %  1-4. Ownership
% %  7-9. Agency
% 
% gender = [0 0 0 0 0 0 0 1 0 1 0 1 1 0 0 0 1 1 0];
% handness = [0 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 1 1];
% 
% [~, cube] = orderresponses();
% 
% conditions = [1 3 4 6];
% ownership = nan(numel(conditions), size(cube, 3) * 4);
% agency = nan(numel(conditions), size(cube, 3) * 4);
% 
% % for i = 1:numel(conditions)
% %     ownership(i, :) = reshape(squeeze(cube(1:4, conditions(i), :)), 1, size(cube, 3) * 4);
% %     agency(i, :) = reshape(squeeze(cube(7:10, conditions(i), :)), 1, size(cube, 3) * 4);
% % end
% % 
% % 
% % for j = 1:length(gender)
% %     length(gender);
% %     
% %     if gender (j) == true
% % 
% %         
% %     end
% % end 
% 
% for i = 1:numel(conditions)
%     
% end
% 
% 
% 
% clf; axes('ycolor', 'white','ytick',[]); hold on;
% set(gcf, 'Color', 'white');
% line([0 0], [0.6 4.50], 'LineStyle', '--', 'Color', 'k');
% line([0 0], numel(conditions) + 1 + [0.6 4.50], 'LineStyle', '--', 'Color', 'k');
% 
% plot_diverging_stacked_bar( ...
%     [ownership; agency], [1:4 6:9], ...
%     struct('plot_vertical_line', 0));
% xlim([-80 80]);
% 
% text(0, 0, 'Ownership', 'HorizontalAlignment', 'Center', 'FontSize', 14, 'FontWeight', 'Bold');
% text(0, numel(conditions) + 1, 'Agency', 'HorizontalAlignment', 'Center', 'FontSize', 14, 'FontWeight', 'Bold');
% 
% text_x = -90;
% for y = [0 numel(conditions) + 1]
%     text(text_x, y + 0.85, 'Continuous limb');
%     text(text_x, y + 1.15, 'No offset (0cm)');
% 
%     text(text_x, y + 1.85, 'Continuous limb');
%     text(text_x, y + 2.15, 'Offset (10cm)');
% 
%     text(text_x, y + 2.85, 'Discontinuous limb');
%     text(text_x, y + 3.15, 'Offset (0cm)');
%     
%     text(text_x, y + 3.85, 'Discontinuous limb');
%     text(text_x, y + 4.15, 'Offset (10cm)');
% end
% 
% xlabel('Frequency');
% ylabel('Condition');
% 
