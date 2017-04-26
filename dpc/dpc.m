function [sir_history, p_history] = dpc(G, init_p, r, noise, itimes)
    snum = size(G, 2);

    % Initiate sir to be all zero, and record the changes
    sir_history = zeros(itimes, snum);

    p_history = zeros(itimes, snum);
    p_history(1,:) = init_p; 

    % the loop begins
    for i=1:itimes
        for j=1:snum
            sir_history(i, j) = G(j,j)*p_history(i,j)/(sum(G(j,:)*p_history(i,:)')-G(j,j)*p_history(i,j) + noise);
            p_history(i+1, j) = r(j)/sir_history(i, j) * p_history(i, j);
        end
    end

    p_history(itimes+1,:) = [];
end

