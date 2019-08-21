
%the delay inside our sin(ui-uj-a)
a=0
%set the number of steps in our time interval
n=8000
%the length of our time interval
T=200
%the weights with minimal edditing could be made into a vector
k=1



    g=15
    p=.5
    
    %generating first generation
    Z=1
    R=geornd(p,Z,1)+1
    
    %first row of matrix
    row=[zeros(Z,1) ; ones(R,1)]
    v={0 ; row}
    
    %initializing varibles
    C=sum(R)+Z
    Z=sum(R) 
    k=2
    
    %generating the rows of the matrix
    for i=1:g
        
        R=geornd(p,Z,1)
        if sum(R)== 0
            R=zeros(Z,1)
            R(randi([1 Z])) = 1
        end
        l=1
        for j=1:Z
            k=k+1
            row=[zeros(C,1) ; ones(R(l),1)]
            v{k,1}=row
            C=C+R(l)
            l=l+1
            
        end
       Z=sum(R)  
        
    end
    %finding the size and initializing the adjacency matrix
    verticies=length(v{length(v),1})
    A=zeros(verticies)
   %populating the matrix
    for i=2:length(v)
        
        for j=length( cell2mat(v(i-1))):length( cell2mat(v(i)))
            x=cell2mat(v(i))
            A(i-1,j)=x(j)
            A(j,i-1)=x(j)
        end  
    end
    
galton_watson(A,n,T,k,a)



function []=galton_watson(A,n,T,k,a)

%getting the number of vertices in A
N=length(A);

%creating random initial conditions
u_0=2*pi*rand(1,N);

%finding the size of the time step
dt=T/n;

%plotting and saving the initial conditions as a gif
j=num2str(int16(0));
scatter((1:N),u_0)
axis([1 inf -pi pi])
drawnow
saveas(gcf,j,'jpg')
frame = getframe(gcf); 
im = frame2im(frame); 
[imind,cm] = rgb2ind(im,256);
imwrite(imind,cm,'test.gif','gif', 'Loopcount',inf);


%initializing the time steps
u_last=u_0
for i=1:n
    
    
  %u_now=stochasticint(u_last,dt/2) 
  u_now=Kuramoto_4s(A,u_last,k,a,dt)
  %u_now=stochasticint(u_now,dt/2)
 

  
  %this stament checks if we are at a multiple of 2 pi and will create and
  %save a gif with the title
  if mod(i,10)==0
     j=num2str(int16(i));
     scatter((1:N),u_now)
     axis([1 inf -pi pi])
     drawnow
     saveas(gcf,j,'jpg')
     frame = getframe(gcf); 
     im = frame2im(frame); 
     [imind,cm] = rgb2ind(im,256);
     imwrite(imind,cm,'test.gif','gif','WriteMode','append')
  end
  
  %this sets u_last to u_now to prepair to start the next iterate
  u_last=u_now
end


end
