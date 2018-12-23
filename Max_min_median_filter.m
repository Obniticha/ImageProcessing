clear; clc;
I = imread('image11.png');
I_gray = rgb2gray(I);
[m,n] = size(I_gray);
mask = 3;
shift = mask-1/2;
%% minimum maximum and median tool
I_gray_min = ordfilt2(I_gray,1,ones(3,3));
I_gray_max = ordfilt2(I_gray,9,ones(3,3));
I_gray_med = ordfilt2(I_gray,5,ones(3,3));

figure
subplot(2,2,1), imshow(I_gray);
title('Original')
subplot(2,2,2), imshow(I_gray_min);
title('Minimum filter')
subplot(2,2,3), imshow(I_gray_max);
title('Maximum filter')
subplot(2,2,4), imshow(I_gray_med);
title('Median filter')
%%

I_mask = zeros(m+mask,n+mask);
I_min = zeros(m,n);
I_max = zeros(m,n);
I_med = zeros(m,n);
for i = 1:m
    for j=1:n
        I_mask(i+1,j+1)=I_gray(i,j);
    end
end

pad = zeros(3,3);
for i = 1:m
    for j = 1:n
        pad = I_mask(i:i+2,j:j+2);
        low = min(pad(:));
        high = max(pad(:));
        med = median(pad(:));
        I_min(i,j) = low;
        I_max(i,j) = high;
        I_med(i,j) = med;
    end
end

figure
subplot(2,2,1), imshow(I_gray);
title('Original')
subplot(2,2,2), imshow(I_min);
title('Minimum filter')
subplot(2,2,3), imshow(I_max);
title('Maximum filter')
subplot(2,2,4), imshow(I_med);
title('Median filter')