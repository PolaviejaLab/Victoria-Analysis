% AGOWHISTOGRAMS creates the histograms of the responses for each condtion
% to the subjective questionnaires. 

[~, cube] = orderresponses ();

% define the questions
owQuestions = 1:4;
agQuestions = 7:9;

% cubes for ownership and agency
owCube = cube(owQuestions, :, :);
agCube = cube(agQuestions, :, :);


%% Matrices for each condition

owMatrix_c1 = squeeze(cube(owQuestions, 1, :));
% owMatrix_c2 = squeeze(cube(owQuestions, 2, :));
owMatrix_c3 = squeeze(cube(owQuestions, 3, :));
owMatrix_c4 = squeeze(cube(owQuestions, 4, :));
% owMatrix_c5 = squeeze(cube(owQuestions, 5, :));
owMatrix_c6 = squeeze(cube(owQuestions, 6, :));

agMatrix_c1 = squeeze(cube(agQuestions, 1, :));
% agMatrix_c2 = squeeze(cube(agQuestions, 2, :));
agMatrix_c3 = squeeze(cube(agQuestions, 3, :));
agMatrix_c4 = squeeze(cube(agQuestions, 4, :));
% agMatrix_c5 = squeeze(cube(agQuestions, 5, :));
agMatrix_c6 = squeeze(cube(agQuestions, 6, :));



%% Remove the outliers
agMatrix_cc4 = agMatrix_c4;
agMatrix_cc4(agMatrix_cc4 == 2) = [];

%% Plot the histograms

figure, 
hist(owMatrix_c1(:), 1:7);
title('Ownership - Continuous Limb, Offset = 0 cm');
% figure, 
% hist(owMatrix_c2(:), 1:7);
% title('Ownership - Continuous Limb, Offset = 5 cm');
figure, 
hist(owMatrix_c3(:), 1:7);
title('Ownership - Continuous Limb, Offset = 10 cm');
figure, 
hist(owMatrix_c4(:), 1:7);
title('Ownership - Discontinuous Limb, Offset = 0 cm');
% figure,
% hist(owMatrix_c5(:), 1:7);
% title('Ownership - Discontinuous Limb, Offset = 5 cm');
figure, 
hist(owMatrix_c6(:), 1:7);
title('Ownership - Discontinuous Limb, Offset = 10 cm');


figure, 
hist(agMatrix_c1(:), 1:7);
title('Agency - Continuous Limb, Offset = 0 cm');
% figure, 
% hist(agMatrix_c2(:), 1:7);
% title('Agency - Continuous Limb, Offset = 5 cm');
figure, 
hist(agMatrix_c3(:), 1:7);
title('Agency - Continuous Limb, Offset = 10 cm');
figure, 
hist(agMatrix_c4(:), 1:7);
title('Agency - Discontinuous Limb, Offset = 0 cm');
% figure,
% hist(agMatrix_c5(:), 1:7);
% title('Agency - Discontinuous Limb, Offset = 5 cm');
figure, 
hist(agMatrix_c6(:), 1:7);
title('Agency - Discontinuous Limb, Offset = 10 cm');

figure,
hist(agMatrix_cc4(:), 1:7);
title('Agency - Discontinuous Limb, Offset = 0 cm - Removed outlier');


%% dirty script

