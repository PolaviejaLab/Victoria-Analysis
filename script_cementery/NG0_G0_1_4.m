[~, cube] = orderresponses();

NSubjects = size(cube,3);
NQuestions = 4;

nogap0 = zeros(1, NSubjects*NQuestions);
nogap10 = zeros(1, NSubjects*NQuestions);

for i_subject = 1:NSubjects
    for i_question = 1:NQuestions
    answer1 = cube(i_question, 1, i_subject);
    nogap0(i_subject*i_question) = answer1;
    
    answer2 = cube(i_question, 4, i_subject);
    nogap10(i_subject*i_question) = answer2;
    end
end

figure (16),
plotcorrelations (nogap0, nogap10);
xlabel ('Continuous Limb, Offset = 0');
ylabel ('Discontinuous Limb, Offset = 10');


