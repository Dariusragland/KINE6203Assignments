%Assignment 4: Analyzing Isometric Strength Data
%This script loads in data using the function 'importfile'

% Then processes, and analyzes isometric strength data by calculating the
% indvidual and group  means by using 2 additional functions, and then 
% exports the results into a CSV file.
% 
%  Last 2 created functions:
% 'dayComparer' which takes the subject ids and two days as inputs and
% returns a matrix with the subject IDs of the subjects who had an increase
% from the first day to the second day. The last function you will need is
% 'genderIsoCalc' which calculates individual means for each gender and also
% the group mean for males and females
%Date:  11/13/2024
%Darius Ragland

%Import Data
[SubjectID, Age, Gender, Weight, Day1, Day2, Day3] = importfile('isok_data_6803.csv'); % Using import function

% Calculate gender-specific isometric strength values
[maleIsoIndMeans, femaleIsoIndMeans, maleGroupIsoMean, femaleGroupIsoMean] = genderIsoCalc(Gender, Day1, Day2, Day3);
% Compare days and find subject IDs with increases using the day comparer
% function
day1toDay2 = dayComparer(SubjectID, Day1, Day2);
day2toDay3 = dayComparer(SubjectID, Day2, Day3);

% Normalize strength data by weight and calculate group means
normDay1mean = mean(Day1 ./ Weight);
normDay2mean = mean(Day2 ./ Weight);
normDay3mean = mean(Day3 ./ Weight);

% Ensure each variable has the same number of rows to be combined for table
femaleIsoIndMeans(13,1) =NaN;
maleGroupIsoMean(2:13,1)= NaN;
femaleGroupIsoMean(2:13,1)=NaN;
day1toDay2(13,1)=NaN;
day2toDay3(12:13,1)=NaN;
normDay1mean(2:13,1)=NaN;
normDay2mean(2:13,1)=NaN;
normDay3mean(2:13,1)=NaN;

results= table(maleIsoIndMeans,femaleIsoIndMeans, maleGroupIsoMean, femaleGroupIsoMean, ...
                     day1toDay2, day2toDay3, normDay1mean, normDay2mean, normDay3mean);
% Export to CSV
writetable(results, 'iso_results.csv');