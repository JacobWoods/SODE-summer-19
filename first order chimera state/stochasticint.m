function Unew=stochasticint(U,dt,epsilon)

    Unew=U+(epsilon)*dt^.5.*stochastic(U);
    Unew=mod(Unew,2*pi)-pi;
end