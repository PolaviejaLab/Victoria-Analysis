clear all;
dataDirectory = 'C:\Users\User\Documents\MATLAB\ExperimentDiscontinuity';
cacheDirectory = dataDirectory;
data = load([cacheDirectory '/mert.mat']);

t_drift = [data.log.time_drift];
drift = [data.results.proprioceptive_drift];
offset = [data.results.offset];
hands = zeros(numel(t_drift), 3);

for i = 1:numel(t_drift)
    [~, I] = min(abs(data.hands{i}(:, 1) - t_drift(i)));
    hands(i, :) = data.hands{i}(I, 2:end);
end


%plot(drift, '.-');
%plot(offset, hands(:, 1), 'x');
subplot(1, 2, 1);
plot(hands(2:end, 1) / 10 + 1, '.-');
subplot(1, 2, 2);
plot(drift(2:end) * 100 + 1, '.-');

[offset' hands(:,1)]
