%% Networks Money and Bytes, Homework 5

%% Initialization
clear; close all; clc

%% ===================Part 1: contagion model ==============

% Graph description matrix
G = [1, 1, 1, 0, 0, 0, 1, 0;
     1, 1, 0, 1, 0, 0, 0, 1;
     1, 0, 1, 1, 1, 1, 0, 0;
     0, 1, 1, 1, 1, 1, 0, 0;
     0, 0, 1, 1, 1, 1, 1, 0;
     0, 0, 1, 1, 1, 1, 0, 1;
     1, 0, 0, 0, 1, 0, 1, 1;
     0, 1, 0, 0, 0, 1, 1, 1];

% Percentage of neighbours for a node to flip
P = 0.3;
T = (size(G, 1) - 1) * P * ones(1, size(G, 1))

% Initial state
I = [1, 0, 0, 0, 0, 0, 0, 0];

% Iteration steps
itimes = 10;

N = I;
for i=1 : itimes
    F = (N * G) >= T
    N(F) = 1
end
