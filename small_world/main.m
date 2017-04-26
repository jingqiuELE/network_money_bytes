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
p = 0.3;

% Initial state
I = [1, 0, 0, 0, 0, 0, 0, 0];

% Iteration steps
itimes = 10;

N = contagion(I, G, p, itimes)

% Run the contagion with node 3 initialized as state-1 and the other nodes initialized 
% at state-0
I = [0, 0, 1, 0, 0, 0, 0, 0];

N = contagion(I, G, p, itimes)
