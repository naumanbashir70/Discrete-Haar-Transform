function [b,d] = unsquisher(A, b16, b32, b64, b128, b256);

b = iquant(A, b16, b32, b64, b128, b256);
N=length(A);
n=32;

d=b;
while n <= N
        c=rowthingi(colthingi(d(1:n,1:n)));
        d(1:n,1:n) = c(1:n,1:n);
        n=n*2;
end