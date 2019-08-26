function Unew=stochasticint(U,dt,epsilon)
    %integrating the stochastic term
    Unew=U+(epsilon)*dt^.5.*stochastic(U);
    %periodic boundry conditions
    Unew=mod(Unew,2*pi)-pi;
    
end