D=triangle(5);
m=length(D);
u_0=(rand(m,1)-.5)*2;
o=zeros(m,1);
k=.3;
delta=0.05;




n=1000000;
dt=.025;
u_scale=zeros(m,1);
for i=1:m
    if u_0(i)<0
      u_scale(i)=0;
    end
end


u_scaleL=u_scale
u_last=u_0;

for i=1:n
    
   u_now=u_last+dt*RHS(u_last,D,k,delta)  
    
    
     u_scale=ones(m,1);
        for j=1:m
             if u_now(j)<0
                u_scale(j)=0;
             end
             
        end
      if sum(abs(u_scale-uscaleL))>0
         cluster=zeros(m,1);
        for j=1:m
             if abs(u_now(j))<0.1
                cluster(j)=1;
             end 
        end
       C=[cluster , o , 1-cluster];
       figure(1); plot(graph(D),'NodeColor',C,'MarkerSize',10)
       pause(1)
      end 
       
      
    
      
       scatter(1:m,u_now) 
        axis([1 inf -1 2])
        drawnow
        pause(.1)
  
    u_last=u_now; 
    u_scaleL=u_scale;
end








function v=RHS(u,D,k,delta)


N=length(u);

v=zeros(N,1);
for i=1:N
v(i)=-(u(i)^3 - u(i))+delta*normrnd(0,1)+k*sum(D(i:i,:)*(u-u(i)));

end



end