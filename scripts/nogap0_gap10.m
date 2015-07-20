function [] = nogap0_gap10 (q_ownership, q_agency, q_location)

[O_NG0, A_NG0, L_NG0] = getvectors_NG0 (q_ownership, q_agency, q_location);
[O_G10, A_G10, L_G10] = getvectors_G10 (q_ownership, q_agency, q_location);

setup_axes(1) % ownership

scatter (O_NG0, O_G10, 'r', 'o'); 
p = polyfit(O_NG0, O_G10, 1);
yfit = polyval(p, O_NG0);
plot (O_NG0, yfit, '--k'); 
% format of the plot
title ('Ownership');
xlabel ('Continuous Limb, Offset = 0');
ylabel ('Discontinuous Limb, Offset = 10');


setup_axes(2);
scatter (A_NG0, A_G10, 'b', 'o');
p = polyfit (A_NG0, A_G10, 1);
yfit = polyval(p, A_NG0);
plot (A_NG0, yfit, '--k');
% format the plot

title ('Agency');
xlabel ('Continuous Limb, Offset = 0');
ylabel ('Discontinuous Limb, Offset = 10');



setup_axes(3) % location
scatter (L_NG0, L_G10, 'g', 'o');
p = polyfit(L_NG0, L_G10, 1);
yfit = polyval(p, L_NG0);
plot (L_NG0, yfit, '--k');
title ('Location');
xlabel ('Continuous Limb, Offset = 0');
ylabel ('Discontinuous Limb, Offset = 10');


    function setup_axes(nr)
        subplot(2, 2, nr);
        hold on;
        
        line([9 0], [9 0], 'color', [0.827451 0.827451 0.827451]);
        xlim([0.5, 7.5]);
        set(gca, 'XTick', 1:7);
        ylim([0.5, 7.5]);
        set(gca, 'YTick', 1:7);
    end
end 