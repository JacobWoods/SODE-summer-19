%set the dimensions of our problem how many vertices in our graph
N=256
%the delay inside our sin(ui-uj-a)
a=1.457
%set the number of steps in our time interval
n=8000
%the length of our time interval
T=20
%the weights with minimal edditing could be made into a vector
k=1


%this makes a distance metric for the nodes as if they are on the circle
v1=1:floor(N/2);
V2=floor((N-1)/2):-1:1;
v=[v1 V2];
D=zeros(N);
for i=1:N
    
    for j=1:N
        
        if i>j
            D(j,i)=v(i-j);
        end
        D(i,j)=D(j,i);
        
    end
end
D=D/N;

%using D to create the kernel
G=zeros(N)
K=4
G=K/(2*(1-exp(-K/2)))*(exp(-K*D));
%G=1/(2*pi)*(1+.995*cos(D));
% R=1/4
% for i=1:N
%     
%     for j=1:N
%         
%         if D(j,i)<R
%             G(j,i)=1/(2*R);
%         end
%         
%     end
% end


%creating random initial conditions
I=1:N;
I=I/N;
u_0=6*transpose(rand(N,1)-.5).*exp(-30*(I-.5).^2);


B=chimera(G,n,T,k,a,u_0)



function B=chimera(A,n,T,k,a,u_0)

%getting the number of vertices in A
N=length(u_0);

%finding the size of the time step
dt=T/n

%plotting and saving the initial conditions as a gif
j=0;

w=sprintf('Kuromoto Model at time step %.0f', j)

scatter((1:N),u_0,5,'filled')
axis([1 inf -pi pi])
title(w)
drawnow


saveas(gcf,w,'jpg')
frame = getframe(gcf); 
im = frame2im(frame); 
[imind,cm] = rgb2ind(im,256);
imwrite(imind,cm,'test.gif','gif', 'Loopcount',inf);


%initializing the time steps
u_last=u_0
B=zeros(n,N)

for i=1:n
    
  u_now=Kuramoto_4s(A,u_last,k,a,dt);
    
  B(i:i , : ) = (u_last-u_now)/dt;
  
  %this stament checks if we are at a multiple of 2 pi and will create and
  %save a gif with the title
  if mod(i,100)==0
      
      
     j=i;
     
     w=sprintf('Kuromoto Model at time step %.0f', j)
     
     scatter((1:N),u_now,5,'filled')
     axis([1 inf -pi pi])
     title(w)
     drawnow
     
     
     saveas(gcf,w,'png')
     frame = getframe(gcf); 
     im = frame2im(frame); 
     [imind,cm] = rgb2ind(im,256);
     imwrite(imind,cm,'test.gif','gif','WriteMode','append')
  end
  
  %this sets u_last to u_now to prepair to start the next iterate
  u_last=u_now;
end


end




