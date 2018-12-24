clear; clc;
I_jpg = imread('image1.jpg');
BW = im2bw(I_jpg,0.5);
%% open and close
SE2 = strel('rectangle',[20 20]);
BW2 = imopen(BW, SE2);
SE3 = strel('rectangle',[10 5]);
BW3 = imclose(BW,SE3);

figure
subplot(1,3,1),imshow(BW)
title('Original image')
subplot(1,3,2),imshow(BW2)
title('Opening operation')
subplot(1,3,3),imshow(BW3)
title('Closing operation')
%% erode and dilate
SE4 = strel('rectangle',[30 20]);
BW4 = imerode(BW,SE4);
SE5 = strel('rectangle',[20 10]);
BW5 = imdilate(BW,SE5);

figure
subplot(1,3,1),imshow(BW)
title('Original image')
subplot(1,3,2),imshow(BW4)
title('Erosion')
subplot(1,3,3),imshow(BW5)
title('Dilation')
