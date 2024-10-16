function Counter(a, b)
    % Counter - This function displays a count from the lower number to the higher number.
    %
    % Inputs:
    %   a - The first number.
    %   b - The second number.
    %
    % Output:
    %   None - The function prints the numbers from the lower value to the higher value.
    
    % Loop from the smaller number (min) to the larger number (max)
    for i = min(a,b):max(a,b)
        disp(i);  % Display the current number
    end
end
