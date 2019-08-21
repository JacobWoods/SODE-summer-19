
n=100000;
dt=.05;

delta=2;
N=3;
D=triangle(N);
m=length(D);
u_0=(rand(m,1)-.5)*2;
u_scale=ones(m,1)
for i=1:m
    if u_0(i)<0
      u_scale(i)=0
    end
end

f=zeros(m,1);
C=[u_scale , f , 1-u_scale];
plot(graph(D),'NodeColor',C)
drawnow



u_last=u_0;
u_now=u_0
for i=1:n
  
  
  
  u_now=u_last+dt*RHS(u_last,D,10,delta)

  %this stament checks if we are at a multiple of 2 pi and will create and
  %save a gif with the title
  if mod(i,10)==0
     u_scale=ones(m,1)
        for j=1:m
             if u_now(j)<0
                u_scale(j)=0
             end
        end
    C=[u_scale , f , 1-u_scale];

    plot(graph(D),'NodeColor',C,'MarkerSize',10)
    %plot(1:N*(N+1)/2,u_now)
    pause(.1)
  end
  
  %this sets u_last to u_now to prepair to start the next iterate
  u_last=u_now;
end



function v=RHS(u,D,k,delta)


N=length(u);

v=zeros(N,1);
for i=1:N
v(i)=-(4*u(i)^3 - 2*u(i))+delta*normrnd(0,1)+k*sum(D(i:i,:)*(u-u(i)))/N;

end



end