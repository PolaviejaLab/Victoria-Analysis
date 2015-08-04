function [colordots] = formatquestionnaireplot (condition, type_question)

    if type_question == 1
            colordots = 'r';
        elseif type_question == 2
            colordots = 'm';
        elseif type_question == 3
            colordots = 'b';
        elseif type_question == 4
            colordots = 'c';
        elseif type_question == 5
            colordots = 'g';
        end

ylim ([0 8]);
set(gca, 'YTick', 1:7);
xlim ([0 15]);
set (gca, 'XTick', 1:14);
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
    title ('Unkown Condition'); 
end
