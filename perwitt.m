clear; clc;
I_jpg = imread('image1.jpg');
I_jpg_gray = rgb2gray(I_jpg);
I_jpg_gray8 = im2uint8(I_jpg_gray);
I_jpg_grayd = double(I_jpg_gray8);
[m,n] = size(I_jpg_gray);
%%
I_pad = zeros(m+2,n+2);
I_new = zeros(m,n);
mask = zeros(3,3);

hx = [-1 0 1;-1 0 1; -1 0 1];
hy = [-1 -1 -1; 0 0 0; 1 1 1];

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
        sumn_x = 0;
        sumn_y = 0;
        d_x = mask.*hx; 
        d_y = mask.*hy; 
        sumn = 0;
        for k = 1:length(d_x)
            for l = 1:length(d_y)
                sumn_x = sumn_x+d_x(k,l);
                sumn_y = sumn_y+d_y(k,l);
            end
         end

        sumn_x = sumn_x*(1/6);
        sumn_y = sumn_y*(1/6);

        I_new(i,j) = sqrt((sumn_x^2)+(sumn_y^2));
    end
end
I_new = uint8(I_new);
I_invert = 255 - I_new;
imshow(I_invert)