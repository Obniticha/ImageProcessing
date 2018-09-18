clear; clc;
I_jpg = imread('image1.jpg');
I_bmp = imread('image2.bmp');
I_gif = imread('image3.gif');
I_png = imread('image4.png');
I_tiff = imread('image5.tiff');

%% Grayscale histogram

I_jpg_gray=rgb2gray(I_jpg);
I_bmp_gray=rgb2gray(I_bmp);
I_png_gray=rgb2gray(I_png);
I_tiff_gray=rgb2gray(I_tiff);

figure
subplot(5,2,1), imshow(I_jpg_gray);
title('jpg')
subplot(5,2,2), imhist(I_jpg_gray);
subplot(5,2,3), imshow(I_bmp_gray);
title('bmp')
subplot(5,2,4), imhist(I_bmp_gray);
subplot(5,2,5), imshow(I_gif);
title('gif')
subplot(5,2,6), imhist(I_gif);
subplot(5,2,7), imshow(I_png_gray);
title('png')
subplot(5,2,8), imhist(I_png_gray);
subplot(5,2,9), imshow(I_tiff_gray);
title('tiff')
subplot(5,2,10), imhist(I_tiff_gray);