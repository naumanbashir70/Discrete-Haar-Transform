
A = imread('cameraman.tif');    % read an input image
save_name = 'Cameramantest.tif'     % type name here to be save with same name 
Q = im2double(A);   
%Q = rgb2gray(Q)            % uncomment this line to use RGB images
resize =  imresize ( Q, [256, 256])  %Resize the image 256 x 256
imwrite(resize , strcat('./resize_images/',save_name)); %save image

% Different Bit Alloacation Schemes.
%b16=16; b32=14; b64=10; b128=8; b256=4;
b16=8; b32=8; b64=8; b128=8; b256=2;

figure;
imagesc(resize);
title('Original image')
colormap(gray)

%------------------------CALL ROw THING----------------------
row = rowthing(resize);
% figure
% imshow(row)
% title('Row Thing Image')
% colormap(gray)

%------------------------CALL COL THING----------------------
col = colthing(row);
% figure
% imshow(col)
% title('Col Thing Image')
% colormap(gray)

%------------------------Squisher----------------------
[n,m] = squisher(resize, b16, b32, b64, b128, b256);
figure
imshow(m)
title('Squisher')
colormap(gray)

%------------------------Qunat-------------------------

quanti = quant(n,b16,b32,b64,b128,b256);

%------------------------Binay File----------------------

k=bit(m, b16, b32, b64, b128, b256);

%==================================REVERSE===================

%------------------------In Qaunat-----------=----------------------

in_quant = iquant(quanti,b16,b32,b64, b128, b256);

%------------------------CALL COL THING INVERSE----------------------
col_i = colthingi(k);
% figure
% imshow(col_i)
% title('Col Thing Image Reverse')
% colormap(gray)


%------------------------CALL ROw THING INVERSE----------------------
row_i = rowthingi(col_i);
% figure
% imshow(row_i)
% title('Row Thing Image Reverse')
% colormap(gray)


%------------------------UNSquisher----------------------

[row_i, decomp] = unsquisher(in_quant, b16, b32, b64, b128, b256);
imwrite(decomp , strcat('./decompressed_images/',save_name)); %save image

figure
imagesc(decomp);
title('Decompressed')
colormap(gray)


%===============================Performace Parametets=====================


%-----------------Mean Square Error

MSE = immse(resize, decomp);
fprintf('\n The mean-squared error is %f\n', MSE);

%--------------------Bits Per Pixel------------------

get_bit = strcat('./bin_files/cameraman.bin');    
k_comp=dir(get_bit);
bts = k_comp.bytes*8;
px = 256^2;
bpp = bts/px;
fprintf('\n Bits per Pixels are %f \n', bpp)

%--------------------Compression Ratio----------------

im_file=dir(strcat('./resize_images/',save_name));
original_bytes = im_file.bytes;
comp_bytes = k_comp.bytes;
ratio_compression = original_bytes/comp_bytes;
fprintf('\n Compression ration is %f \n', ratio_compression)

%--------------------Bytes Consumed-------------------

consumed_bytes = k_comp.bytes;
fprintf('\n Number of bytes consumed %f \n', consumed_bytes)

%--------------------PSNR------------------------------

PSNR = 10*log10(256*256/MSE);
fprintf('\nPSNR: %f ', PSNR);



