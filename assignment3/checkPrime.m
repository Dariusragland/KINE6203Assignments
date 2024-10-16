function isPrime = checkPrime(num)
    % The checkPrime function checks if a number is prime. In order to be
    % prime the number has to be greater than zero and has to be divisible by
    % itself and 1 with no remainders. 
    % Input: num - the number to check
    % Output: isPrime - logical value (true if prime, false if not)

    % Check if the number is less than or equal to 1
    if num <= 1
        isPrime = false;
        return;
    end

    % Loop through all potential divisors from 2 to num-1
    for i = 2:(num - 1)
        if mod(num, i) == 0 
            isPrime = false;  % Number is divisible by i, so it's not prime
            return;
        end
    end

    % If no divisors were found, the number is prime
    isPrime = true;
end
