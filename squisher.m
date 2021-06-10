function [z,b] = squisher(A, b16, b32, b64, b128, b256);

n=length(A);
b=A;
while n>16
        c=colthing(rowthing(b(1:n,1:n)));
        b(1:n,1:n) = c(1:n,1:n);
        n=n/2;
end

% now we need to quantize the image with diff num of bits for each region
z = quant(b, b16, b32, b64, b128, b256);
