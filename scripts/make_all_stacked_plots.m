figure (6),
subplot(2, 3, 1); plot_diverging_stacked_bar(results.condition1);
title ('Continuous Limb, Offset = 0 cm');
set (gca, 'YTick', 1:14);
subplot(2, 3, 2); plot_diverging_stacked_bar(results.condition2);
title ('Continuous Limb, Offset = 5 cm');
set (gca, 'YTick', 1:14);
subplot(2, 3, 3); plot_diverging_stacked_bar(results.condition3);
title ('Continuous Limb, Offset = 10 cm');
set (gca, 'YTick', 1:14);
subplot(2, 3, 4); plot_diverging_stacked_bar(results.condition4);
title ('Discontinuous Limb, Offset = 0 cm');
set (gca, 'YTick', 1:14);
subplot(2, 3, 5); plot_diverging_stacked_bar(results.condition6);
title ('Discontinuous Limb, Offset = 5 cm');
set (gca, 'YTick', 1:14);
subplot(2, 3, 6); plot_diverging_stacked_bar(results.condition8);
title ('Discontinuous Limb, Offset = 10 cm');
set (gca, 'YTick', 1:14);