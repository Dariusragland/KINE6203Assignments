function [totalAmount] = calcTotal(quarters,dimes,nickels,pennies)
%The function calcTotal will calculate the total amount of money from quarters,
%dimes, nickels, and pennies. You will input the number of each coin in the
%order of the variables listed as inputs. 
%Inputs = 4
%Outputs = 1
%Developed on PC

totalAmount = (quarters * 0.25) + (dimes * 0.10) + (nickels * 0.05) + (pennies * 0.01);
end
