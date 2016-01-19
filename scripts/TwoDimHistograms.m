[~, cube] = orderresponses ();

% define questions of ownership and agency
owQuestions = 1:4;
agQuestions = 7:9;

% cubes for ownership and agency
owCube = cube(owQuestions, :, :);
agCube = cube(agQuestions, :, :);

%% 2D Histograms - Ownership

condition1 = 1;
condition2 = 3;

mat_condition1 = squeeze(owCube(:, condition1, :));
vect_condition1 = mat_condition1(:);

mat_condition2 = squeeze(owCube(:, condition2, :));
vect_condition2 = mat_condition2(:);


% figure,
% hist3([vect_condition1, vect_condition2], {1:1:7 1:1:7});

figure, 
twoDhist = hist3([vect_condition1, vect_condition2], {1:1:7 1:1:7});
twoDhist1 = twoDhist';
twoDhist1(size(twoDhist,1) + 1, size(twoDhist,2) + 1) = 0;

xb = linspace(min(vect_condition1)-0.5,max(vect_condition1)+0.5, ... 
    size(twoDhist,1)+1);
yb = linspace(min(vect_condition2)-0.5,max(vect_condition2)+0.5, ... 
    size(twoDhist,1)+1);

h = pcolor(xb,yb,twoDhist1);

title('Continuous limb - Offset = 0 cm Offset = 10 cm', ...
    'fontweight', 'bold');
xlabel('Responses to questionnaire');
ylabel('Responses to questionnaire');



% figure, 
% imagesc(flipud(twoDhist'));


%% 2D Histograms - Agency

condition1 = 3;
condition2 = 6;

mat_condition1 = squeeze(agCube(:, condition1, :));
vect_condition1 = mat_condition1(:);

mat_condition2 = squeeze(agCube(:, condition2, :));
vect_condition2 = mat_condition2(:);


% figure,
% hist3([vect_condition1, vect_condition2], [7 7]);

figure, 
twoDhist = hist3([vect_condition1, vect_condition2], [7 7]);
twoDhist1 = twoDhist';
twoDhist1(size(twoDhist,1) + 1, size(twoDhist,2) + 1) = 0;

xb = linspace(0,max(vect_condition1),size(twoDhist,1)+1);
yb = linspace(0,max(vect_condition2),size(twoDhist,1)+1);

h = pcolor(xb,yb,twoDhist1);