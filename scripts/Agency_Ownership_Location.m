[~, cube] = orderresponses();

NSubjects = size(cube,3);
NQuestions_Agency = 4;
NQuestions_Ownership = 4;
NQuestions_Location = 2;


Agency_NG0_4 = zeros (1, NSubjects*NQuestions_Agency);
Agency_NG10_4 = zeros (1, NSubjects*NQuestions_Agency);
Agency_G0_4 = zeros (1, NSubjects*NQuestions_Agency);

Ownership_NG0_4 = zeros (1, NSubjects*NQuestions_Ownership);
Ownership_NG10_4 = zeros (1, NSubjects*NQuestions_Ownership);
Ownership_G0_4 = zeros (1, NSubjects*NQuestions_Ownership);

Location_NG0_2 = zeros (1, NSubjects*NQuestions_Location);
Location_NG10_2 = zeros (1, NSubjects*NQuestions_Location);
Location_G0_2 = zeros (1, NSubjects*NQuestions_Location);

for i_subjects = 1:NSubjects
    
    for i_questionO = 1:NQuestions_Ownership
        answer4 = cube(i_questionO, 1, i_subjects);
        Ownership_NG0_4(((i_questionO-1)*10)+ i_subjects)= answer4;
        answer5 = cube(i_questionO, 3, i_subjects);
        Ownership_NG10_4(((i_questionO-1)*10)+ i_subjects) = answer5;
        answer6 = cube(i_questionO, 4, i_subjects);
        Ownership_G0_4(((i_questionO-1)*10)+ i_subjects) = answer6;
    end
    
    for i_questionA = 1:NQuestions_Agency
        answer1 = cube(i_questionA+6, 1, i_subjects);
        Agency_NG0_4(((i_questionA-1)*10)+ i_subjects)= answer1;
        answer2 = cube(i_questionA+6, 3, i_subjects);
        Agency_NG10_4(((i_questionA-1)*10)+ i_subjects) = answer2;
        answer3 = cube(i_questionA+6, 4, i_subjects);
        Agency_G0_4(((i_questionA-1)*10)+ i_subjects) = answer3;
    end
    
    for i_questionL = 1:NQuestions_Location
        answer7 = cube(i_questionL+12, 1, i_subjects);
        Location_NG0_2(((i_questionL-1)*10)+ i_subjects)= answer7;
        answer8 = cube(i_questionL+12, 3, i_subjects);
        Location_NG10_2(((i_questionL-1)*10)+ i_subjects) = answer8;
        answer9 = cube(i_questionL+12, 4, i_subjects);
        Location_G0_2(((i_questionL-1)*10)+ i_subjects) = answer9;
    end
end

figure (20), %% all questions NG0, NG10
scatter (Agency_NG0_4, Agency_NG10_4, 'r', 'o'); hold on
scatter (Ownership_NG0_4, Ownership_NG10_4, 'b', 'o'); hold on
scatter (Location_NG0_2, Location_NG10_2, 'g', 'o');
line([9 0], [9 0], 'color', [0.827451 0.827451 0.827451]);
xlabel ('Continuous Limb, Offset = 0');
ylabel ('Continuous Limb, Offset = 10');
xlim([0.5, 7.5]);
set(gca, 'XTick', 1:7);
ylim([0.5, 7.5]);
set(gca, 'YTick', 1:7);
legend({'Agency', 'Ownership', 'Location'});
%% 
figure (21), % subplots for all questions of agency, ownership and location
subplot (2, 2, 1)

scatter (Agency_NG0_4, Agency_NG10_4, 'r', 'o');
p = polyfit(Agency_NG0_4, Agency_NG10_4, 1);
yfit = polyval(p, Agency_NG0_4);
hold on 
plot (Agency_NG0_4, yfit, '--k');


% format of the plot
line([9 0], [9 0], 'color', [0.827451 0.827451 0.827451]);
title ('Agency');
xlabel ('Continuous Limb, Offset = 0');
ylabel ('Continuous Limb, Offset = 10');
xlim([0.5, 7.5]);
set(gca, 'XTick', 1:7);
ylim([0.5, 7.5]);
set(gca, 'YTick', 1:7);


subplot (2, 2, 2)
scatter (Ownership_NG0_4, Ownership_NG10_4, 'b', 'o');
p = polyfit(Ownership_NG0_4, Ownership_NG10_4, 1);
yfit = polyval(p, Ownership_NG0_4);
hold on 
plot (Ownership_NG0_4, yfit, '--k');

