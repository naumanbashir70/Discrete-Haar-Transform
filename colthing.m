function z = colthing(A);

n = length(A);
for j=1:n,
 k=1;
 for i=1:2:(n-1),
 z(k,j) = (A(i,j) + A(i+1, j))/sqrt(2);
 z(k + n/2,j) = (A(i,j) - A(i+1,j))/sqrt(2);
 k=k+1;
 end
end 
