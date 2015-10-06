[owMeans, agMeans] = findmeans ();

[~, cube] = orderresponses ();

owQuestions = 1:4;
agQuestions = 7:9;

owMatrix_c1 = squeeze(cube(owQuestions,1,:));
owMatrix_c3 = squeeze(cube(owQuestions,3,:));
owMatrix_c4 = squeeze(cube(owQuestions,4,:));
owMatrix_c6 = squeeze(cube(owQuestions,6,:));

agMatrix_c1 = squeeze(cube(agQuestions,1,:));
agMatrix_c3 = squeeze(cube(agQuestions,3,:));
agMatrix_c4 = squeeze(cube(agQuestions,4,:));
agMatrix_c6 = squeeze(cube(agQuestions,6,:));

owMnDiffVector = abs([(owMeans(1, 1)- owMeans(2, 1)); ... %% C0 - C10
    (owMeans(1, 1) - owMeans(3, 1)); ... %% C0 - D0
    (owMeans(1, 1) - owMeans(4, 1)); ... %% C0 - D10
    (owMeans(2, 1) - owMeans(4, 1)); ... %% C10 - D10
    (owMeans(3, 1) - owMeans(4, 1))]); %% D0 - D10

agMnDiffVector = abs([(agMeans(1, 1)-agMeans(2, 1)); ... %% C0 - C10
    (agMeans(1, 1)-agMeans(3, 1)); ... %% C0 - D0
    (agMeans(1, 1)-agMeans(4, 1)); ... %% C0 - D10
    (agMeans(2, 1)-agMeans(4, 1)); ... %% C10 - D10
    (agMeans(3, 1)-agMeans(4, 1))]); %% D0 - D10

owVector_c13 = [reshape(owMatrix_c1, 1, numel(owMatrix_c1)), ...
    reshape(owMatrix_c3, 1, numel(owMatrix_c3))]; %% C0 - C10
owVector_c14 = [reshape(owMatrix_c1, 1, numel(owMatrix_c1)), ...
    reshape(owMatrix_c4, 1, numel(owMatrix_c4))]; %% C0 - D0
owVector_c16 = [reshape(owMatrix_c1, 1, numel(owMatrix_c1)), ...
    reshape(owMatrix_c6, 1, numel(owMatrix_c6))]; %% C0 - D10
owVector_c36 = [reshape(owMatrix_c3, 1, numel(owMatrix_c3)), ...
    reshape(owMatrix_c6, 1, numel(owMatrix_c6))]; %% C10 - D10
owVector_c46 = [reshape(owMatrix_c4, 1, numel(owMatrix_c4)), ...
    reshape(owMatrix_c6, 1, numel(owMatrix_c6))]; %% D0 - D10

agVector_c13 = [reshape(agMatrix_c1, 1, numel(agMatrix_c1)), ...
    reshape(agMatrix_c3, 1, numel(agMatrix_c3))]; %% C0 - C10
agVector_c14 = [reshape(agMatrix_c1, 1, numel(agMatrix_c1)), ...
    reshape(agMatrix_c4, 1, numel(agMatrix_c4))]; %% C0 - D0
agVector_c16 = [reshape(agMatrix_c1, 1, numel(agMatrix_c1)), ...
    reshape(agMatrix_c6, 1, numel(agMatrix_c6))]; %% C0 - D10
agVector_c36 = [reshape(agMatrix_c3, 1, numel(agMatrix_c3)), ...
    reshape(agMatrix_c6, 1, numel(agMatrix_c6))]; %% C10 - D10
agVector_c46 = [reshape(agMatrix_c4, 1, numel(agMatrix_c4)), ...
    reshape(agMatrix_c6, 1, numel(agMatrix_c6))]; %% D0 - D10

%C4 without outlier
agVector_cc4 = agMatrix_c4; %% Remove outlier c4
agVector_cc4(agVector_cc4 == 2) = [];

mnAgency_cc4 = mean(agVector_cc4); %% Mean without oulier

agMnDiffVector2 = abs([(mnAgency_cc4 - agMeans(1, 1)); ... %% CO - D0
    (mnAgency_cc4 - agMeans(4, 1))]); %% D0 - D10

agVector_cc14 = [reshape(agMatrix_c1, 1, numel(agMatrix_c1)), ...
    agVector_cc4]; %% C0 - D0
agVector_cc46 = [agVector_cc4, ...
    reshape(agMatrix_c6, 1, numel(agMatrix_c6))]; %% D0 - D10

% matrix of conditions
owMatrix_analysis = ...
    [owVector_c13;owVector_c14;owVector_c16;owVector_c36;owVector_c46];
agMatrix_analysis = ...
    [agVector_c13;agVector_c14;agVector_c16;agVector_c36;agVector_c46];
agMatrix_analysis2 = ...
    [agVector_cc14;agVector_cc46];

owCompMatrix = repmat(owMnDiffVector, 1, 10000);
agCompMatrix = repmat(agMnDiffVector, 1, 10000);
agCompMatrix2 = repmat(agMnDiffVector2, 1, 10000);

owResMatrix = zeros(5, 10000);
agResMatrix = zeros(5, 10000);
agResMatrix2 = zeros(2, 10000);

for i = 1:10000
    ind_owRand = randperm(length(owVector_c13));
    ind_agRand = randperm(114);
    ind_agRand2 = randperm(113);
    for j=1:5
        owPermVector = owMatrix_analysis(j,ind_owRand);
        agPermVector = agMatrix_analysis(j,ind_agRand);
        owResMatrix(j,i) = abs(mean(owPermVector(1:76)) - ...
            mean(owPermVector(77:152)));
        agResMatrix(j,i) = abs(mean(agPermVector(1:57)) - ...
            mean(agPermVector(58:114)));
    end
    for k = 1:2
        agPermVector2 = agMatrix_analysis2(k,ind_agRand2);
        agResMatrix2(k,i) = abs(mean(agPermVector2(1:56)) - ...
            mean(agPermVector2(57:113)));
    end
end

% arrays with p-vals
owMnPVals = sum(owResMatrix >= owCompMatrix,2)/10000;
agMnPVals = sum(agResMatrix >= agCompMatrix,2)/10000;
agMnPVals2 = sum(agResMatrix2 >= agCompMatrix2,2)/10000;