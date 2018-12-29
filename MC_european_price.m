function [callMC_European_Price, putMC_European_Price, S]= MC_european_price(S0, K, T, r, mu, sigma, numSteps, numPaths)


S = GRWPaths(S0, mu, sigma, T, numSteps, numPaths);
L = S((numSteps+1),:);

% Calculate the payoff for each path for a Put
PutPayoffT = max(K-L,0);

% Calculate the payoff for each path for a Call
CallPayoffT = max(L-K,0);

% Discount back
callMC_European_Price  = mean(PutPayoffT)*exp(-r*T);
putMC_European_Price = mean(CallPayoffT)*exp(-r*T);

    