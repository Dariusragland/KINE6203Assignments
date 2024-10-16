function [result] = WooHah(Num1,Num2)
%The function WooHah takes 2 numbers as inputs and returns Woo if their sum
%is even and returns Hah if their sum is odd. 

total= Num1 + Num2;
if mod(total,2) == 0 
    result = 'Woo';
else
    result = 'Hah';
end