function difference_gap_vs_no_gap(cube)
% DIFFERENCE_GAP_VS_NO_GAP Create a table comparing 
%   means and standard deviations between the gap and 
%   no gap conditions.
% 
% Parameters:
%   cube - data cube as returned by ORDERRESPONSES
%
% Only data from the 10cm offset condition is used.
%

    fid = fopen('../reports/difference-gap-no-gap.html', 'w');

    fprintf(fid, '<table>');

    fprintf(fid, '<tr><th></th><th colspan="2">No gap</th><th colspan="2">Gap</th></tr>');

    fprintf(fid, '<tr><th>Question</th>');
    fprintf(fid, '<th>Mean</th><th>SD</th>');
    fprintf(fid, '<th>Mean</th><th>SD</th>');
    fprintf(fid, '<th>P</th>');
    fprintf(fid, '</tr>');

    groups = { ...
        'Ownership', 1:4; ...
        'Appearance', 5:6; ...
        'Agency', 7:10; ...
        'Control', 11:12; ...
        'Location', 13:14};

    for i_g = 1:size(groups, 1)
        fprintf(fid, '<tr><th colspan="5">%s</th></tr>', groups{i_g, 1});

        for i_q = groups{i_g, 2}
            M = squeeze(mean(cube(i_q, [3 6], :), 3));
            S = squeeze(std(cube(i_q, [3 6], :), [], 3));

            [h, p] = ttest( ...
                cube(i_q, 3, :), ...
                cube(i_q, 6, :));

            fprintf(fid, '<tr><td>%d</td>', i_q);
            fprintf(fid, '<td>%.2f</td>', [M(1) S(1) M(2) S(2)]);

            if(h)
                fprintf(fid, '<td><b>%.2f</b></td>', p);
            else
                fprintf(fid, '<td>%.2f</td>', p);
            end
            fprintf(fid, '</tr>');
        end

        % Write a row with overall statistics
        d1 = cube(groups{i_g, 2}, 3, :);
        d1 = reshape(d1, 1, numel(d1));

        d2 = cube(groups{i_g, 2}, 6, :);
        d2 = reshape(d2, 1, numel(d2));

        [h, p] = ttest(d1, d2);

        fprintf(fid, '<tr style="color: blue"><td>All</td>');
        fprintf(fid, '<td>%.2f</td>', [mean(d1) std(d1) mean(d2) std(d2)]);

        if(h)
            fprintf(fid, '<td><b>%.2f</b></td>', p);
        else
            fprintf(fid, '<td>%.2f</td>', p);
        end

        fprintf(fid, '</tr>');
    end

    fprintf(fid, '</table>');
    fclose(fid);