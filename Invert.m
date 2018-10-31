clear; clc;
I_jpg = imread('image1.jpg');

%% Grayscale histogram

I_jpg_gray = rgb2gray(I_jpg);
I_gray_invert = 255 - I_jpg_gray;

figure
subplot(1,2,1), imshow(I_jpg_gray);
title('Original')
subplot(1,2,2), imshow(I_gray_invert);
title('Invert')

%% RGB

r = I_jpg(:,:,1);
g = I_jpg(:,:,2);
b = I_jpg(:,:,3);

r_invert = 255 - r;
g_invert = 255 - g;
b_invert = 255 - b;

I_invert(:,:,1)= r_invert;
I_invert(:,:,2)= g_invert;
I_invert(:,:,3)= b_invert;

figure
subplot(1,2,1), imshow(I_jpg);
title('Original')
subplot(1,2,2), imshow(I_invert);
title('Invert')