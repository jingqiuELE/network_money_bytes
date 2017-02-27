%% Networks Money and Bytes, Homework 3 

% Baeysian Ranking 

n = 50;
a = 4;

num_rating_cannon = [3];
val_rating_cannon = [5];

num_rating_hp = [4, 2,   2, 1,   1];
val_rating_hp = [5, 4.5, 4, 3.5, 3];

average_rating_cannon = average(num_rating_cannon, val_rating_cannon)
average_rating_hp = average(num_rating_hp, val_rating_hp)

bayesian_rating_cannon = bayesian(n, a, num_rating_cannon, val_rating_cannon)
bayesian_rating_hp = bayesian(n, a, num_rating_hp, val_rating_hp)

