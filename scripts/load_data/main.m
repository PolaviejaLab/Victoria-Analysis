function main()

    global config_;

    for i_participant = 1:size(config_.participants, 1)
        filename = [lower(config_.participants{i_participant, 1}) '.mat'];
        filename = fullfile(config_.cacheDirectory, filename);
        
        % Skip participant if file already exists
        if(exist(filename, 'file'))
            continue;
        end

        fprintf('Loading data for %s\n', config_.participants{i_participant, 1});
        
        data = readParticipantData( ...
            config_.participants{i_participant, 1}, ...
            config_.participants{i_participant, 2}, ...
            config_.participants{i_participant, 3});

        fprintf('\n');
        
        % Save data to file
        version = data.version;
        results = data.results;
        log = data.log;
        hands = data.hands;

        save(filename, 'version', 'results', 'log', 'hands');
    end
