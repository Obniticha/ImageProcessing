clear; clc;
I_jpg = imread('image1.jpg');

amin = 0;
amax = 255;
if length(size(I_jpg))==3
        I_jpg_gray=rgb2gray(I_jpg);
end
alow = min(min(I_jpg_gray));
ahigh = max(max(I_jpg_gray));

[m,n] = size(I_jpg_gray);
I_auto_contr = zeros(m,n);

for i=1:m
    for j=1:n
        a = I_jpg_gray(i,j);
        a1 = amin +((a - alow) * ((amax - amin) / (ahigh - alow)));
        I_auto_contr(i,j) = a1;
    end
end
I_auto_contr = uint8(I_auto_contr);
figure
subplot(1,2,1); imshow(I_jpg_gray);
title('Original')
subplot(1,2,2); imshow(I_auto_contr);
title('Auto-contrast')
