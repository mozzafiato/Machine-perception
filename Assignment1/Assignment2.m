%Assignment2

%a)Manually find a suitable threshold for the image
A = rgb2gray(imread('bird.jpg'));
M = A > 60; 
figure; imagesc(M); 

%b)A script that loads an image, converts it to grayscale, 
%uses the myhist function to calculate image histogram and visualize it 
%Try with different number of bins
myhist_script('bird.jpg', 10)
myhist_script('bird.jpg', 100)

%c) bins defines the values on the x axis (from 0 to bins)
% hist sorts the elements of vector P into the number of bins specified by the parameter bins.
I = double(rgb2gray(imread('umbrellas.jpg')));
P = I(:);
bins = 10 ;
H = hist(P, bins);
figure(1); clf; subplot(1,3,1); bar(H, 'b');
bins = 20 ;
H = hist(P, bins);
subplot(1,3,2); bar(H, 'b');
bins = 40 ;
H = hist(P, bins);
subplot(1,3,3); bar(H, 'b');

%d) Visualize the result of myhist and hist
I = double(rgb2gray(imread('bird.jpg')));
P = I(:);
bins = 25;
%hist has vector (sequence of numbers) as input
%uses equally spaced bins along the x-axis
%uses minimum and maximum values of x
H1 = hist(P, bins);
figure(1); clf; subplot(1,2,1); bar(H1, 'b');
%myhist has 2D grayscale image as input
%assumes that it knows the highest and lowest values
H2 = myhist(I, bins);
subplot(1,2,2); bar(H2, 'b');

%e)Test myhist function on images of the same scene in
%different lighting conditions
myhist_script('image1.jpg', 120);
myhist_script('image2.jpg',120);
myhist_script('image3.jpg',120);

%f)Convert the image to grayscale, calculate threshold using otsu function 
%and apply the threshold to obtain a mask. Display the mask using imagesc
I = double(rgb2gray(imread('bird.jpg')));
t = otsu(I);
M = I > t ;
figure; imagesc(M);


