function trials = readTrialLog(filename)
% READTRIALLOG Reads the trial log and extracts key information:
%
%  .trials(n)       - One struct array for every trial
%    .gap           - Status of the gap (Active versus Inactive)
%    .offset        - Size of the offset
%    .time_start    - Time the trial was started
%    .time_finish   - Time the trial finished
%    .time_drift    - Time at which proprioceptive drift was measured
%    .waves(n)
%      .time_start  - Time wave started
%      .time_finish - Time wave finished
%      .light       - Number of the light
%      .correct     - True if wave was to correct light
%

    fid = fopen(filename, 'r');
    
    % Structure containing all trials
    trials = struct('time_start', {}, 'time_finish', {}, 'time_drift', {}, ...
                         'gap', {}, 'offset', {}, 'waves', {});
    
    % Loop over all lines in the file and find waves and trials
    while(~feof(fid))
        line = fgets(fid);        
        splits = strsplit(line, '\t');
        
        if(numel(splits) < 3)
            continue;
        end
        
        splits{3} = strtrim(splits{3});

        if(strcmp(splits{2}, 'ExperimentController'))
            % At the start of each trial, a new trial structure is initialized
            if(strcmp(splits{3}, 'Starting trial'))
                trial = struct( ...
                    'time_start', datenum8601(splits{1}), ...
                    'time_finish', NaN, ...
                    'time_drift', NaN, ...
                    'gap', NaN, ...
                    'offset', NaN, ...
                    'waves', struct('time_start', {}, 'light', {}, 'time_finish', {}, 'correct', {}) ...
                );
            end
            
            % Record type of gap
            if(strncmp(splits{3}, 'Gap: ', 5))
                trial.gap = splits{3}(6:end);                
            end
            
            % Record offset
            if(strncmp(splits{3}, 'Offset: ', 8))
                trial.offset = str2double(splits{3}(9:end));
            end
        end
        
        if(strcmp(splits{2}, 'TrialController'))
            % At the start of every wave, a new wave structure is
            % initialized
            if(strcmp(splits{3}, 'Entering state WaitForInitial'))
                wave = struct( ...
                    'time_start', datenum8601(splits{1}), ...
                    'light', NaN ...
                );
            end            
        
            % Extract number of light and add to wave structure
            if(strncmp(splits{3}, 'Light: ', 7))
                wave.light = str2double(splits{3}(8));
            end
        
            % Extract result of wave (correct or not) and add to list of waves
            if(strncmp(splits{3}, 'Waved ', 6))
                wave.time_finish = datenum8601(splits{1});
                wave.correct = strncmp(splits{3}, 'Waved correctly', 15);

                trial.waves(end + 1) = wave;
            end                
        end
        
        % Determine time proprioceptive drift was measured
        if(strcmp(splits{2}, 'ExperimentController') && strcmp(splits{3}, 'Event MeasureProprioceptiveDrift'))
            trial.time_drift = datenum8601(splits{1});
        end
        
        % When trial is finished, add it to the list of trials
        if(strcmp(splits{2}, 'ExperimentController') && strcmp(splits{3}, 'Event ProprioceptiveDriftMeasured'))
            trial.time_finish = datenum8601(splits{1});
            trials(end + 1) = trial;
        end                
    end

    