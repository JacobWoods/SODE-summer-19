
%tree height
h=3
% largest generation
n=2^(h-1)

%initializing conditions
U=zeros(h,n)

%initial condition
for i=1:h
    
    for j=1:2^(i-1)
        U(i,j)=rand()*2*pi
    end
    
    
end


%set time interval and number of steps
t=1
n=10
dt=t/n

q=[U]
for i=1:n
    
    
    V=derive(U,h,1)
    
    U=U+dt*V
    
    U=mod(U,2*pi)
    
    q=[q;U]
end










function V=derive(U,h,k)

V=zeros(h,2^(h-1));

for i=1:h
    
    for j=1:2^(i-1)
        if i==1
            V(i,j)=k/2*(sin(U(2,1)-U(1,1))+sin(U(2,2)-U(1,1)));
        elseif i==h
            V(i,j)=k*(sin(U(i-1,ceil(j/2))-U(i,j)));
        else
            V(i,j)=k/3*(sin(U(i+1,ceil(j/2))-U(i,j))+sin(U(i+1,ceil(j/2))-U(i,j))+sin(U(i-1,ceil(j/2))-U(i,j)));
        end
    end
    
    
end

end
