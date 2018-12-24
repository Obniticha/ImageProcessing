clear; clc;
I_jpg = imread('image1.jpg');
I_jpg_gray = rgb2gray(I_jpg);
%%
I_robert = edge(I_jpg_gray,'Roberts');
I_canny = edge(I_jpg_gray,'Canny',0.2,sqrt(2));
%%I_log = edge(I_jpg_gray,'log',[],4);
I_usm_25 = imsharpen(I_jpg_gray,'Radius',2.5);
I_usm_10 = imsharpen(I_jpg_gray,'Radius',10);

w = fspecial('log',[3 3],0.5); 
I_lof = imfilter(I_jpg_gray,w,'replicate');

figure
subplot(3,2,1), imshow(I_jpg_gray);
title('Original')
subplot(3,2,2), imshow(I_robert);
title('Robert operation')
subplot(3,2,3), imshow(I_canny);
title('Canny operation')
subplot(3,2,4), imshow(I_lof);
title('LoF operation')
subplot(3,2,5), imshow(I_usm_25);
title('USM sigma=2.5')
subplot(3,2,6), imshow(I_usm_10);
title('USM sigma=10')
