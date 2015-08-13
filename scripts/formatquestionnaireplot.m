function [colordots] = formatquestionnaireplot (condition, ...
    type_question, question_number)

rectangle_height = 8;



line ([0.5  14.4], [4 4], 'color', [0.827451 0.827451 0.827451], ...
    'linestyle', ':');

if type_question == 1
        rectangle ('position', [(question_number - 1) 0 1 rectangle_height], ...
        'facecolor', [252 212 197]/256, 'linestyle', 'none');
    colordots = 'r';

elseif type_question == 2
    colordots = 'm';
        rectangle ('position', [(question_number - 1) 0 1 rectangle_height], ...
        'facecolor', [253 237 207]/256, 'linestyle', 'none');
elseif type_question == 3
    colordots = 'b';
            rectangle ('position', [(question_number - 1) 0 1 rectangle_height], ...
        'facecolor', [225 237 249]/256, 'linestyle', 'none');
elseif type_question == 4
    colordots = 'c';
     rectangle ('position', [(question_number - 1) 0 1 rectangle_height], ...
        'facecolor', [206 208 233]/256, 'linestyle', 'none');
elseif type_question == 5
    colordots = 'g';
    rectangle ('position', [(question_number - 1) 0 1 rectangle_height], ...
        'facecolor', [221 238 212]/256, 'linestyle', 'none');
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
