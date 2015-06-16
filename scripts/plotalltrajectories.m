function [] = plotalltrajectories ()


subjects = dir ('Subject*');


for i_subjects = 1: length(subjects)
    currentFolder = cd(subjects(i_subjects).name);
    fprinf (currentFolder.name);
    currentFolder = cd (../currentFolder);
    
end 



end 