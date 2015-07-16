function [] = plotcorrelation2 ()

[~, cube] = orderresponses();

NSubjects = size(cube,3);
NQuestions_Ownership = 4;



Ownership_NG0_4 = zeros (NSubjects,NQuestions_Ownership)';
Ownership_NG10_4 = zeros (NSubjects, NQuestions_Ownership)';
Ownership_G0_4 = zeros (NSubjects, NQuestions_Ownership)';
Ownership_G10_4 = zeros (NSubjects, NQuestions_Ownership)';

Question10_NG0 = zeros (NSubjects, 1)';
Question10_NG10 = zeros (NSubjects, 1)';
Question10_G0 = zeros (NSubjects, 1)';
Question10_G10 = zeros (NSubjects, 1)';

for i_subjects = 1:NSubjects
    
    for i_questionO = 1:NQuestions_Ownership
        answerO_NG0 = cube(i_questionO, 1, i_subjects);
        Ownership_NG0_4(i_questionO, i_subjects)= answerO_NG0;
        answerO_NG10 = cube(i_questionO, 3, i_subjects);
        Ownership_NG10_4(i_questionO, i_subjects) = answerO_NG10;
        answerO_G0 = cube(i_questionO, 4, i_subjects);
        Ownership_G0_4(i_questionO, i_subjects) = answerO_G0;
        answerO_G10 = cube (i_questionO, 6, i_subjects);
        Ownership_G10_4(i_questionO, i_subjects) = answerO_G10;
    end
    
    answer10_NG0 = cube(10, 1, i_subjects);
    Question10_NG0(i_subjects) = answer10_NG0;
    answer10_NG10 = cube (10, 3, i_subjects);
    Question10_NG10(i_subjects) = answer10_NG10;
    answer10_G0 = cube (10, 4, i_subjects);
    Question10_G0(i_subjects) = answer10_G0;
    answer10_G10 = cube (10, 6, i_subjects);
    Question10_G10(i_subjects) = answer10_G10;  
end

Question10_G0
Question10_G10
Question10_NG0
Question10_NG10

averageONG0 = mean(Ownership_NG0_4)
averageONG10 = mean(Ownership_NG10_4)
averageOG0 = mean(Ownership_G0_4)
averageOG10 = mean(Ownership_G10_4)


diff_ownership_nooffset_offset = averageONG10 - averageONG0;
diff_ownership_nogap_gap = averageOG0 - averageONG0;
diff_ownership_nogap0_gap10 = averageOG10 - averageONG0;

diff_q10_nooffset_offset = Question10_NG10 - Question10_NG0;
diff_q10_nogap0_gap10 = Question10_G0 - Question10_NG0;
diff_q10_nogap_gap = Question10_G10 - Question10_NG0;



[r1, p1] = corr(diff_ownership_nooffset_offset', diff_q10_nooffset_offset')
[r2, p2] = corr(diff_ownership_nogap_gap', diff_q10_nogap_gap')
[r3, p3] = corr(diff_ownership_nogap0_gap10', diff_q10_nogap0_gap10')




figure (41)

subplot (1, 3, 1)

scatter (diff_ownership_nooffset_offset, diff_q10_nooffset_offset, 'r', 'o')
legend ({'no-offset, offset'})

xlim([-4, 2]);
set(gca, 'XTick', -4:0.5:1.5);
ylim([-4, 2.5]);
set(gca, 'YTick', -4:0.5:2);
line([9 -4], [9 -4], 'color', [0.827451 0.827451 0.827451]);
line ([0 0],[-4 10], 'color', [0.827451 0.827451 0.827451]);
line ([-4 10],[0 0], 'color', [0.827451 0.827451 0.827451]);

xlabel ('Difference in ownership');
ylabel ('Question10');


subplot (1, 3, 2)
scatter (diff_ownership_nogap_gap, diff_q10_nogap_gap, 'g', 'o');
legend ({'no-gap, gap'})

xlim([-4, 2]);
set(gca, 'XTick', -4:0.5:1.5);
ylim([-4, 2.5]);
set(gca, 'YTick', -4:0.5:2);
line([9 -4], [9 -4], 'color', [0.827451 0.827451 0.827451]);
line ([0 0],[-4 10], 'color', [0.827451 0.827451 0.827451]);
line ([-4 10],[0 0], 'color', [0.827451 0.827451 0.827451]);

xlabel ('Difference in ownership');
ylabel ('Question10');

subplot (1, 3, 3)
scatter (diff_ownership_nogap0_gap10, diff_q10_nogap0_gap10, 'k', 'o');
legend ({'no gap & no offset, gap & offset'});


xlim([-4, 2]);
set(gca, 'XTick', -4:0.5:1.5);
ylim([-4, 2.5]);
set(gca, 'YTick', -4:0.5:2);
line([9 -4], [9 -4], 'color', [0.827451 0.827451 0.827451]);
line ([0 0],[-4 10], 'color', [0.827451 0.827451 0.827451]);
line ([-4 10],[0 0], 'color', [0.827451 0.827451 0.827451]);

xlabel ('Difference in ownership');
ylabel ('Question10');



end 