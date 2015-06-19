function plot_diverging_stacked_bar(data, Y, cfg)
% Data is a matrix of question x participant
    
    global config_;

    if(nargin < 2)
        Y = 1:size(data, 1);        
    end
    
    if(~isfield(cfg, 'plot_vertical_line'))
        cfg.plot_vertical_line = 1;
    end
    
    range = 1:7;

    C = [1.0 0.0 0.0;
         1.0 0.3 0.3;
         1.0 0.6 0.6;
         0.6 0.6 0.6;
         0.6 0.6 1.0;
         0.3 0.3 1.0;
         0.0 0.0 1.0];

    hold on;
     
    if(cfg.plot_vertical_line)
        line([0 0], [0 size(data, 1) + 1], 'HandleVisibility', 'Off', ...
            'Color', 'k', 'LineStyle', '--');
    end
    
    for i_row = 1:size(data, 1)
        row_data = data(i_row, :);
        freqs = arrayfun(@(i) sum(row_data == range(i)), range);

        Xi = [0 1 1 0];
        Yi = ([0 0 1 1] - 0.5) * 0.5;
        X = [0 cumsum(freqs)];
        
        X = X - mean(X([4 5]));
        
        for i_box = 1:7
            patch(X(i_box + Xi), Y(i_row) + Yi, C(i_box, :))
        end
    end
    
    set(gca, 'YDir', 'Reverse');
    
    %set(gca, 'YTickLabel', config_.questions);
    %set(gca, 'YTick', 1:size(data, 1));
