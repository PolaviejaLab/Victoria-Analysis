% GETORDERRESPONSES Takes the questionnaire responses 

function [vOrder] = getResponseOrder (protocolFile)

NoiseLevel = table2array(protocolFile(:, 5))';
KnifeOffset = table2array(protocolFile(:, 6))';

vOrder = zeros(1, 3);

for i_order = 1:3
    if(KnifeOffset(i_order) == 0)
        if (NoiseLevel(i_order) == 0)
            vOrder(i_order) = 1;
        elseif (NoiseLevel(i_order) == 1)
            vOrder(i_order) = 2;
        end
    elseif(KnifeOffset(i_order) == 1)
        if (NoiseLevel(i_order) == 0)
            vOrder(i_order) = 3;
        end 
    end 
end 

end