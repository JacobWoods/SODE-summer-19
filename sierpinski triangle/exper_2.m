D=triangle(5);
m=length(D);
u_0=(rand(m,1));
o=zeros(m,1);
k=1
delta=0.5



n=1000000
dt=.025

u_last=u_0;
M=0
for i=1:n
    
   u_now=u_last+dt*RHS(u_last,D,k,delta)  
    
  
    colors=zeros(m,1)
    for j=1:m
       if u_now(j)<.1
          colors(j)=1 
       end
    end  
       
       
        C=[colors , o , 1-colors];   
        %figure(1); plot(graph(D),'NodeColor',C,'MarkerSize',10)
        figure(2);scatter(1:m,u_now) 
        axis([1 inf -1 2])
        pause(.1)
     for j=1:m
       if u_now(j)<.1
       
          u_now(j)=1 
       end
    end  
         
      
    if sum(colors)>M
       M=sum(colors)
    end
    u_last=u_now; 
end








function v=RHS(u,D,k,delta)


N=length(u);

v=zeros(N,1);
for i=1:N
v(i)=-(u(i)^3 - u(i))+delta*normrnd(0,1)+k*sum(D(i:i,:)*(u-u(i)));

end



end