function [stringLength,firstLet, lastLet] = strngFun(stringValue)
%The function strngFun takes a string value as an input and returns the
%length of the string as well as the first and last character as outputs. 
% Inputs: 1
% Outputs: 3

stringLength = length(stringValue); %Get the length of the string
firstLet = stringValue(1); % Get the first letter of the string
lastLet = stringValue(end); % Get the last letter of the string
fprintf ("The string length is %d/n",stringLength) %Print the length of string
fprintf("The first letter is %s,n", firstLet) %Print first letter of string
fprintf("The last letter is %s/n", lastLet) %Print last letter of string
end