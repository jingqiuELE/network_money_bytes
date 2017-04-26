%% Networks Money and Bytes, Homework 1

% dpc control

%% Initialization
clear; close all; clc

%% ===================Part 1: Iteration of DPC control ==============

% gain matrix
G = [1,   0.2,  0.1; 
     0.2, 1,    0.2;
     0.2, 0.3,   1 ];
T = diag(G);
noise = 0.1;
% target SIR
r = [2, 2, 2.5];
% Iteration steps
itimes = 10;
init_p = [1, 1, 1];

[sir_history, p_history] = dpc(G, init_p, r, noise, itimes);
sir_history
p_history

hold on;
plot(sir_history(:,1), 'r*-');
plot(sir_history(:,2), 'g*-');
plot(sir_history(:,3), 'b*-');
plot(p_history(:,1), 'r:-');
plot(p_history(:,2), 'g:-');
plot(p_history(:,3), 'b:-');
hold off;

new_G = [G, [0.1, 0.1, 0.1]'];
new_G = [new_G; [0.1, 0.1, 0.1, 1]];
new_r = [r, 1];

init_p = p_history(itimes,:);
init_p = [init_p, 1];
[new_sir_history, new_p_history] = dpc(new_G, init_p, new_r, noise, itimes);

X = [itimes+1:itimes*2];

figure;
hold on;
plot([sir_history(:,1);new_sir_history(:,1)], 'r*-');
plot([sir_history(:,2);new_sir_history(:,2)], 'g*-');
plot([sir_history(:,3);new_sir_history(:,3)], 'b*-');
plot(X, new_sir_history(:,4), 'm*-');
plot([p_history(:,1);new_p_history(:,1)], 'r:-');
plot([p_history(:,2);new_p_history(:,2)], 'g:-');
plot([p_history(:,3);new_p_history(:,3)], 'b:-');
plot(X, new_p_history(:,4), 'm:-');

hold off;



