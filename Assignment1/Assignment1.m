%Assignment 1

%a)
%openning image 
A = imread('umbrellas.jpg');
%figure(1); clf; imagesc(A); 
%figure(2); clf; imshow(A);

%b)
%converting colored image to grayscale
Ad = double(A); % division operation not defined for uint8
[h,w,d] = size(A);
A_gray = uint8((Ad(:,:,1) + Ad(:,:,2) + Ad(:,:,3)) / 3.0);
figure; imshow(A_gray); % change image to 8-bit

%try colormaps 
figure; clf; imagesc(rgb2gray(A)); colormap(jet);
figure; clf; imagesc(rgb2gray(A)); colormap(bone);
figure; clf; imagesc(rgb2gray(A)); colormap(gray(256));

%c)
%cut out a rectangular sub-image and display it as a new image. Mark the same region
%in the original image by setting its third (blue) color channel to 0 and displaying
%the modifed image.
A1 = A;
A1(130:260,240:450,3) = 0 ;
figure; subplot(1,2,1); imshow(A1);
A2 = A(130:260,240:450, 1);
subplot(1,2,2); imshow(A2);

%d)
%display a grayscale image that has a region negated
A3 = A_gray;
A3(130:260,240:450) = 255 - A3(130:260,240:450) ;
figure('Name', 'Negative'); clf; imshow(A3);

%e)
%reduction of grayscale levels in image
A = imread('umbrellas.jpg');
Ad = double(A);
A_gray = (Ad(:,:,1) + Ad(:,:,2) + Ad(:,:,3)) / 3.0;
A_gray_red = uint8(A_gray * (63/255));
A_gray = uint8(A_gray);
%displaying with imshow
figure; subplot(1,2,1); imshow(A_gray);
subplot(1,2,2); imshow(A_gray_red);
%displaying with imagesc
figure; clf; subplot(1,2,1); imagesc(A_gray);
subplot(1,2,2); imagesc(A_gray_red);



