[~, cube] = orderresponses ();

% define questions of ownership and agency
owQuestions = 1:4;
agQuestions = 7:9;

% cubes for ownership and agency
owCube = cube(owQuestions, :, :);
agCube = cube(agQuestions, :, :);


for iSubject = 1:size(cube, 3)
    [owSubject_coef, owSubject_pval] = ...
        corrcoef(squeeze(owCube(:, :, iSubject)))
    [agSubject_coef, agSubject_pval] = ...
        corrcoef(squeeze(agCube(:, :, iSubject)))
end

for iQuestions = 1:length(owQuestions)
    [owQuestions_coef, owQuestions_pval] = ...
        corrcoef(squeeze(owCube(iQuestions, :, :)))
end

for iQuestions = 1:length(agQuestions)
    [agQuestions_coef, agQuestions_pval] = ...
        corrcoef(squeeze(agCube(iQuestions, :, :)))
end

% then get signigicance with the permutations