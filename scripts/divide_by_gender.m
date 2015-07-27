function [cube_male, cube_female] = divide_by_gender (cube, gender)

cube_male = zeros(size(cube, 1), size(cube,2), length(find(gender == 0)));
cube_female = zeros(size(cube, 1), size(cube,2), length(find(gender == 1)));

index_male = 1;
index_female = 1;

for i = 1:length(gender)
    if gender(i) == 0
        cube_male(:, :, index_male) = cube(:, :, i);
        index_male = index_male + 1;
    else
        cube_female(:, :, index_female) = cube(:, :, i);
        index_female = index_female + 1;
    end
end

end