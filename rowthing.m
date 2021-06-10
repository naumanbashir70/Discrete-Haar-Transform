function z = rowthing(A);
n = length(A);
for i=1:n,
 k=1;
 for j=1:2:(n-1),
 z(i,k) = (A(i,j) + A(i, j+1))/sqrt(2);
 z(i, k + n/2) = (A(i,j) - A(i,j+1))/sqrt(2);
 k=k+1;
 end
end 