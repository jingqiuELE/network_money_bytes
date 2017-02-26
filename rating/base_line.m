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
R_orig = R;
R = R'(:);
valid_data_index = find(R==1);
non_valid_data_index = find(R==0);

R.*Y;
sum(R.*Y);
Y_average = sum(R.*Y)/sum(R);
C = R.*(Y.-Y_average);

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

b = pinv(A_valid'*A_valid)*(A_valid'*C_valid);
Y_predic = (A*b).+Y_average;

% Put the predictions into range [1,5]
upper_bound = find(Y_predic>5);
Y_predic(upper_bound) = 5;

lower_bound = find(Y_predic<1);
Y_predic(lower_bound) = 1;

Y_final = (reshape(Y_predic, num_movies, num_users))'
error_final = sum(R.*((Y_predic - Y).^2))


% Neighbourhood prediction
Error = Y - Y_predic;
% Set the error of non valid data entry to be 0
Error(non_valid_data_index) = 0 
Error = (reshape(Error, num_movies, num_users))'

for i = 1:num_movies
    for j = 1:num_movies
        if i == j 
            distance(i,j) = 0;
        else 
            left_row = find(R_orig(:, i) != 0);
            right_row = find(R_orig(:, j) != 0); 
            common_row = intersect(left_row, right_row);
            distance(i,j) = calculateDistance(Error(common_row, i), Error(common_row, j));
        end
    end
end

distance

L = [];
for i = 1:num_movies
   [s, index] = sort(abs(distance(:, i)));
   L(i, :) = index;
end
L
L = L(:, end-1:end)

E_neighbour = [];
% Y_n = Y_predic + repmat(E_neighbour, num_users, 1). 
for i=1:num_users
    for j=1:num_movies
        effective_d = distance(j, L(j, :));
        effective_e = Error(i, L(j, :));
        E_neighbour(i,j) = sum(effective_d.*effective_e)/sum(abs(effective_d));
    end
end
E_neighbour
Y_N = Y_final + E_neighbour;

% Put the predictions into range [1,5]
upper_bound = find(Y_N>5);
Y_N(upper_bound) = 5;

lower_bound = find(Y_N<1);
Y_N(lower_bound) = 1

Y_N_v = Y_N'(:);
error_N = sum(R.*((Y_N_v -Y).^2))
