function [responsesCube, reactionMatrix] = get_data_ar ()

dataDirectory = 'E:\Google Drive\01. PhD\E. Events\20160210_ArEvent_Neurodeg\Data';

filesSubjects = dir(fullfile(dataDirectory, 'PC*-S*'));

NSubjects = length(filesSubjects);

responsesCube = zeros (3, 4, NSubjects);
reactionMatrix = zeros (3, NSubjects);

for i_subject = 1:NSubjects
    
    % subject folder
    subjectFolder = fullfile(dataDirectory, filesSubjects(i_subject).name, '\');
    
       
    % get nprotocol file
    filesProtocol = dir(fullfile(subjectFolder, 'Protocol*.csv'));
    
    if (numel(filesProtocol) ~= 1)
        error('more than one protocol file found');
    end;
    
    fileName = fullfile(subjectFolder, filesProtocol(1).name);
    protocolFile = readtable(fileName);
    
    % Get Condition order 
    [vectorOrder] = getResponseOrder (protocolFile);

    
    % order the cube
    answerFile = readtable(strcat(subjectFolder, 'questionnaire.txt'), ...
        'ReadVariableNames', 0);
    answersMatrix = table2array(answerFile);

    for i_condition = 1:numel(vectorOrder)
        responsesCube(vectorOrder(i_condition), :, i_subject) = ...
            answersMatrix(i_condition, :);
    end
    
    
    % Get reaction order
    reactionFile = readtable(strcat(subjectFolder, 'reaction.txt'), ...
        'ReadVariableNames', 0);
    reactionNumMatrix = table2array(reactionFile);
    
    for i_condition = 1:numel(vectorOrder)
        reactionMatrix(vectorOrder(i_condition), i_subject) = ...
           reactionNumMatrix(i_condition);
    end
    
end

end