function [] = formataxis (condition, type)

if type == 1
line ([0.5  14.5], [4 4], 'color', 'r', 'linestyle', ':');

ylim ([0.5 7.5]);
set(gca, 'YTick', 1:7);
xlim ([0.5 14.5]);
set (gca, 'XTick', 1:14);
end 

xlabel ('Question Number');
if condition == 1
    title ('Continuous Limb, Offset = 0 cm');
elseif condition == 2
    title ('Continuous Limb, Offset = 5 cm');
elseif condition == 3
    title ('Continuous Limb, Offset = 10 cm');
elseif condition == 4
    title ('Discontinuous Limb, Offset = 0 cm');
elseif condition == 5
    title ('Discontinuous Limb, Offset = 5 cm');
elseif condition == 6
    title ('Discontinuous Limb, Offset = 10 cm');
else
    title ('Unkown Condition')
    
end