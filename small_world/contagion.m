%% contagion calculates the graph after specified iteration times.
%% -------------Parameter----------------
%% I: Initial state
%% G: Graph
%% p: Percentage of neighbours for a node to flip
%% itimes: Iteration times
%% -------------Return value-------------
%% N: Updated state after itimes iteration.
%% --------------------------------------

function [N] = contagion(I, G, p, itimes)
    T = (sum(G, 1) .- 1) * p;

    N = I;
    for i=1 : itimes
        F = (N * G) >= T;
        N(F) = 1;
    end
end
