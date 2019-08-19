
%set the dimensions of our problem how many vertices in our graph
N=10
%the delay inside our sin(ui-uj-a)
a=0
%set the number of steps in our time interval
n=100
%the length of our time interval
T=1
%the weights with minimal edditing could be made into a vector
k=1

%creating an adjacency matrix for our graph on which we are modeling the
%problem
A=zeros(N)
%code for a completed graph
for i=1:N
    for j=1:N
       if i~=j
           A(i,j)=1
       end
    end
end
%code for a random undirected graph
% % for i=1:N
% %     for j=1:N
% %        if i>j
% %            A(i,j)=randi([0 1])
% %        end
% %        A(j,i)=A(i,j)
% %     end
% % end
%code for a random directed graph
% % for i=1:N
% %     for j=1:N
% %            A(i,j)=randi([0 1])
% %        
% %     end
% % end


Kuramoto(A,n,T,k,a)




function []=Kuramoto (A,n,T,k,a)

%getting the number of vertices in A
N=length(A)

%creating random initial conditions
u_0=2*pi*rand(N,1)

%finding the size of the time step
dt=T/n

%plotting and saving the initial conditions as a gif
j=num2str(int16(0));
plot((1:N),u_0)
axis([1 inf 0 2*pi])
drawnow
%saveas(gcf,j,'jpg')
frame = getframe(gcf); 
im = frame2im(frame); 
[imind,cm] = rgb2ind(im,256);
imwrite(imind,cm,'u_every_ten_iterates.gif','gif', 'Loopcount',inf);


%initializing the time steps
u_last=u_0
for i=1:n
    
 
  
 
  %the derivative with a normalization factor of degree of the vertex is
  %computed 

 du_last= k*sum((sin(u_last*ones(1,N)-(ones(N,1)*u_last')))*A)'.*transpose(1./sum(transpose(A)))
 
  
  %using eulers method to find the value of u at the current time from the
  %privous time
  u_now=u_last+dt*du_last 
  %modding out by 2pi
  u_now=mod(u_now,2*pi)
  
  %this stament checks if we are at a multiple of 2 pi and will create and
  %save a gif with the title
  if mod(i,10)==0
     j=num2str(int16(i));
     plot((1:N),u_now)
     axis([1 inf 0 2*pi])
     drawnow
     %saveas(gcf,j,'jpg')
     frame = getframe(gcf); 
     im = frame2im(frame); 
     [imind,cm] = rgb2ind(im,256);
     imwrite(imind,cm,'u_every_ten_iterates.gif','gif','WriteMode','append')
  end
  
  %this sets u_last to u_now to prepair to start the next iterate
  u_last=u_now
end


end

