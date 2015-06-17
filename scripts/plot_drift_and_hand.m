function plot_drift_and_hand()
global config_;

n_participants = size(config_.participants, 1);
n_conditions = numel(config_.conditionsShort);

% Construct two matrices, one for drift and the other for hand position
%  participant x condition

drift = nan(n_participants, n_conditions);
handp = nan(n_participants, n_conditions);

for i_participant = 1:n_participants
    % Load data for participant
    participant = lower(config_.participants{i_participant, 1});
    data = load(fullfile(config_.cacheDirectory, [participant '.mat']));
    
    t_drift = [data.log.time_drift];
    
    drift(i_participant, :) = [data.results.proprioceptive_drift];
    offset = [data.results.offset];
    
    for i_condition = 1:n_conditions
        % Remove nans
        invalid = any(isnan(data.hands{i_condition}), 2);
        data.hands{i_condition}(invalid, :) = [];
        
        [~, I] = min(abs(data.hands{i_condition}(:, 1) - t_drift(i_condition)));
        
        dt = (data.hands{i_condition}(I, 1) - t_drift(i_condition)) * 3600 * 24 * 1000;
        
        if(dt > 100)
            warning('No sample found within 10ms (%f)', dt);
        else
            handp(i_participant, i_condition) = data.hands{i_condition}(I, 2);
        end
    end
end


drift(:, 1) = [];
handp(:, 1) = [];

figure (5),
for i_participant = 1:n_participants
    subplot(2, 4, i_participant); cla; hold on;
    plot(drift(i_participant, 1:3) * 100, 'bo-');
    plot(handp(i_participant, 1:3) / 10, 'rx-');
    
    plot(4:6, drift(i_participant, 4:6) * 100, 'bo-');
    plot(4:6, handp(i_participant, 4:6) / 10, 'rx-');
    
    plot([0 5 10], 'k--');
    plot(4:6, [0 5 10], 'k--');
    
    legend({'Drift', 'HandP'});
    xlabel('Condition');
    ylabel('Position (cm)');
    
    set(gca, 'XTick', 1:6);
    set(gca, 'XTickLabel', config_.conditionsShort(2:end));
    
    title(config_.participants{i_participant, 1});
end

figure(7);
subplot(1, 2, 1); cla; hold on;
plot(nanmean(drift(:, 1:3)) * 100, 'bo-');
plot(nanmean(handp(:, 1:3)) / 10, 'rx-');

plot(4:6, nanmean(drift(:, 4:6)) * 100, 'bo-');
plot(4:6, nanmean(handp(:, 4:6)) / 10, 'rx-');

for i = 1:6
    errorbar(i, nanmean(drift(:, i)) * 100, nanstd(drift(:, i) * 100) /sqrt(8), 'Color', 'blue');
    errorbar(i, nanmean(handp(:, i)) / 10, nanstd(handp(:, i) / 10) / sqrt(8), 'Color', 'red');
end

xlabel('Condition');
ylabel('Position (cm)');
set(gca, 'XTick', 1:6);
set(gca, 'XTickLabel', config_.conditionsShort(2:end));



%     subplot(1, 2, 1);
%     plot(hands(2:end, 1) / 10 + 1, '.-');
%     subplot(1, 2, 2);
%     plot(drift(2:end) * 100 + 1, '.-');
%
%     [offset' hands(:,1)]
