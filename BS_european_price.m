function [Call_BS,Put_BS] = BS_european_price(S0,K,T,r,sig)



d1 = ((log(S0 / K) + (r + (sig^2/2)*T))) / (sig)*(T^0.5);
d2 =  d1 - sig*((T)^0.5);


Call = normcdf(d1)*S0 - normcdf(d2)*K*exp(-r*(T)) ;
Put = normcdf(-d2)*K*exp(-r*(T)) - normcdf(-d1)*S0;

% used for confirming the answer 
[Call_BS,Put_BS] = blsprice(S0,K,r,T,sig);

end

