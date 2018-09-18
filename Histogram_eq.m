clear; clc;
I = imread('image1.jpg');
%% RGB equalization
figure
imshow(I)
title('Original image')

r = I(:,:,1);
g = I(:,:,2);
b = I(:,:,3);

hist_r = imhist(r);
hist_g = imhist(g);
hist_b = imhist(b);

eq_r = histeq(r);
eq_g = histeq(g);
eq_b = histeq(b);

eq_I(:,:,1)=eq_r;
eq_I(:,:,2)=eq_g;
eq_I(:,:,3)=eq_b;

figure
subplot(2,2,1) , imshow(I)
subplot(2,2,2) , plot(hist_r)
title('Red Histogram')
subplot(2,2,3) , plot(hist_g)
title('Green Histogram')
subplot(2,2,4) , plot(hist_b)
title('Blue Histogram')

figure
subplot(2,2,1) , imshow(eq_r)
title('Red equalization')
subplot(2,2,2) , imshow(eq_g)
title('Green equalization')
subplot(2,2,3) , imshow(eq_b)
title('Blue equalization')
subplot(2,2,4) , imshow(eq_I)
title('RGB equalization')
figure
imshowpair(I,eq_I,'montage')

%% Grayscale Equalization

I_gray=rgb2gray(I);
figure
imshow(I_gray, []);
title('Original grayscale')

hist_I_gray = imhist(I_gray);

CuHist_I_gray(1,1)= hist_I_gray (1,1);
for i=2:1:256
   CuHist_I_gray(i) = CuHist_I_gray(i-1)+hist_I_gray(i);
end

figure
subplot(2,1,1),plot(hist_I_gray)
title('Histogram')
subplot(2,1,2),plot(CuHist_I_gray)
title('Cumulative Histogram')

eq_I_gray = histeq(I_gray);
hist_eq_I_gray = imhist(eq_I_gray)

figure
subplot(2,2,1),imshow(I_gray)
title('original')
subplot(2,2,2),imhist(I_gray)
title('Histogram')
subplot(2,2,3),imshow(eq_I_gray)
title('Equalization')
subplot(2,2,4),imhist(eq_I_gray)
title('Equalization histogram')

