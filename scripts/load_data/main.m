
participants = {
    'Eric', '2015-06-10 02.52', '../../data/eric'
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
    
    save(['../../data/' lower(participants{i_participant, 1}) '.mat'], ...
        'version', 'results', 'log', 'hands');
end