% format the plot
line([9 0], [9 0], 'color', [0.827451 0.827451 0.827451]);
title ('Ownership');
xlabel ('Continuous Limb, Offset = 0');
ylabel ('Continuous Limb, Offset = 10');
xlim([0.5, 7.5]);
set(gca, 'XTick', 1:7);
ylim([0.5, 7.5]);
set(gca, 'YTick', 1:7);

subplot (2, 2, 3)
scatter (Location_NG0_2, Location_NG10_2, 'g', 'o');
p = polyfit(Location_NG0_2, Location_NG10_2, 1);
yfit = polyval(p, Location_NG0_2);
hold on 
plot (Location_NG0_2, yfit, '--k');


% format the plot
line([9 0], [9 0], 'color', [0.827451 0.827451 0.827451]);
title ('Location');
xlabel ('Continuous Limb, Offset = 0');
ylabel ('Continuous Limb, Offset = 10');
xlim([0.5, 7.5]);
set(gca, 'XTick', 1:7);
ylim([0.5, 7.5]);
set(gca, 'YTick', 1:7);

%%
figure (22), %% all questions NG0, G0
scatter (Agency_NG0_4, Agency_G0_4, 'r', 'o'); hold on
scatter (Ownership_NG0_4, Ownership_G0_4, 'b', 'o'); hold on
scatter (Location_NG0_2, Location_G0_2, 'g', 'o');
line([9 0], [9 0], 'color', [0.827451 0.827451 0.827451]);
xlabel ('Continuous Limb, Offset = 0');
ylabel ('Discontinuous Limb, Offset = 0');
xlim([0.5, 7.5]);
set(gca, 'XTick', 1:7);
ylim([0.5, 7.5]);
set(gca, 'YTick', 1:7);
legend({'Agency', 'Ownership', 'Location'});


figure (23), % subplots for all questions of agency, ownership and location
subplot (1, 3, 1)
scatter (Agency_NG0_4, Agency_G0_4, 'r', 'o');
line([9 0], [9 0], 'color', [0.827451 0.827451 0.827451]);
title ('Agency');
xlabel ('Continuous Limb, Offset = 0');
ylabel ('Discontinuous Limb, Offset = 0');
xlim([0.5, 7.5]);
set(gca, 'XTick', 1:7);
ylim([0.5, 7.5]);
set(gca, 'YTick', 1:7);

subplot (1, 3, 2)
scatter (Ownership_NG0_4, Ownership_G0_4, 'b', 'o');
line([9 0], [9 0], 'color', [0.827451 0.827451 0.827451]);
title ('Ownership');
xlabel ('Continuous Limb, Offset = 0');
ylabel ('Discontinuous Limb, Offset = 0');
xlim([0.5, 7.5]);
set(gca, 'XTick', 1:7);
ylim([0.5, 7.5]);
set(gca, 'YTick', 1:7);

subplot (1, 3, 3)
scatter (Location_NG0_2, Location_G0_2, 'g', 'o');
line([9 0], [9 0], 'color', [0.827451 0.827451 0.827451]);
title ('Location');
xlabel ('Continuous Limb, Offset = 0');
ylabel ('Discontinuous Limb, Offset = 0');
xlim([0.5, 7.5]);
set(gca, 'XTick', 1:7);
ylim([0.5, 7.5]);
set(gca, 'YTick',1:7);


figure(24),
subplot (1, 2, 1)
scatter (Agency_NG0_4, Agency_NG10_4, 'r', 'o'); hold on
scatter (Ownership_NG0_4, Ownership_NG10_4, 'b', 'o'); hold on
scatter (Location_NG0_2, Location_NG10_2, 'g', 'o');
line([9 0], [9 0], 'color', [0.827451 0.827451 0.827451]);
xlabel ('Continuous Limb, Offset = 0');
ylabel ('Continuous Limb, Offset = 10');
xlim([0.5, 7.5]);
set(gca, 'XTick', 1:7);
ylim([0.5, 7.5]);
set(gca, 'YTick', 1:7);
legend({'Agency', 'Ownership', 'Location'});

subplot (1, 2, 2)
scatter (Agency_NG0_4, Agency_G0_4, 'r', 'o'); hold on
scatter (Ownership_NG0_4, Ownership_G0_4, 'b', 'o'); hold on
scatter (Location_NG0_2, Location_G0_2, 'g', 'o');
line([9 0], [9 0], 'color', [0.827451 0.827451 0.827451]);
xlabel ('Continuous Limb, Offset = 0');
ylabel ('Discontinuous Limb, Offset = 0');
xlim([0.5, 7.5]);
set(gca, 'XTick', 1:7);
ylim([0.5, 7.5]);
set(gca, 'YTick', 1:7);
legend({'Agency', 'Ownership', 'Location'});


