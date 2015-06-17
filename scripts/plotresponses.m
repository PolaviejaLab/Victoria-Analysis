global config_; 
results = orderresponses();
conditions = [1 2 3 4 6 8];

for i_condition = 1:numel(conditions)
    condition = conditions(i_condition);
    condition_data = results.(['condition' num2str(condition)]);
    condMatrix = condition_data;
    
    figure(1), % boxplot
    subplot(2,3, i_condition);
    boxplot(condition_data');
    ylim ([0 8]);
    set(gca, 'YTick', 1:7);
    xlim ([0 15]);
    xlabel ('Question Number');  
    if condition == 1
        title ('Continuous Limb, Offset = 0 cm');
    elseif condition == 2
        title ('Continuous Limb, Offset = 5 cm');
    elseif condition == 3
        title ('Continuous Limb, Offset = 10 cm');
    elseif condition == 4
        title ('Discontinuous Limb, Offset = 0 cm');
    elseif condition == 6
        title ('Discontinuous Limb, Offset = 5 cm');
    elseif condition == 8
        title ('Discontinuous Limb, Offset = 10 cm');
    else
        title ('Unkown Condition');
    end
    
    
    figure(2),
    subplot (2, 3, i_condition);
    responses3 = plot (condition_data, '.');
    ylim ([0 8]);
    xlim ([0 15]);
    xlabel ('Question Number');
    if condition == 1
        title ('Continuous Limb, Offset = 0 cm');
    elseif condition == 2
        title ('Continuous Limb, Offset = 5 cm');
    elseif condition == 3
        title ('Continuous Limb, Offset = 10 cm');
    elseif condition == 4
        title ('Discontinuous Limb, Offset = 0 cm');
    elseif condition == 6
        title ('Discontinuous Limb, Offset = 5 cm');
    elseif condition == 8
        title ('Discontinuous Limb, Offset = 10 cm');
    else
        title ('Unkown Condition cm');
    end
    
    
    figure (3), % scatter plot + boxplot with separated dots + boxplot.
    subplot (2, 3, i_condition);
    
    q1 = condition_data(1, :);
    q2 = condition_data(2, :);
    q3 = condition_data(3, :);
    q4 = condition_data(4, :);
    q5 = condition_data(5, :);
    q6 = condition_data(6, :);
    q7 = condition_data(7, :);
    q8 = condition_data(8, :);
    q9 = condition_data(9, :);
    q10 = condition_data(10, :);
    q11 = condition_data(11, :);
    q12 = condition_data(12, :);
    q13 = condition_data(13, :);
    q14 = condition_data(14, :);
     
    boxplot (condition_data', 'colors', 'k'); hold on
    
    
    scatter ((1-0.03*length(q1) + (1:length (q1))*0.05), q1, 'r'); hold on
    scatter ((2-0.03*length(q2) + (1:length (q2))*0.05), q2, 'r'); hold on
    scatter ((3-0.03*length(q3) + (1:length (q3))*0.05), q3, 'r'); hold on
    scatter ((4-0.03*length(q4) + (1:length (q4))*0.05), q4, 'r'); hold on
    scatter ((5-0.03*length(q5) + (1:length (q5))*0.05), q5, 'm'); hold on
    scatter ((6-0.03*length(q6) + (1:length (q6))*0.05), q6, 'm'); hold on
    scatter ((7-0.03*length(q7) + (1:length (q7))*0.05), q7, 'b'); hold on
    scatter ((8-0.03*length(q8) + (1:length (q8))*0.05), q8, 'b'); hold on
    scatter ((9-0.03*length(q9) + (1:length (q9))*0.05), q9, 'b'); hold on
    scatter ((10-0.03*length(q10) + (1:length (q10))*0.05), q10, 'b'); hold on
    scatter ((11-0.03*length(q11) + (1:length (q11))*0.05), q11, 'c'); hold on
    scatter ((12-0.03*length(q12) + (1:length (q12))*0.05), q12, 'c'); hold on
    scatter ((13-0.03*length(q13) + (1:length (q13))*0.05), q13, 'g'); hold on
    scatter ((14-0.03*length(q14) + (1:length (q14))*0.05), q14, 'g'); hold on
    
    ylim ([0 8]);
    set(gca, 'YTick', 1:7);
    xlim ([0 15]);
    set (gca, 'XTick', 1:14);
    xlabel ('Question Number');
    if condition == 1
        title ('Continuous Limb, Offset = 0 cm');
    elseif condition == 2
        title ('Continuous Limb, Offset = 5 cm');
    elseif condition == 3
        title ('Continuous Limb, Offset = 10 cm');
    elseif condition == 4
        title ('Discontinuous Limb, Offset = 0 cm');
    elseif condition == 6
        title ('Discontinuous Limb, Offset = 5 cm');
    elseif condition == 8
        title ('Discontinuous Limb, Offset = 10 cm');
    else
        title ('Unkown Condition cm');
    end

    
  
end



