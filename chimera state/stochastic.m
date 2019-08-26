function delta=stochastic(U)

    N=length(U);
    %creating a stochastic term for the vector U of I.I.D random varibles
    delta = normrnd(0,1,[1,N]);
end