figure (25),
subplot (2, 3, 1)
scatter (Agency_NG0_4, Agency_NG10_4, 'r', 'o');
line([9 0], [9 0], 'color', [0.827451 0.827451 0.827451]);
title ('Agency');
xlabel ('Continuous Limb, Offset = 0');
ylabel ('Continuous Limb, Offset = 10');
xlim([0.5, 7.5]);
set(gca, 'XTick', 1:7);
ylim([0.5, 7.5]);
set(gca, 'YTick', 1:7);

subplot (2, 3, 2)
scatter (Ownership_NG0_4, Ownership_NG10_4, 'b', 'o');
line([9 0], [9 0], 'color', [0.827451 0.827451 0.827451]);
title ('Ownership');
xlabel ('Continuous Limb, Offset = 0');
ylabel ('Continuous Limb, Offset = 10');
xlim([0.5, 7.5]);
set(gca, 'XTick', 1:7);
ylim([0.5, 7.5]);
set(gca, 'YTick', 1:7);

subplot (2, 3, 3)
scatter (Location_NG0_2, Location_NG10_2, 'g', 'o');
line([9 0], [9 0], 'color', [0.827451 0.827451 0.827451]);
title ('Location');
xlabel ('Continuous Limb, Offset = 0');
ylabel ('Continuous Limb, Offset = 10');
xlim([0.5, 7.5]);
set(gca, 'XTick', 1:7);
ylim([0.5, 7.5]);
set(gca, 'YTick', 1:7);

subplot (2, 3, 4)
scatter (Agency_NG0_4, Agency_G0_4, 'r', 'o');
line([9 0], [9 0], 'color', [0.827451 0.827451 0.827451]);
title ('Agency');
xlabel ('Continuous Limb, Offset = 0');
ylabel ('Discontinuous Limb, Offset = 0');
xlim([0.5, 7.5]);
set(gca, 'XTick', 1:7);
ylim([0.5, 7.5]);
set(gca, 'YTick', 1:7);

subplot (2, 3, 5)
scatter (Ownership_NG0_4, Ownership_G0_4, 'b', 'o');
line([9 0], [9 0], 'color', [0.827451 0.827451 0.827451]);
title ('Ownership');
xlabel ('Continuous Limb, Offset = 0');
ylabel ('Discontinuous Limb, Offset = 0');
xlim([0.5, 7.5]);
set(gca, 'XTick', 1:7);
ylim([0.5, 7.5]);
set(gca, 'YTick', 1:7);

subplot (2, 3, 6)
scatter (Location_NG0_2, Location_G0_2, 'g', 'o');
line([9 0], [9 0], 'color', [0.827451 0.827451 0.827451]);
title ('Location');
xlabel ('Continuous Limb, Offset = 0');
ylabel ('Discontinuous Limb, Offset = 0');
xlim([0.5, 7.5]);
set(gca, 'XTick', 1:7);
ylim([0.5, 7.5]);
set(gca, 'YTick',1:7);

%%
figure (37),
subplot (1, 2, 1)
hist ([Agency_NG0_4; Agency_NG10_4]', 1:7);
title ('Agency: Continuous Limb, Offset = 0 / Continuous Limb, Offset = 10');
set(gca, 'YTick', 1:25);


subplot (1, 2, 2)
hist ([Agency_NG0_4; Agency_G0_4]', 1:7);
title ('Agency: Continuous Limb, Offset = 0 /Discontinuous Limb, Offset = 0');
legend ({'Continuous Limb, Offset = 0', 'Continuous Limb, Offset = 10'})
set(gca, 'YTick', 1:25);

figure (38),
subplot (1, 2, 1)
hist ([Ownership_NG0_4; Ownership_NG10_4]', 1:7);
title ('Ownership: Continuous Limb, Offset = 0 / Continuous Limb, Offset = 10');

set(gca, 'YTick', 1:14);



subplot (1, 2, 2)
hist ([Ownership_NG0_4; Ownership_G0_4]', 1:7);
title ('Ownership: Continuous Limb, Offset = 0 /Discontinuous Limb, Offset = 0');


figure (39),
subplot (1, 2, 1)
hist([Location_NG0_2; Location_NG10_2]', 1:7);
title ('Location: Continuous Limb, Offset = 0 / Continuous Limb, Offset = 10');

ylim([0, 10]);

subplot (1, 2, 2)
hist ([Location_NG0_2; Location_G0_2]', 1:7);
title ('Location: Continuous Limb, Offset = 0 /Discontinuous Limb, Offset = 0');
ylim([0, 10]);

%%