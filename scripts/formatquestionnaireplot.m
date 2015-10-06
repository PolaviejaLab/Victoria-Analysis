function [colordots, colorrectangle] = formatquestionnaireplot ...
    (type_question)


if type_question == 1
    colorrectangle = [252 212 197]/256;
    colordots = 'r';
elseif type_question == 2
    colorrectangle = [253 237 207]/256;
    colordots = 'm';
elseif type_question == 3
    colorrectangle = [225 237 249]/256;
    colordots = 'b';
elseif type_question == 4
    colorrectangle = [206 208 233]/256;
    colordots = 'c';
elseif type_question == 5
    colorrectangle = [221 238 212]/256;
    colordots = 'g';
end

end
