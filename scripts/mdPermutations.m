[owMedians, agMedians] = findmedians ();

[~, cube] = orderresponses ();

owMatrix_c1 = squeeze(cube(1:4,1,:));
owMatrix_c3 = squeeze(cube(1:4,3,:));
owMatrix_c4 = squeeze(cube(1:4,4,:));
owMatrix_c6 = squeeze(cube(1:4,6,:));

agMatrix_c1 = squeeze(cube(7:9,1,:));
agMatrix_c3 = squeeze(cube(7:9,3,:));
agMatrix_c4 = squeeze(cube(7:9,4,:));
agMatrix_c6 = squeeze(cube(7:9,6,:));

owMdDiffVector = abs([(owMedians(1, 1)- owMedians(2, 1)); ... %% C0 - C10
    (owMedians(1, 1) - owMedians(3, 1)); ... %% C0 - D0
    (owMedians(1, 1) - owMedians(4, 1)); ... %% C0 - D10
    (owMedians(2, 1) - owMedians(4, 1)); ... %% C10 - D10
    (owMedians(3, 1) - owMedians(4, 1))]); %% D0 - D10

agMdDiffVector = abs([(agMedians(1, 1)-agMedians(2, 1)); ... %% C0 - C10
    (agMedians(1, 1)-agMedians(3, 1)); ... %% C0 - D0
    (agMedians(1, 1)-agMedians(4, 1)); ... %% C0 - D10
    (agMedians(2, 1)-agMedians(4, 1)); ... %% C10 - D10
    (agMedians(3, 1)-agMedians(4, 1))]); %% D0 - D10

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

mdAgency_cc4 = median(agVector_cc4); %% mean 

agMdDiffVector2 = abs([(mdAgency_cc4 - agMedians(1, 1)); ... %% CO - D0
    (mdAgency_cc4 - agMedians(4, 1))]); %% D0 - D10

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

owCompMatrix = repmat(owMdDiffVector, 1, 10000);
agCompMatrix = repmat(agMdDiffVector, 1, 10000);
agCompMatrix2 = repmat(agMdDiffVector2, 1, 10000);

owResMatrix = zeros(5, 10000);
agResMatrix = zeros(5, 10000);
agResMatrix2 = zeros(2, 10000);

for i = 1:10000
    ind_owRand = randperm(152);
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
        agResMatrix2(k,i) = abs(median(agPermVector2(1:56)) - ...
            median(agPermVector2(57:113)));
    end
end

% arrays with p-vals
owMdPVals = sum(owResMatrix >= owCompMatrix,2)/10000;
agMdPVals = sum(agResMatrix >= agCompMatrix,2)/10000;
agMdPVals2 = sum(agResMatrix2 >= agCompMatrix2,2)/10000;