function increasedSubjects = dayComparer(subjectID, day1, day2)
    % Find indices where day2 strength is greater than day1 strength
    increasedIdx = day2 > day1;
    increasedSubjects = subjectID(increasedIdx); % Return subject IDs with increases
end
