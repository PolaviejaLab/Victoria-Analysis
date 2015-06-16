function plot_diverging_stacked_bar(data)
% Data is a matrix of question x participant
    
    global config_;

    range = 1:7;

    C = [1.0 0.0 0.0;
         1.0 0.3 0.3;
         1.0 0.6 0.6;
         0.6 0.6 0.6;
         0.6 0.6 1.0;
         0.3 0.3 1.0;
         0.0 0.0 1.0];

    cla; hold on;
     
    line([0 0], [0 size(data, 1) + 1], 'HandleVisibility', 'Off', ...
        'Color', 'k', 'LineStyle', '--');
    
    for i_row = 1:size(data, 1)
        row_data = data(i_row, :);
        freqs = arrayfun(@(i) sum(row_data == range(i)), range);

        Xi = [0 1 1 0];
        Yi = ([0 0 1 1] - 0.5) * 0.5;
        X = [0 cumsum(freqs)];
        
        X = X - mean(X([4 5]));
        
        for i_box = 1:7
            patch(X(i_box + Xi), Yi + i_row, C(i_box, :))
        end
    end

    ylabel('Question');
    xlabel('Frequency');
    
    set(gca, 'YDir', 'Reverse');
    
    %set(gca, 'YTickLabel', config_.questions);
    %set(gca, 'YTick', 1:size(data, 1));
