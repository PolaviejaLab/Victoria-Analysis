function [] = nogap0_nogap10 (q_ownership, q_agency, q_location)

[O_NG0, A_NG0, L_NG0] = getvectors_NG0 (q_ownership, q_agency, q_location);
[O_NG10, A_NG10, L_NG10] = getvectors_NG10 (q_ownership, q_agency, q_location);

subplot (2, 2, 1) % ownership

scatter (O_NG0, O_NG10, 'r', 'o'); 
p = polyfit(O_NG0, O_NG10, 1);
yfit = polyval(p, O_NG0);
hold on
plot (O_NG0, yfit, '--k'); 
% format of the plot
line([9 0], [9 0], 'color', [0.827451 0.827451 0.827451]);
title ('Ownership');
xlabel ('Continuous Limb, Offset = 0');
ylabel ('Continuous Limb, Offset = 10');
xlim([0.5, 7.5]);
set(gca, 'XTick', 1:7);
ylim([0.5, 7.5]);
set(gca, 'YTick', 1:7);


subplot (2, 2, 2) % agency

scatter (A_NG0, A_NG10, 'b', 'o');
p = polyfit (A_NG0, A_NG10, 1);
yfit = polyval(p, A_NG0);
hold on
plot (A_NG0, yfit, '--k');
% format the plot
line([9 0], [9 0], 'color', [0.827451 0.827451 0.827451]);
title ('Agency');
xlabel ('Continuous Limb, Offset = 0');
ylabel ('Continuous Limb, Offset = 10');
xlim([0.5, 7.5]);
set(gca, 'XTick', 1:7);
ylim([0.5, 7.5]);
set(gca, 'YTick', 1:7);


subplot (2, 2, 3) % location

scatter (L_NG0, L_NG10, 'g', 'o');
p = polyfit(L_NG0, L_NG10, 1);
yfit = polyval(p, L_NG0);
hold on 
plot (L_NG0, yfit, '--k');
% format the plot
line([9 0], [9 0], 'color', [0.827451 0.827451 0.827451]);
title ('Location');
xlabel ('Continuous Limb, Offset = 0');
ylabel ('Continuous Limb, Offset = 10');
xlim([0.5, 7.5]);
set(gca, 'XTick', 1:7);
ylim([0.5, 7.5]);
set(gca, 'YTick', 1:7);

end 