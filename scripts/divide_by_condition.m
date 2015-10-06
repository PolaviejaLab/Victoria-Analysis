function [cube_0, cube_1] = divide_by_condition (cube, condition)

cube_0 = zeros(size(cube, 1), size(cube,2), length(find(condition == 0)));
cube_1 = zeros(size(cube, 1), size(cube,2), length(find(condition == 1)));

index_male = 1;
index_female = 1;

for i = 1:length(condition)
    if condition(i) == 0
        cube_0(:, :, index_male) = cube(:, :, i);
        index_male = index_male + 1;
    else
        cube_1(:, :, index_female) = cube(:, :, i);
        index_female = index_female + 1;
    end
end

end