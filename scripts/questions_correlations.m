[~, cube] = orderresponses ();

% define questions of ownership and agency
owQuestions = 1:4;
agQuestions = 7:9;
locQuestions = 13:14;

% cubes for ownership and agency
owCube = cube(owQuestions, :, :);
agCube = cube(agQuestions, :, :);
locCube = cube(locQuestions, :, :);

%% Generate Matrices 
owMatrix_C1 = squeeze(owCube(:, 1, :))';
owMatrix_C2 = squeeze(owCube(:, 2, :))';
owMatrix_C3 = squeeze(owCube(:, 3, :))';
owMatrix_C4 = squeeze(owCube(:, 4, :))';
owMatrix_C5 = squeeze(owCube(:, 5, :))';
owMatrix_C6 = squeeze(owCube(:, 6, :))';

agMatrix_C1 = squeeze(agCube(:, 1, :))';
agMatrix_C2 = squeeze(agCube(:, 2, :))';
agMatrix_C3 = squeeze(agCube(:, 3, :))';
agMatrix_C4 = squeeze(agCube(:, 4, :))';
agMatrix_C5 = squeeze(agCube(:, 5, :))';
agMatrix_C6 = squeeze(agCube(:, 6, :))';

%% Coefficient and Pvals for all the questions in each condition
[owcoef1, owpval1] = corrcoef(owMatrix_C1);
[owcoef2, owpval2] = corrcoef(owMatrix_C2);
[owcoef3, owpval3] = corrcoef(owMatrix_C3);
[owcoef4, owpval4] = corrcoef(owMatrix_C4);
[owcoef5, owpval5] = corrcoef(owMatrix_C5);
[owcoef6, owpval6] = corrcoef(owMatrix_C6);

[agcoef1, agpval1] = corrcoef(agMatrix_C1);
[agcoef2, agpval2] = corrcoef(agMatrix_C2);
[agcoef3, agpval3] = corrcoef(agMatrix_C3);
[agcoef4, agpval4] = corrcoef(agMatrix_C4);
[agcoef5, agpval5] = corrcoef(agMatrix_C5);
[agcoef6, agpval6] = corrcoef(agMatrix_C6);

%% Write .csv files 

csvwrite('coeficientsC1_owQuestions.csv',owcoef1);
csvwrite('coeficientsC2_owQuestions.csv',owcoef2);
csvwrite('coeficientsC3_owQuestions.csv',owcoef3);
csvwrite('coeficientsC4_owQuestions.csv',owcoef4);
csvwrite('coeficientsC5_owQuestions.csv',owcoef5);
csvwrite('coeficientsC6_owQuestions.csv',owcoef6);

csvwrite('pvalsC1_owQuestions.csv',owpval1);
csvwrite('pvalsC2_owQuestions.csv',owpval2);
csvwrite('pvalsC3_owQuestions.csv',owpval3);
csvwrite('pvalsC4_owQuestions.csv',owpval4);
csvwrite('pvalsC5_owQuestions.csv',owpval5);
csvwrite('pvalsC6_owQuestions.csv',owpval6);

% Agency

csvwrite('coeficientsC1_agQuestions.csv',agcoef1);
csvwrite('coeficientsC2_agQuestions.csv',agcoef2);
csvwrite('coeficientsC3_agQuestions.csv',agcoef3);
csvwrite('coeficientsC4_agQuestions.csv',agcoef4);
csvwrite('coeficientsC5_agQuestions.csv',agcoef5);
csvwrite('coeficientsC6_agQuestions.csv',agcoef6);

csvwrite('pvalsC1_agQuestions.csv',agpval1);
csvwrite('pvalsC2_agQuestions.csv',agpval2);
csvwrite('pvalsC3_agQuestions.csv',agpval3);
csvwrite('pvalsC4_agQuestions.csv',agpval4);
csvwrite('pvalsC5_agQuestions.csv',agpval5);
csvwrite('pvalsC6_agQuestions.csv',agpval6);



