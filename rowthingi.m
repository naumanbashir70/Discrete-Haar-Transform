function z = rowthingi(A);

n = length(A);
for i=1:n,
        k=1;
        for j=1:(n/2),
                z(i,k) = (A(i,j)+A(i,j+n/2))/sqrt(2);
                z(i,k+1) = (A(i,j)-A(i,j+n/2))/sqrt(2);
                k=k+2;
        end
end

