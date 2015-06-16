function [results, cube] = orderresponses ()
% ORDERESPONSES Takes the questionnaire responses of all the subjects and
% generates a matrix/condition
%
% results is a struct with fields condition1 to condition6
% every field is a n-by-m matrix with
%  n questions and m participants
%
% cube is a 3d matrix question-by-condition-by-subject


files = dir('Subject*');

NSubjects = numel (files);
results = struct();

map = [1 2 3 4 0 5 0 6];
cube = nan(14, 6, NSubjects);

for i_subject = 1:NSubjects
    answersFile = fullfile(files(i_subject).name, 'answers.csv');
    protocolFile = fullfile(files(i_subject).name, 'Protocol.csv');
    
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

