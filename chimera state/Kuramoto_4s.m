function Unew=Kuramoto_4s(A,U,k,a,dt)
k1=dt*Kuramoto (A,U,k,a);

k2=dt*Kuramoto (A,U+k1/2,k,a);

k3=dt*Kuramoto (A,U+k2/2,k,a);

k4=dt*Kuramoto (A,U+k3,k,a);


Unew=U+((k1+2*k2+2*k3+k4))/6;

Unew=mod(Unew,2*pi)-pi;

end