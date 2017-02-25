%% Networks Money and Bytes, Homework 3 

% Base line predictor

% Y is the Raw data matrix of ratings from users:
% R is represents if a user has rated a certain movie. 
Y = [5,  0, 5, 4;
     0,  1, 1, 4;
     4,  1, 2, 4;
     3,  4, 0, 3;
     1,  5, 3, 0];

R = [1, 0, 1, 1;
     0, 1, 1, 1;
     1, 1, 1, 1;
     1, 1, 0, 1;
     1, 1, 1, 0];

num_users = 5;
num_movies = 4;
num_features = num_users + num_movies;

% Compute the baseline predictor using raw data matrix of ratings:
% Fomula: b = inv(A'*A)*(A'C), whereas C = Y - Y_average,
% b = [b_1, b_2, b_3, b_4, b_5, b_a, b_b, b_c, b_d];
Y = Y'(:);
R = R'(:);
valid_data_index = find(R==1)

R.*Y
sum(R.*Y)
Y_average = sum(R.*Y)/sum(R)
C = R.*(Y.-Y_average)

one = [1;
       1;
       1;
       1;];

zero = [0;
        0;
        0; 
        0];
U_1 = [one, zero, zero, zero, zero];
U_2 = [zero, one, zero, zero, zero];
U_3 = [zero, zero, one, zero, zero];
U_4 = [zero, zero, zero, one, zero];
U_5 = [zero, zero, zero, zero, one];

M = [1, 0, 0, 0;
     0, 1, 0, 0;
     0, 0, 1, 0;
     0, 0, 0, 1];

A = [ U_1, M;
      U_2, M;
      U_3, M;
      U_4, M;
      U_5, M;];

% Remove non-valid entry from A and C
A_valid = A(valid_data_index, :);
C_valid = C(valid_data_index, :);

b = pinv(A_valid'*A_valid)*(A_valid'*C_valid)
Y_predic = (A*b).+Y_average;
Y_final = (reshape(Y_predic, num_movies, num_users))'
Y_answer = [4.4545, 4.6364, 4.2727, 5.0000,
            1.7273, 1.9091, 1.5455, 2.5455,
            2.5455, 2.7273, 2.3636, 3.3636,
            3.0000, 3.1818, 2.8182, 3.8182,
            3.0000, 3.1818, 2.8182, 3.8182]
error_final = sum(R.*((Y_predic - Y).^2))
Y_answer = Y_answer'(:)
error_answer = sum(R.*((Y_answer - Y).^2))

