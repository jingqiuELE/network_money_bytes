function b = bayesian(n, a, num, val)
    b = ((n*a)+num*val')/(n+sum(num));
end
