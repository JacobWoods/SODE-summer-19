
n=10000;
dt=.05;
delta=.5;
N=2;
k=.7;
m=10;
D=nearest_k_n(15,2);
T=triangle(N);

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



u_lastT=u_0;
u_lastD=u_0;
for i=1:n
  
  
  
  u_nowT=u_lastT+dt*RHS(u_lastT,T,k,delta);
  u_nowD=u_lastD+dt*RHS(u_lastD,D,k,delta);
  
  
  if mod(i,m)==0
     u_scaleT=ones(m,1)
     u_scaleD=ones(m,1)
        for j=1:m
             if u_nowT(j)<0
                u_scaleT(j)=0
             end
             if u_nowD(j)<0
                u_scaleD(j)=0
             end
        end
    TC=[u_scaleT , f , 1-u_scaleT];
    DC=[u_scaleD , f , 1-u_scaleD];
    
    
    figure(1);plot(graph(D),'NodeColor',DC,'MarkerSize',10)
    figure(2);plot(graph(T),'NodeColor',TC,'MarkerSize',10)
    
    
    pause(.1)
  end
  
  %this sets u_last to u_now to prepair to start the next iterate
  u_lastT=u_nowT;
  u_lastD=u_nowD;
end



function v=RHS(u,D,k,delta)


N=length(u);

v=zeros(N,1);
for i=1:N
v(i)=-(u(i)^3 - u(i))+delta*normrnd(0,1)+k*sum(D(i:i,:)*(u-u(i)));

end



end