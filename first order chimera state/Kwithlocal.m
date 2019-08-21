%set the dimensions of our problem how many vertices in our graph
N=256;
hold off
%the delay inside our sin(ui-uj-a)
a=1.457;
%set the number of steps in our time interval
n=80000;
%the length of our time interval
T=20000;
%the weights with minimal edditing could be made into a vector
k=1;   
% magnitude of stocastic variblr
epsilon=0.005;

%this makes a distance metric for the verticies as if they are on the circle
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


% v=1:floor(N);
% D=zeros(N);
% for i=1:N
%     
%     for j=1:N
%         
%         if i>j
%             D(j,i)=v(i-j);
%         end
%         D(i,j)=256-D(j,i);
%         if i==j
%            D(i,j)=0;
%         end
%     end
% end
% D=D/N;


%using D to create the kernel
G=zeros(N);
K=4;
G=K/(2*(1-exp(-K/2)))*(exp(-K*D));
%G=1/(2*pi)*(1+.995*cos(D));
% % R=1/50
% % for i=1:N
% %     
% %     for j=1:N
% %         
% %         if D(j,i)<R
% %             G(j,i)=1/(2*R);
% %         end
% %         
% %     end
% % end



%creating random initial conditions
I=1:N;
I=I/N;
u_0=6*transpose(rand(N,1)-.5).*exp(-30*(I-.5).^2);
R=1/25
L=zeros(N)
for i=1:N
    
    for j=1:N
        
        if D(j,i)<R
            L(j,i)=1/(2*R);
        end
        
    end
end

C=chimerastoch(G,L,n,T,k,a,u_0,epsilon);




function C=chimerastoch(A,B,n,T,k,a,u_0,epsilon)

%getting the number of vertices in A
N=length(A);

dt=T/n;

%plotting and saving the initial conditions as a gif
j=0;

w=sprintf('Kuromoto Model with noise at time step %.0f', j);

scatter((1:N),u_0,5,'filled')
axis([1 inf -pi pi])
title(w)
drawnow
saveas(gcf,w,'png')
frame = getframe(gcf); 
im = frame2im(frame); 
[imind,cm] = rgb2ind(im,256);
imwrite(imind,cm,'test.gif','gif', 'Loopcount',inf);

C=zeros(n,N);
%initializing the time steps
u_last=u_0;
for i=1:n
    
  u_now=stochasticint(u_last,dt/2,epsilon); 
  u_now=Kuramoto_4s2(A,B,u_now,k,a,dt);
   u_now=stochasticint(u_now,dt/2,epsilon);

  C(i:i , : ) = u_now;
  %this stament checks if we are at a multiple of 2 pi and will create and
  %save a gif with the title
  if mod(i,25)==0
     j=i;
     
     w=sprintf('Kuromoto Model with noise at time step %.0f', j)
     
     scatter((1:N),u_now,5,'filled');
     axis([1 inf -pi pi]);
     title(w);
     %drawnow
     
     
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

function Unew=Kuramoto_4s2(A,B,U,k,a,dt)
k1=dt*Kuramoto2 (A,B,U,k,a);

k2=dt*Kuramoto2 (A,B,U+k1/2,k,a);

k3=dt*Kuramoto2 (A,B,U+k2/2,k,a);

k4=dt*Kuramoto2 (A,B,U+k3,k,a);


Unew=U+((k1+2*k2+2*k3+k4))/6;

Unew=mod(Unew,2*pi)-pi;

end

function v=Kuramoto2 (A,B,U,k,a)

N=length(U);
v=zeros(1,N);

for i=1:N
    
    %add a second derivative term in palce of b
    v(i)=-sum(sin((U(i)-U+a)).*(A(i:i,:)+B(i:i,:)))*k/N;
end




end