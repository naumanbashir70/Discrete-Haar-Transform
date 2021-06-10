function z = colthingi(A);

n = length(A);
for j=1:n,
        k=1;
        for i=1:(n/2),
                z(k,j) = (A(i,j) + A(i+n/2, j))/sqrt(2);
                z(k+1,j ) = (A(i,j) - A(i+n/2,j))/sqrt(2);
                k=k+2;
        end
end