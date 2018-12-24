clear; clc;
I_jpg = imread('image7.jpg');
I_jpg_gray = rgb2gray(I_jpg);
[m,n] = size(I_jpg_gray);

I_pad = zeros(m+2,n+2);
I_new = zeros(m,n);
mask = zeros(3,3);

h0 = [-1 0 1;-2 0 2; -1 0 1];
h1 = [-2 -1 0; -1 0 1; 0 1 2];
h2 = [-1 -2 -1; 0 0 0; 1 2 1];
h3 = [0 -1 -2; 1 0 -1; 2 1 0];

for i = 1:m
       for j = 1:n
        I_pad(i+1,j+1) = I_jpg_gray(i,j);
       end
end

%% convolution filter
for i = 1:m
    for j = 1:n
        for k = i:i+2
            for l = j:j+2
                mask(k-i+1,l-j+1) = I_pad(k,l);
            end
        end
       
        d0 = mask.*h0; 
        d1 = mask.*h1; 
        d2 = mask.*h2; 
        d3 = mask.*h3; 
        sumn = zeros(4,1);
        sumn(1) = sum(sum(d0));
        sumn(2) = sum(sum(d1));
        sumn(3) = sum(sum(d2));
        sumn(4) = sum(sum(d3));

        sumn = abs(sumn*1/8);
        I_new(i,j)=max(sumn);
    end
end
I_new = im2uint8(I_new);
I_invert = 255 - I_new;
figure
subplot(1,3,1), imshow(I_jpg_gray);
title('Original')
subplot(1,3,2), imshow(I_new);
title('Compass operation')
subplot(1,3,3), imshow(I_invert);
title('Inverting')