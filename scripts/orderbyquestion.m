function [results] = orderbyquestion ()

files = dir('Subjec*');

NSubjects = numel (files);
results = struct();



for i_subject = 1:NSubjects
    answersFile = fullfile(files(i_subject).name, 'answers.csv');
    protocolFile = fullfile(files(i_subject).name, 'Protocol.csv');
    
    [conditionOrder] = getconditionorder(protocolFile);
    questionnaireResponses = csvread(answersFile);
    
    NQuestions = size(questionnaireResponses, 1);
    
    for i_question = 1:NQuestions
        name = ['question' num2str(conditionOrder(i_question))];
        results.(name)(:, i_subject) = questionnaireResponses (i_question, :);
    end
      
    
%     for i_question = 1:NQuestions
%         name = ['question' num2str(conditionOrder(i_trial))];
%         results.(name)(:, i_subject) = questionnaireResponses(:, i_trial);
%         
%         %cube(:, i_trial, i_subject) = questionnaireResponses(:, map(order(i_trial)));
%     end
    
end

end 
