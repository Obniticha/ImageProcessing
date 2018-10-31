clear; clc;
I_jpg = imread('image1.jpg');

%% Grayscale histogram

I_jpg_gray = rgb2gray(I_jpg);
I_jpg_gray_bright = I_jpg_gray + 30;
I_jpg_gray_contr = I_jpg_gray*1.5;

figure
subplot(1,2,1), imshow(I_jpg_gray);
title('Original')
subplot(1,2,2), imshow(I_jpg_gray_bright);
title('Brightness')
figure
subplot(1,2,1), imshow(I_jpg_gray);
title('Original')
subplot(1,2,2), imshow(I_jpg_gray_contr);
title('Contrast')

%% RGB

r = I_jpg(:,:,1);
g = I_jpg(:,:,2);
b = I_jpg(:,:,3);

r_bright = r + 30;
g_bright = g + 30;
b_bright = b + 30;
r_contr = r*1.5;
g_contr = g*1.5;
b_contr = b*1.5;

I_bright(:,:,1)= r_bright;
I_bright(:,:,2)= g_bright;
I_bright(:,:,3)= b_bright;
I_contr(:,:,1)= r_contr;
I_contr(:,:,2)= g_contr;
I_contr(:,:,3)= b_contr;

figure
subplot(4,2,1), imshow(I_jpg);
title('Original')
subplot(4,2,2), imshow(I_bright);
title('Brigthness')
subplot(4,2,3), imshow(r);
title('Red color')
subplot(4,2,4), imshow(r_bright);
subplot(4,2,5), imshow(g);
title('Green color')
subplot(4,2,6), imshow(g_bright);
subplot(4,2,7), imshow(b);
title('Blue color')
subplot(4,2,8), imshow(b_bright);

figure
subplot(4,2,1), imshow(I_jpg);
title('Original')
subplot(4,2,2), imshow(I_contr);
title('Contrast')
subplot(4,2,3), imshow(r);
title('Red color')
subplot(4,2,4), imshow(r_contr);
subplot(4,2,5), imshow(g);
title('Green color')
subplot(4,2,6), imshow(g_contr);
subplot(4,2,7), imshow(b);
title('Blue color')
subplot(4,2,8), imshow(b_contr);