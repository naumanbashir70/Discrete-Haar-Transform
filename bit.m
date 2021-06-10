function b=bit(a, b16, b32, b64, b128, b256)
a = a*256/max(max(a));
mask(1:16, 1:16) = b16;
mask(17:32, 1:16) = b32;
mask(17:32, 17:32) = b32;
mask(1:16, 17:32) = b32;
mask(33:64, 1:32) = b64;
mask(33:64, 33:64) = b64;
mask(1:32, 33:64) = b64;
mask(65:128, 1:64) = b128;
mask(65:128, 65:128) = b128;
mask(1:64, 65:128) = b128;
mask(129:256, 1:128) = b256;
mask(129:256, 129:256) = b256;
mask(1:128, 129:256) = b256;
fid = fopen('./bin_files/cameraman.bin','wb');
for(i=1:length(mask)^2)
 if (mask(i) ~= 0)
 w1=strcat('ubit', int2str(mask(i)));
 fwrite(fid, a(i), w1);
 end
end
fclose('all'); 
fid = fopen('./bin_files/cameraman.bin','rb');
b=zeros(length(mask));
for (j = 1:length(mask)^2)
 if (mask(j) ~= 0)
 w2 = strcat('ubit', int2str(mask(j)));
 b(j) = fread(fid, 1, w2);
 else
 w2 = 'ubit1';
 end
end 