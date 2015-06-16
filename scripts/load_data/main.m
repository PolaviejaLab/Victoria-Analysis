
dataDirectory = 'C:\Users\User\Documents\MATLAB\ExperimentDiscontinuity';
cacheDirectory = dataDirectory;

participants = {
    'Mert', '2015-06-09 06.02', fullfile(dataDirectory, 'Subject3');
    
};

for i_participant = 1:size(participants, 1)
    data = readParticipantData( ...
        participants{i_participant, 1}, ...
        participants{i_participant, 2}, ...
        participants{i_participant, 3});
   
    version = data.version;
    results = data.results;
    log = data.log;
    hands = data.hands;
    
    save([cacheDirectory '/' lower(participants{i_participant, 1}) '.mat'], ...
        'version', 'results', 'log', 'hands');
end
