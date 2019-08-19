function A=triangle(m)
r=2^m+1;
N=r*(r+1)/2;
v=zeros(N,2);
n=1;

%creates a labeling of all possible verticies in a typical pyrimid of
%points 
for i=1:r
    for j=1:i
        v(n:n,:)=[i,j];
         n=n+1;
    end
end


%initializes the adjacency matrix
A=zeros(N);
A(1,2)=1;
A(1,3)=1;
A(2,3)=1;
A(2,1)=1;
A(3,1)=1;
A(3,2)=1;

for i=3:N
    for j=2:N
        
      if i>j
       %check if there is more  neighbors of either vertex  
       if sum(A(i:i,:))<4  && sum(A(j:j,:))<4      
         %check if these verticies are on the same level 
           if ((v(i,1)-v(j,1)))==0
             for k=1:i
               %check if these verticies have a shared "parent"   
               if A(k,i)+A(k,j)==2
                   %if so they are conected
                       A(i,j)=1;
               end
               
             end
          end 
       end   
          %recheck if there is more  neighbors of either vertex  
           if sum(A(i:i,:))<4  && sum(A(j:j,:))<4  
           %check if the vertex is one of there "children" (has the same or
           %one above in y cordinate) and the it is indeed in the next
           %generation (one different in the x cordinate)
               if  (((v(i,2)-v(j,2)))==1 || ((v(i,2)-v(j,2)))==0) && ((v(i,1)-v(j,1)))==1
              
                 A(i,j)=1;
           
               end
        
           end
           
      
       
           
           %ensures symetry in the matrix
           A(j,i)=A(i,j);
      end
      
       
    end
    if sum(A(i:i,:))==0
          
          v(i:i,:)=[0,0];
    end 
end

%deletes unused nodes
r=[];
for i=1:N
    if(v(i:i,1)>0)
        
        r=[r,i];
    end
end

A=A(r,r);

end
