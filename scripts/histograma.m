%{
Write a function with two input arguments: A vector with
the data, and a scalar with the number of bins. It must generate the histogram of these
data, plotting it as a bar graph (use instruction “bar”). Also, it must have two output
vectors. The first one must contain the number of data falling in each bin, and the
second one must contain the centers of the bins. Bins must be equispaced, and must
contain the full range of data (that is, the lower extreme of the first bin must match
the minimum datapoint, and the higher extreme of the last bin must match the
maximum datapoint). Each bin must contain data that are higher than its lower
extreme, and lower or equal than its higher extreme (except for the first bin, which
must also contain data equal to its lower extreme). This function is similar to Matlab’s
function hist, and you cannot use hist for this exercise. You may create the data vector
with instruction randn (thus, the histogram will be a nice gaussian).
%}

function [number, center] = histograma (dades, bins)

edge = min(dades);
number = zeros(1,bins);
center = zeros(1,bins);
division = (max(dades) - min(dades))/bins;


for i = 1:bins;
    if i == 1
        number(i) = number(i) + 1;
    end
    for j = 1:length(dades)
        if dades(j) > edge && dades(j) <= (edge + division)
                number(i) = number(i) + 1;
        end
    end
    center(i) = ((edge + division) + edge)/2;
edge = edge + division;
end

%{

for i = 1:length(dades)

    while bin <= bins
        if dades(i) > edge && dades(i) < (edge + division)
           number(i) = number(i) + 1;
        else
            bin = bin + 1;
            edge = edge + division;
        end
    end
end

%}

%{

       if dades(i) > barra && dades (i) < (barra + division)
           number(i) = ;
       else
           barra = barra + division;
   end
%}