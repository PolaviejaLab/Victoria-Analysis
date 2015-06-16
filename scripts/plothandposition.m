function [h_curve] = plothandposition (positionFile)

position = csvread (positionFile, 0, 2);
    positionx = smooth(position (:, 1));
    positiony = smooth(position (:, 2));
    positionz = smooth(position (:, 3));
    
    h_curve = plot3 (positionx, positiony, positionz, '-', 'linewidth', ...
        1.5, 'color', 'black');
    
end 
