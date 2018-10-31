clear; clc;
I_jpg = imread('image1.jpg');

%% Grayscale histogram

I_jpg_gray = rgb2gray(I_jpg);
ath = 100;
[m,n] = size(I_jpg_gray);

for i = 1:m
    for j = 1:n
        a = I_jpg_gray(i,j);
        if(a<ath)
            I_thr(i,j) = 0;
        else
            I_thr(i,j) = 255;
        end
    end
end

figure
subplot(1,2,1), imshow(I_jpg_gray);
title('Original')
subplot(1,2,2), imshow(I_thr);
title('Threshold operation')