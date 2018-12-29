function [callMC_Barrier_Knockin_Price, putMC_Barrier_Knockin_Price] = MC_barrier_knockin_price(S0, Sb, K, T, r, mu, sigma, numSteps, numPaths)% Pricing an Asian option using Monte Carlo simulations


S = GRWPaths(S0, mu, sigma, T, numSteps, numPaths);


for i = 1:numPaths % columns 
%for i = (1:numSteps + 1) % rows 

   if S((numSteps+1),i) > Sb
        PutPayoffT(1,i) = max(K-S(numSteps,i),0);
% Calculate the payoff for each path for a Call
        CallPayoffT(1,i) = max(S(numSteps,i)-K,0);

        
   else
     PutPayoffT(1,i) = 0;
% Calculate the payoff for each path for a Call
    CallPayoffT(1,i) = 0;             
    end 
    
end 

%end

 

 
% Calculate the payoff for each path for a Put

% Discount back
putMC_Barrier_Knockin_Price = mean(PutPayoffT)*exp(-r*T);
callMC_Barrier_Knockin_Price = mean(CallPayoffT)*exp(-r*T);

end
