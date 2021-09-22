%Assignment

%a)Experiment with the sequence of the two operations (just erode
%or dilate, erode then dilate, and dilate then erode)
M = logical(imread('mask.png')); % Load a synthetic mask
SE = ones(3); % structuring element
%figure;
subplot(1, 4, 1);
imagesc(imerode(M, SE)); axis equal; axis tight; title('Erode');
subplot(1, 4, 2);
imagesc(imdilate(M, SE)); axis equal; axis tight; title('Dilate');
subplot(1, 4, 3);
imagesc(imerode(imdilate(M, SE), SE)); axis equal; axis tight; title('Dilate & Erode');
subplot(1, 4, 4); 
imagesc(imdilate(imerode(M, SE), SE)); axis equal; axis tight; title('Erode & Dilate');

%b)improve the mask that was obtained using global thresholding 
%Implement a closing operation which is composed of dilate and erode
Image = imread('bird.jpg');
I = double(rgb2gray(Image));
t = otsu(I);
M = I > t ;
SE = ones(20);
figure('Name','Closing: Dilte and Erode'); 
subplot(1,2,1); 
imagesc(M); axis equal; axis tight; title('Before');
subplot(1,2,2); 
M_mask = imerode(imdilate(M, SE), SE);
imagesc(M_mask); axis equal; axis tight; title('After');

%c) immask.m
figure; imshow(immask(Image, M_mask));

%d)w create a mask from the image eagle.jpg and 
%visualize the result with immask
I = imread('eagle.jpg');
Id = double(rgb2gray(I));
t = otsu(Id);
M = Id < t ; %the sign is changed to <
figure; clf; subplot(1,2,1); imagesc(M); axis equal; axis tight;
SE = ones(9);
I_mask = imerode(imdilate(M, SE), SE);
subplot(1,2,2); imagesc(I_mask); axis equal; axis tight;
figure; clf; imagesc(immask(I,I_mask));

%e) bwlabel_srcipt.m

%f) candy.m

