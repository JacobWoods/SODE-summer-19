function A= nearest_k_n(N,l)
A=zeros(N)

for i=1:N
    for j=1:N
        
       if (abs(i-j)<=l)||(abs(i-j)>=N-l)
           A(i,j)=1;
       end
       
       A(j,j)=0;
       
       
    end
    
    
end


end