% 
% ownervector16 = [ownervect_c1, ownervect_c6];
% ownervector13 = [ownervect_c1, ownervect_c3];
% ownervector14 = [ownervect_c1, ownervect_c4];
% ownervector46 = [ownervect_c4, ownervect_c6];
% 
% agvector13 = [agvect_c1, agvect_c3];
% agvector14 = [agvect_c1, agvect_c4];
% agvector16 = [agvect_c1, agvect_c6];
% agvector46 = [agvect_c4, agvect_c6];
% 
% mat_analysis=[ownervector13;ownervector14;ownervector16;ownervector46];
% mat_analysis2=[agvector13;agvector14;agvector16;agvector46];
% 
% agvectorcc14 = [agvect_c1, agvect_cc4];
% agvectorcc46 = [agvect_cc4, agvect_c6];
% 
% vector_res = zeros(4, 10000);
% vector_res2 = zeros(4, 10000);
% vector_res3 = zeros (1, 10000);
% vector_res4 = zeros (1, 10000);
% 
% meancc4 = mean(agvect_cc4);
% 
% vector_com=repmat([0.4605;0.7632;0.4737;0.0132],1,10000);
% vector_com2=repmat([0.0701;0.4035;0.0175;0.0526],1,10000);
% 
% for i = 1:10000
%     ind_rand=randperm(152);
%     ind_rand2=randperm(114);
%     ind_rand3=randperm(113);
%     for j=1:4
%     permvect = mat_analysis(j,ind_rand);
%     permvect2 = mat_analysis2(j,ind_rand2);
%     vector_res(j,i) = abs(mean(permvect(1:76)) - mean(permvect(77:152)));
%     vector_res2(j,i) = abs(mean(permvect2(1:57)) - mean(permvect2(58:114)));
%     end
%     permvect3 = agvectorcc14(ind_rand3);
%     permvect4 = agvectorcc46(ind_rand3);
%     vector_res3(i) = abs(mean(permvect3(1:56))- mean(permvect3(57:113)));
%     vector_res4(i) = abs(mean(permvect4(1:56))- mean(permvect4(57:113)));
% end 
% 
% %%
% figure(13)
% hist(vector_res(1,:),100)
% figure(14)
% hist(vector_res(4,:),100)
% figure(15)
% plot(sort(abs(vector_res(4,:))),(1:length(vector_res(3,:))))
% 
% %%
% figure(16)
% scatter(cube(1,1,:),cube(2,1,:))
% coeffs = polyfit(cube(1,1,:), cube(2, 1, :), 1);
% xFitting = 0:8;
% yFitted = polyval(coeffs, xFitting);
% hold on;
% plot(xFitting, yFitted);
% 
% figure(17)
% scatter(cube(1,1,:),cube(3,1,:));
% coeffs = polyfit(cube(1,1,:), cube(3, 1, :), 1);
% xFitting = 0:8;
% yFitted = polyval(coeffs, xFitting);
% hold on;
% plot(xFitting, yFitted);
% 
% figure(18)
% scatter(cube(1, 1,:), cube(4,1,:));
% coeffs = polyfit(cube(1,1,:), cube(4, 1, :), 1);
% xFitting = 0:8;
% yFitted = polyval(coeffs, xFitting);
% hold on;
% plot(xFitting, yFitted);
% 
% %%
% pvals=sum(vector_res>=vector_com,2)/10000;
% pvals2=sum(vector_res2>=vector_com2,2)/10000;
% pvals3=sum(vector_res3>=0.0961)/10000;
% pvals4=sum(vector_res4>=0.0786)/10000;
% 
% %%
% 
% % comparo16 = sum (vector_res > 0.5);
% % isito16 = comparo16/10000;
% % 
% % % difference 1-3
% % for i = 1:10000
% %     permvect = ownervector13(randperm(152));
% %     vector_res(i) = abs(mean(permvect(1:76)) - mean(permvect(77:152)));
% %     
% % end 
% % 
% % comparo13 = sum (vector_res > 0.8);
% % isito13 = comparo13/10000;
% % 
% % % difference 1-4
% % for i = 1:10000
% %     permvect = ownervector14(randperm(152));
% %     vector_res(i) = abs(mean(permvect(1:76)) - mean(permvect(77:152)));
% % end 
% % 
% % comparo14 = sum (vector_res > 0.5);
% % isito14 = comparo14/10000;
% % 
% % 
% % 
% % %%%%% agency
% 
% % difference 1-6
% 
% 
% for i = 1:10000
%     permvect = agvector16(randperm(114));
%     vector_res(i) = abs(mean(permvect(1:57)) - mean(permvect(58:114)));
% end 
% 
% compara16 = sum (vector_res > 0.0);
% isita16 = compara16/10000;
% 
% % difference 1-3
% agvector13 = [agvect1, agvect3];
% 
% for i = 1:10000
%     permvect = agvector13(randperm(114));
%     vector_res(i) = abs(mean(permvect(1:57)) - mean(permvect(58:114)));
% end 
% 
% compara13 = sum (vector_res > 0.4);
% isita13 = compara13/10000;
% 
% % difference 1-4
% agvector14 = [agvect1, agvect4];
% 
% for i = 1:10000
%     permvect = agvector14(randperm(114));
%     vector_res(i) = abs(mean(permvect(1:57)) - mean(permvect(58:114)));
% end 
% 
% compara14 = sum (vector_res > 0.1);
% isita14 = compara14/10000;
% 


