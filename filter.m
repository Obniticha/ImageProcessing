clear; clc;
I_jpg = imread('image1.jpg');
I_jpg_gray = rgb2gray(I_jpg);
[m,n] = size(I_jpg_gray);
%% box filter 
box = [1 1 1;1 1 1;1 1 1];
[r,c] = size(box);
if (r==c)
    pad = r-1;
    shift = pad/2;
end
dim = r*c;
I_gray_pad = zeros(m+pad,n+pad);
I_gray_filter = zeros(m,n);
for i = 1:m
    for j = 1:n
        I_gray_pad(i+shift,j+shift) = I_jpg_gray(i,j);
    end
end
for i = 1:m
    for j = 1:n
        sum = 0;
        for p = i:i+pad
            for q = j:j+pad
                sum = sum + I_gray_pad(p,q);
            end
        end
        I_gray_filter(i,j)= sum/dim;
    end
end
I_gray_filter = uint8(I_gray_filter);
figure
subplot(1,2,1), imshow(I_jpg_gray);
title('Original')
subplot(1,2,2), imshow(I_gray_filter);
title('Box filter')
%% scale and offset
scale = 0.5;
offset = 50;
I_so = (I_jpg_gray.*scale)+offset;
figure
subplot(1,2,1), imshow(I_jpg_gray);
title('Original')
subplot(1,2,2), imshow(I_so);
title('Scale and offset')
%% guassian filter
h = [0 1 2 1 0; 1 3 5 3 1;2 5 9 5 2; 1 3 5 3 1;0 1 2 1 0];
siz = 5;
pad = siz-1;
shift = pad/2;

I_gray_pad = zeros(m+pad,n+pad);
I_gray_filter = zeros(m,n);
for i = 1:m
    for j = 1:n
        I_gray_pad(i+shift,j+shift) = I_jpg_gray(i,j);
    end
end

for i = 1:m
    for j = 1:n
        mask = h.* I_gray_pad(i:i+pad,j:j+pad);
        total = sum(sum(mask));
        I_gray_filter(i,j)= total/sum(sum(h));
    end
end
I_gray_filter = uint8(I_gray_filter);
figure
subplot(1,2,1), imshow(I_jpg_gray);
title('Original')
subplot(1,2,2), imshow(I_gray_filter);
title('Gaussian filter')
%% Gaussian filter
siz = 5;
sig = 10;
pad = siz-1;
shift = pad/2;

if numel(siz)==1
siz = [siz siz];
end

d   = (siz-1)/2;                          
[x,y] = meshgrid(-d(2):d(2),-d(1):d(1));   

power   = -(x.^2 + y.^2)/(2*sig^2);             
h     = (exp(power))/sqrt(2*pi*(sig^2));
sumh = sum(h(:));                             
if sumh ~= 0,
h = h/sumh;
end
%h = h./max(h(:));
I_gray_pad = zeros(m+pad,n+pad);
I_gray_filter = zeros(m,n);

for i = 1:m
    for j = 1:n
        I_gray_pad(i+shift,j+shift) = I_jpg_gray(i,j);
    end
end

for i = 1:m
    for j = 1:n
        mask = h.* I_gray_pad(i:i+pad,j:j+pad);
        total = sum(sum(mask));
        I_gray_filter(i,j)= total/sum(sum(h));
    end
end
I_gray_filter = uint8(I_gray_filter);
figure
subplot(1,2,1), imshow(I_jpg_gray);
title('Original')
subplot(1,2,2), imshow(I_gray_filter);
title('Gaussian filter')
%% tool box guassian
siz = 5;
sig = 10;
sig2 = [1 2];

I_filter = imgaussfilt(I_jpg_gray,sig);
I_filter2 = imgaussfilt(I_jpg_gray,sig2);

figure
subplot(1,3,1), imshow(I_jpg_gray);
title('Original')
subplot(1,3,2), imshow(I_filter);
title('Guassian filter')
subplot(1,3,3), imshow(I_filter2);
title('Guassian filter')

%% maxican hat 
h = [0 0 -1 0 0;0 -1 -2 -1 0;-1 -2 16 -2 -1;0 -1 -2 -1 0;0 0 -1 0 0];
siz = 5;
pad = siz-1;
shift = pad/2;

I_gray_pad = zeros(m+pad,n+pad);
I_gray_filter = zeros(m,n);
for i = 1:m
    for j = 1:n
        I_gray_pad(i+shift,j+shift) = I_jpg_gray(i,j);
    end
end

for i = 1:m
    for j = 1:n
        mask = h.* I_gray_pad(i:i+pad,j:j+pad);
        total = sum(sum(mask));
        I_gray_filter(i,j)= total/sum(sum(h));
    end
end
I_gray_filter = uint8(I_gray_filter);
figure
subplot(1,2,1), imshow(I_jpg_gray);
title('Original')
subplot(1,2,2), imshow(I_gray_filter);
title('Gaussian filter')
%% Maxican hat
siz = 5;
sig = 0.5;
d   = (siz-1)/2;                           
[x,y] = meshgrid(-d:d,-d:d);   
h = (((2/(sqrt(3*sig)*pi^0.25)) .* (1-(x.^2+y.^2)/sig^2).* exp(-1/2 .* (x.^2+y.^2)/sig^2)));

pad = siz-1;
shift = pad/2;
dim = siz^2;

I_gray_pad = zeros(m+pad,n+pad);
I_gray_filter = zeros(m,n);

for i = 1:m
    for j = 1:n
        I_gray_pad(i+shift,j+shift) = I_jpg_gray(i,j);
    end
end

for i = 1:m
    for j = 1:n
        mask = h.* I_gray_pad(i:i+pad,j:j+pad);
        total = sum(sum(mask));
        I_gray_filter(i,j)= total/sum(sum(h));
    end
end
I_gray_filter = uint8(I_gray_filter);
figure
subplot(1,2,1), imshow(I_jpg_gray);
title('Original')
subplot(1,2,2), imshow(I_gray_filter);
title('Maxican hat filter')
%% tool maxican hat
sigma = 0.4;
alpha = 0.5;
I_gray_filter = locallapfilt(I_jpg_gray, sigma, alpha);
figure
subplot(1,2,1), imshow(I_jpg_gray);
title('Original')
subplot(1,2,2), imshow(I_gray_filter);
title('Maxican hat filter')