function [Result1,Result2,Result3,Result4] = maths(Number1,Number2)
% This function maths takes 2 numbers as input and returns values for the
% sum, difference, product, and max of the two numbers as ouputs
% respectively Results 1-4
% Input = two numbers
% Output = sum, difference, product, max
% 
Result1 = (Number1 + Number2) 
Result2 = (Number2 - Number1) 
Result3 = (Number1 * Number2)
Result4 = max(Number2, Number1);

end