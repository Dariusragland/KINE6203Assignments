function isValid = Triangle(sides)
    % This function "Triangle" is to check if the input array represents a 
    % valid triangle
    % Input: sides - a 3-element array [a, b, c]
    % Output: isValid - logical value (1 if valid, 0 if not)

    % Extract the sides
    a = sides(1);
    b = sides(2);
    c = sides(3);
    
    % Apply the triangle inequality theorem
    if (a + b > c) && (a + c > b) && (b + c > a)
        isValid = 1; % Return true if all conditions are met
    else
        isValid = 0; % Return false otherwise
    end
end
