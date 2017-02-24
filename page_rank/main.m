%% Networks Money and Bytes, Homework 2 

% Page Rank algorithm

G = [0,    1, 0,   0, 0;
     1,    0, 0,   0, 0;
     1/3,  0, 1/3, 0, 1/3;
     0,    0, 1/2, 0, 1/2;
     0,    0, 0,   0, 0];

s = [0, 0, 0, 0, 1];
g = [1, 1, 1, 1, 1];
E = ones(5, 5);
p = 1/5;
pi = p*g;

for theta = [0.1, 0.3, 0.5, 0.85]
    for i=1:100
        pi = pi*(theta*(G + p*s'*g) + (1-theta)*p*E);
    end
    pi
end
