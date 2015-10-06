function [] = meas_indvar (x, y)

xlim ([0.5 7.5]);
ylim ([0.5 7.5]);

scatter (x, y);
coeff = polyfit (x, y, 1)
xFitting = 0:8;
yFitted = polyval(coeff, xFitting);
hold on;
plot(xFitting, yFitted);

end