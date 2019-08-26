

%the dimensions of our problem how many vertices in our graph
N=256;
%the number of steps in our time interval
n=800;
%The data from the chimera state
C=C

%initializing a matrix to check the distance on the y axis between two
%vertices 
F=zeros(n,N);

%this code checks the distance between two verticies of our graph with a
%periodic distance metric
for i=1: n
    for j=1:N
        if j<N
            F(i,j)=abs(C(i,j)-C(i,j+1));
            if F(i,j)>pi
                F(i,j)=2*pi-F(i,j);
            end
        else
            F(i,j)=abs(C(i,j)-C(i,1));
            if F(i,j)>pi
                F(i,j)=2*pi-F(i,j);
            end
        end
    end
end

%recorded the average distance between verticieces for nodes within 10
%of either side of our node
AF=zeros(n,N);
for i=1: n
    for j=1:N
        if j>10 && j<N-9
           AF(i,j)=sum(F(i:i,j-10:j+10))/21;
        elseif j<=5
            AF(i,j)=(sum(F(i:i,1:j+10))+sum(F(i:i,N-10+j:N)))/21;
        elseif j>=252
            AF(i,j)=(sum(F(i:i,j-10:N))+sum(F(i:i,1:10-N-j)))/21;
        end
    end
end


%this is a 1 if our estimated x derivative is belowe a certain threshold
RUNS=zeros(n,N);
for i=1: n
    for j=1:N
        if AF(i,j)<2*epsilon+.02
           RUNS(i,j)=1;
        end
    end
end


%this will count how many verticies in a row are belowe a certain threshold
%and record it in the entries of a matrix
formated=zeros(n,N);
for q=1:n
i=1;
while i<=256
    walk=0;
    j=i;
    if RUNS(q,i)==1
       walk=1;
       
       while RUNS(q,i)==1
           walk=walk+1;
           if i==256
               break
           end
           i=i+1;
       end
       
    end
   
    formated(q,j:i)=walk;
       if j==1
           ho=walk;
           p=i;
       end
       if i==256 &&  RUNS(q,i)==1
           formated(q,j:i)=walk+ho;
           formated(q,1:p)=walk+ho;
       end
      i=i+1;
    
end
end


%this finds the boundries of that region
boundries=zeros(n,2);
for i=1:n
    j=1;
    M=max(formated(i:i,:));
    while boundries(i,1)==0 || boundries(i,2)==0 
       if j<256
         if  formated(i,j)==M && formated(i,j+1)~=M
           boundries(i,1)=j;
         end
       end
        
       if j>1
       if  formated(i,j)==M && formated(i,j-1)~=M
           boundries(i,2)=j;
       end
       end
       
        j=j+1;
        if j==257
            
            if boundries(i,2)==0
                boundries(i,2)=256;
            end
            if boundries(i,1)==0
                boundries(i,1)=1;
            end
            
        end
        
    end
end

scatter(1:n,boundries(:,1:1))
hold on
scatter(1:n,boundries(:,2:2))

hold off