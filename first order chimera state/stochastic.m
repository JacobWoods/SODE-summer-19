function delta=stochastic(U)
    N=length(U);
    delta = normrnd(0,1,[1,N]);
end