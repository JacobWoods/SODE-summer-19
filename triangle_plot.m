
delta=8;
N=4;
D=triangle(N);
m=length(D);
u_0=(rand(m,1)-.5)*2
u_now=u_0
n=100000;
dt=.0025;
    scatter(1:m,u_now)
    pause(.2)
u_last=u_0;
for i=1:n
u_now=u_last+dt*RHS(u_last,D,100,delta)

  if mod(i,100)==1
   scatter(1:m,u_now)
    drawnow
    pause(.1)
  end

u_last=u_now;



end



    
    
    
    
    
    
function v=RHS(u,D,k,delta)


N=length(u);

v=zeros(N,1);
for i=1:N
v(i)=-(4*u(i)^3 - 2*u(i))+delta*normrnd(0,1)+k*sum(D(i:i,:)*(u-u(i)));

end



end
