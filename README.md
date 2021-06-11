# Discrete-Haar-Transform
### This repository contains the code and explanation of Discrete Haar Transform


# 1.	Code Explanation
1.	Rowthing
2.	Colthing
3.	Squisher
4.	Quantization
5.	Binary File	
7.	In Quantization
8.	Colthing Inverse
9.	Rowthing Inverse
10.  Un Squisher

## Datset used
1. Matlab Test Images
2. Kodak Image Dataset


## 1.	Rowthing
This function calculates the sums and differences of every row of the image. It calculates the sum and difference of adjacent pixels and then store the difference on the right side and sum on the left side. The image on left side look like pinched horizontally and right side somewhat blackish. In order to keep the energy of the image the same, each sum and difference is multiplied by a factor of 1/sqrt (2).

 This process is show in Code flow diagram with (2*).  At (3*), the rowthing return the output to the colthing function.
* shows that this function run several times.

![Picture1](https://user-images.githubusercontent.com/58822992/121517648-0efe5f00-ca09-11eb-8359-db3bde3cd69f.jpg)



## 2.	Colthing
This function takes the output of Rowthing and calculate the sums and differences of every column of the image. It calculates the sum and difference of adjacent pixels and then store the difference at bottom and sum at top. In order to keep the energy of the image the same, each sum and difference is multiplied by a factor of 1/sqrt (2). The image at top will be perfect square images. 

This process is show in Code flow diagram with (4*). At (5*), the colthing return the output to the squisher, so that is again sent to the rowthing
* shows that this function run several times. 

![Picture2](https://user-images.githubusercontent.com/58822992/121517732-23daf280-ca09-11eb-95f0-093c10ffbe6b.jpg)


## 3.	Squisher
Squisher use Rowthing and Colthing. It iteratively passes the image to rowthing and pass the output of rowthing to the colthing. This process continues until the image of 16x16 is received on the top left corner. After compressing the image to 16x16, the result is pass to Quantization function. 

At (6), the squisher send the output to the quant.

![Picture3](https://user-images.githubusercontent.com/58822992/121517777-2f2e1e00-ca09-11eb-9543-143db91a0aa7.jpg)


## 4.	Quantization
This function used the output (squished image) of squisher. Different regions of the squished image are quantized with the input bits. As we know after squishing image, image show at the top left corner. So, most bits are required at the top left and minimum bits are required at the bottom right corner. If we pass this bit scheme [8,6,4,2,0] then image is quantized as:
16x16 => Quantize with 8 bits
32x32 => Quantize with 6 bits
64x64 => Quantize with 4 bits
128x128 => Quantize with 2 bits
256 x 256 => Quantize with 0 bits

At (6), the quant returns the output to the squished in [n,m], that’s I have shown this with double head arrow.

![Picture4](https://user-images.githubusercontent.com/58822992/121517819-36edc280-ca09-11eb-8fcc-a82dede4fc62.jpg)



## 5.	Binary File (Bit Store)
Once the compressed image is generated, it is transferred it to a binary file for storage. It uses different number of bits (that was assigned in previous section) and write it to binray(.bin) file. it uses bit mask from each region from 16x16 to 256 x 256. It then saves the file with .bin extension, which is latterly used to perform various calculation like compression ratio etc.

At (7a), the squisher send the compressed file to Bit function.
At (7b), the Bit function creates a binary file with bin extension.
At (7c), squisher send the compressed file to InQuant function to decompress the images.



# ==== Decompression ====

## 6.	In Quantization
This function performs all the inverse function of Quantization. The unsquished image is passed to InQuant function. It uses the same number of bits that were assigned in Quant function to decompress the images.
At (8), the iQuant pass the output to the Colthing Inverse function.

![Picture5](https://user-images.githubusercontent.com/58822992/121517863-440ab180-ca09-11eb-9fa6-6285ca1e41f6.jpg)


## 7.	Colthing Inverse
This function works opposite to the colthing function. While compressing image, we first apply Rowthing and then Colthing; however, to decompress the image, we first apply colthing inverse and then apply rowthing inverse.
	
At (9*), the colthing inverse perform column wise operation on output.
At (10*), the colthing inverse return the output to the rowthing inverse function.

* shows that this function run several times

![Picture6](https://user-images.githubusercontent.com/58822992/121517885-4a009280-ca09-11eb-980d-d47fdd266628.jpg)


## 8. Rowthing Inverse
Rowthing inverse uses the output of colthing inverse function. This function works opposite to the colthing function.

At (11*), the rowthing inverse performs the inverse row wise operation on the input.

![Picture7](https://user-images.githubusercontent.com/58822992/121517909-5127a080-ca09-11eb-88b5-4ce7b05bd7a3.jpg)


## 9. UnSquisher
UnSquisher uses Rowthing Inverse and Colthing Inverse. It iteratively passes the image to colthing inverse and pass the output of colthing inverse to the rowthing inverse. This process continues until the image of 256x256.

At (12*), the unsquisher perform inverse squisher operation on image using colthing inverse and rowthing inverse and return the output.

![Picture8](https://user-images.githubusercontent.com/58822992/121517953-5be23580-ca09-11eb-9dbe-ed716899dee7.jpg)


# 2. Code flow diagram

![Picture9](https://user-images.githubusercontent.com/58822992/121517966-613f8000-ca09-11eb-94b4-aa85a4083443.png)
