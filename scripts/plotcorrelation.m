[~, cube] = orderresponses();

NSubjects = size(cube,3);
NQuestions_Agency = 4;
NQuestions_Ownership = 4;
NQuestions_Location = 2;

Ownership_NG0_4 = zeros (NSubjects,NQuestions_Ownership)';
Ownership_NG10_4 = zeros (NSubjects, NQuestions_Ownership)';
Ownership_G0_4 = zeros (NSubjects, NQuestions_Ownership)';
Ownership_G10_4 = zeros (NSubjects, NQuestions_Ownership)';

Location_NG0_2 = zeros (NSubjects, NQuestions_Location)';
Location_NG10_2 = zeros (NSubjects, NQuestions_Location)';
Location_G0_2 = zeros (NSubjects, NQuestions_Location)';
Location_G10_2 = zeros (NSubjects, NQuestions_Location)';

for i_subjects = 1:NSubjects
    
    for i_questionO = 1:NQuestions_Ownership
        answer4 = cube(i_questionO, 1, i_subjects);
        Ownership_NG0_4(i_questionO, i_subjects)= answer4;
        answer5 = cube(i_questionO, 3, i_subjects);
        Ownership_NG10_4(i_questionO, i_subjects) = answer5;
        answer6 = cube(i_questionO, 4, i_subjects);
        Ownership_G0_4(i_questionO, i_subjects) = answer6;
        answer10 = cube (i_questionO, 6, i_subjects);
        Ownership_G10_4(i_questionO, i_subjects) = answer10;
    end
    
  
    for i_questionL = 1:NQuestions_Location
        answer7 = cube(i_questionL+12, 1, i_subjects);
        Location_NG0_2(i_questionL, i_subjects)= answer7;
        answer8 = cube(i_questionL+12, 3, i_subjects);
        Location_NG10_2(i_questionL, i_subjects) = answer8;
        answer9 = cube(i_questionL+12, 4, i_subjects);
        Location_G0_2(i_questionL, i_subjects) = answer9;
        answer11 = cube(i_questionL+12, 6, i_subjects);
        Location_G10_2(i_questionL, i_subjects) = answer11;
    end
end

averageONG0 = mean(Ownership_NG0_4);
averageONG10 = mean(Ownership_NG10_4);
averageOG0 = mean(Ownership_G0_4);
averageOG10 = mean(Ownership_G10_4);

averageLNG0 = mean(Location_NG0_2);
averageLNG10 = mean(Location_NG10_2);
averageLG0 = mean(Location_G0_2);
averageLG10 = mean(Location_G10_2);

diff_ownership_nooffset_offset = averageONG10 - averageONG0;
diff_ownership_nogap_gap = averageOG0 - averageONG0;
diff_ownership_nogap0_gap10 = averageOG10 - averageONG0;

diff_location_nooffset_offset = averageLNG10 - averageLNG0;
diff_location_nogap0_gap10 = averageLG10 - averageLNG0;
diff_location_nogap_gap = averageLG0 - averageLNG0;



[r1, p1] = corr(diff_ownership_nooffset_offset', diff_location_nooffset_offset')
[r2, p2] = corr(diff_ownership_nogap_gap', diff_location_nogap_gap')
[r3, p3] = corr(diff_ownership_nogap0_gap10', diff_location_nogap0_gap10')




figure (40)

subplot (1, 3, 1)

scatter (diff_ownership_nooffset_offset, diff_location_nooffset_offset, 'r', 'o')
legend ({'no-offset, offset'})

xlim([-3, 2]);
set(gca, 'XTick', -2.5:0.5:1.5);
ylim([-3, 2.5]);
set(gca, 'YTick', -2.5:0.5:2);
line([9 -3], [9 -3], 'color', [0.827451 0.827451 0.827451]);
line ([0 0],[-3 10], 'color', [0.827451 0.827451 0.827451]);
line ([-3 10],[0 0], 'color', [0.827451 0.827451 0.827451]);

xlabel ('Difference in ownership');
ylabel ('Difference in location');


subplot (1, 3, 2)
scatter (diff_ownership_nogap_gap, diff_location_nogap_gap, 'g', 'o');
legend ({'no-gap, gap'})

xlim([-3, 2]);
set(gca, 'XTick', -2.5:0.5:1.5);
ylim([-3, 2.5]);
set(gca, 'YTick', -2.5:0.5:2);
line([9 -3], [9 -3], 'color', [0.827451 0.827451 0.827451]);
line ([0 0],[-3 10], 'color', [0.827451 0.827451 0.827451]);
line ([-3 10],[0 0], 'color', [0.827451 0.827451 0.827451]);

xlabel ('Difference in ownership');
ylabel ('Difference in location');

subplot (1, 3, 3)
scatter (diff_ownership_nogap0_gap10, diff_location_nogap0_gap10, 'k', 'o');
legend ({'no gap & no offset, gap & offset'});


xlim([-3, 2]);
set(gca, 'XTick', -2.5:0.5:1.5);
ylim([-3, 2.5]);
set(gca, 'YTick', -2.5:0.5:2);
line([9 -3], [9 -3], 'color', [0.827451 0.827451 0.827451]);
line ([0 0],[-3 10], 'color', [0.827451 0.827451 0.827451]);
line ([-3 10],[0 0], 'color', [0.827451 0.827451 0.827451]);

xlabel ('Difference in ownership');
ylabel ('Difference in location');



% scatter (Agency_NG0_4, Agency_NG10_4, 'r', 'o'); hold on
% scatter (Ownership_NG0_4, Ownership_NG10_4, 'b', 'o'); hold on
% scatter (Location_NG0_2, Location_NG10_2, 'g', 'o');

% xlabel ('Continuous Limb, Offset = 0');
% ylabel ('Continuous Limb, Offset = 10');

% legend({'Agency', 'Ownership', 'Location'});