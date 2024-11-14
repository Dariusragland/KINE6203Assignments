function [maleIsoIndMeans, femaleIsoIndMeans, maleGroupIsoMean, femaleGroupIsoMean] = genderIsoCalc(Gender, Day1, Day2, Day3)
    % This function calculates individual means for each gender and also
    % the group mean for males and females.
    
    % Find the indices for males and females
    maleIndices = (Gender == 'M');
    femaleIndices = (Gender == 'F');
    
    % Calculate the individual mean isometric strength for each subject across the three days
    maleIsoIndMeans = mean([Day1(maleIndices), Day2(maleIndices), Day3(maleIndices)], 2);
    femaleIsoIndMeans = mean([Day1(femaleIndices), Day2(femaleIndices), Day3(femaleIndices)], 2);
    
    % Calculate the group means for males and females
    maleGroupIsoMean = mean(maleIsoIndMeans);
    femaleGroupIsoMean = mean(femaleIsoIndMeans);
end

