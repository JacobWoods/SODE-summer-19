
function c=timestep(D,N,delta,dt,k)

m=length(D);
u_0=(rand(m,1)-.5)*2;
u_last=u_0;
u_now=u_0;
test=zeros(m,1);
for i=1:m
    if u_now(i)<0
      test(i)=1;
    end
end
p=0;
l=sum(test);
while (l>0) && (l<m)
 
  u_now=u_last+dt*RHS(u_last,D,k,delta);
    test=zeros(m,1);
    for i=1:m
        if u_now(i)<0
         test(i)=1;
        end
    end
  l=sum(test);
  u_last=u_now;
  p=p+1;
end
c=p;
end

function v=RHS(u,D,k,delta)


N=length(u);

v=zeros(N,1);
for i=1:N
v(i)=-(4*u(i)^3 - 2*u(i))+delta*normrnd(0,1)+k*sum(D(i:i,:)*(u-u(i)))/N;

end



end