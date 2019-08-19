    

    g=2
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
