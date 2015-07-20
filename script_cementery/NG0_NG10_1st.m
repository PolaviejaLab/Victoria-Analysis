[~, cube] = orderresponses();

NSubjects = size(cube,3);

nogap0 = zeros(1, NSubjects);
nogap10 = zeros(1, NSubjects);

for i_subject = 1:NSubjects
    answer1 = cube(1, 1, i_subject);
    nogap0(i_subject) = answer1;
    
    answer2 = cube(1, 3, i_subject);
    nogap10(i_subject) = answer2;
end

figure (13),
plotcorrelations (nogap0, nogap10);
xlabel ('Continuous Limb, Offset = 0');
ylabel ('Continuous Limb, Offset = 10');


