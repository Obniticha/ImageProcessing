clear; clc;
I_jpg = imread('image1.jpg');
I_jpg_gray = rgb2gray(I_jpg);
[m,n] = size(I_jpg_gray);
I_pad = zeros(m+2,n+2);
I_dil = zeros(m,n);
I_ero = zeros(m,n);
I_med = zeros(m+2,n+2);
h = [1 1 1; 1 2 1; 1 1 1];

for i = 1:m
       for j = 1:n
        I_pad(i+1,j+1) = I_jpg_gray(i,j);
       end
end
%%
for i = 1:m
    for j = 1:n
        pad = zeros(3,3);
        for k = i:i+2
            for l = j:j+2
                pad(k-i+1,l-j+1)=I_pad(k,l);
            end
        end
        plus = pad+h; high = max(max(plus));
        minus = pad-h;low = min(min(minus));
        if (max(max(plus))>255)
            high = 255;
        end
        if (min(min(minus))<0)
            low = 0;
        end
        I_dil(i,j) = high;
        I_ero(i,j) = low;
    end
end
I_dil = uint8(I_dil);
I_ero = uint8(I_ero);
figure
subplot(1,3,1),imshow(I_jpg_gray)
title('Original image')
subplot(1,3,2),imshow(I_dil)
title('Dilation')
subplot(1,3,3),imshow(I_ero)
title('Erosion')
%% opening
for i = 1:m
    for j = 1:n
        pad = zeros(3,3);
        for k = i:i+2
            for l = j:j+2
                pad(k-i+1,l-j+1)=I_pad(k,l);
            end
        end
        
        minus = pad-h;low = min(min(minus));
        
        if (min(min(minus))<0)
            low = 0;
        end
        I_ero(i,j) = low;
    end
end
for i = 1:m
       for j = 1:n
        I_med(i+1,j+1) = I_ero(i,j);
       end
end
for i = 1:m
    for j = 1:n
        pad = zeros(3,3);
        for k = i:i+2
            for l = j:j+2
                pad(k-i+1,l-j+1)=I_med(k,l);
            end
        end
        plus = pad+h; high = max(max(plus));    
        if (max(max(plus))>255)
            high = 255;
        end  
        I_dil(i,j) = high;
    end
end
I_dil = uint8(I_dil);
subplot(1,2,1),imshow(I_jpg_gray)
title('Original image')
subplot(1,2,2),imshow(I_dil)
title('Opening')
%% Closing
for i = 1:m
    for j = 1:n
        pad = zeros(3,3);
        for k = i:i+2
            for l = j:j+2
                pad(k-i+1,l-j+1)=I_pad(k,l);
            end
        end
         plus = pad+h; high = max(max(plus));    
        if (max(max(plus))>255)
            high = 255;
        end  
        I_dil(i,j) = high;
        
    end
end
for i = 1:m
       for j = 1:n
        I_med(i+1,j+1) = I_dil(i,j);
       end
end
for i = 1:m
    for j = 1:n
        pad = zeros(3,3);
        for k = i:i+2
            for l = j:j+2
                pad(k-i+1,l-j+1)=I_med(k,l);
            end
        end
        minus = pad-h;low = min(min(minus));
        
        if (min(min(minus))<0)
            low = 0;
        end
        I_ero(i,j) = low;
    end
end
I_ero = uint8(I_ero);
subplot(1,2,1),imshow(I_jpg_gray)
title('Original image')
subplot(1,2,2),imshow(I_ero)
title('Closing')