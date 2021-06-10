function z = iquant(A,b16,b32,b64, b128, b256);

q=[b16,b32,b64,b128,b256];
k=5;
n=256;
while (n >= 16)
        z(1:n,1:n) = round(A(1:n,1:n)./2.^q(k).*256);
        n=n/2;
        k=k-1;
end