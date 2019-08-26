function v=Kuramoto (A,U,k,a)

N=length(U);
v=zeros(1,N);

for i=1:N
    v(i)=sum(sin((U(i)-U+a)).*A(i:i,:))*k/N;
end




end