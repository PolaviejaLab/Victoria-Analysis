function data = readResultsFile(filename)
% READRESULTSFILE  Loads the results file from a .csv into an
%  array of structures.

    fid = fopen(filename, 'r');

    % Column names, we forgot to add this to the files themselves
    header = {'trial_nr', 'gap', 'offset', 'number_of_waves', ...
              'correct_waves', 'incorrect_waves', 'late_waves', ...
              'proprioceptive_drift', 'hand_x', 'hand_y', 'hand_z'};

    n_columns = numel(header);
          
    source_data = textscan(fid, '%d, %[^,], %f, %d, %d, %d, %d, %f, %f, %f, %f');

    params = cell(1, n_columns * 2);
    params(1:2:n_columns*2) = header;
    params(2:2:n_columns*2) = source_data;
    
    data = struct(params{:});
end