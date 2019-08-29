

D=triangle(2);
m=length(D);
%Random initial conditions
u_0=(rand(m,1)-.5)*4;
%1/3 , 2/3 initial conditions
%u_0=transpose([ -1 -1 -1 -1 -1 -1 1 1 1 1 1 1 1 1 1])
%coupleing strength
k=.025;
%scale of noise
delta=0.325;
%number of steps 
n=1000000;
%time length
dt=.025;

C=Timeplot(D,m,k,u_0,delta,n,dt);

%reformats C for the time plot 
cp=zeros(n,m);
cp(:,1:1)=C(:,6:6);
cp(:,2:3)=C(:,2:3);
cp(:,4:4)=C(:,1:1);
cp(:,5:5)=C(:,5:5);
cp(:,6:6)=C(:,4:4);
cp(:,7:8)=C(:,7:8);
cp(:,9:9)=C(:,11:11);
cp(:,10:10)=C(:,12:12);
cp(:,11:11)=C(:,13:13);
cp(:,12:12)=C(:,9:9);
cp(:,13:13)=C(:,10:10);
cp(:,14:15)=C(:,14:15);

%plotting C
imagesc(cp)
colorbar


%if you wish to see a specific frame say time step j of the time plot plotted as a triangle
%use the following code 

% % % u_scale=ones(m,1);
% % % u=C(j:j,:);
% % % 
% % % for i=1:m
% % %     if u(i)<0
% % %       u_scale(i)=0;
% % %     end
% % % end
% % % w=sprintf('triangle at time step %.0f', j);
% % % f=zeros(m,1);
% % % B=[u_scale , f , 1-u_scale];
% % % plot(graph(D),'NodeColor',B)
% % % 
% % % title(w)

function C=Timeplot(D,m,k,u_0,delta,n,dt)
u_last=u_0;
C=zeros(n,m);
for i=1:n
    
   u_now=u_last+dt*RHS(u_last,D,k)+delta*randn(m,1)*dt^.5;
    
    
     C(i:i , : ) = u_now;
        
        
    
       
      
    
    
    u_last=u_now; 
   
end



% imagesc(C)
% colorbar
% drawnow

end

function v=RHS(u,D,k)


N=length(u);

v=zeros(N,1);
for i=1:N
v(i)=-(u(i)^3 - u(i))+k*sum(D(i:i,:)*(u-u(i)));

end



end