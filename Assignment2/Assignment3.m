%a) Removing noise with Gaussian kernel
A = rgb2gray(imread('lena.png'));
Icg = imnoise(A,'gaussian', 0, 0.01); % Gaussian noise
figure;
subplot(2,2,1); imshow(Icg); colormap gray;
axis equal; axis tight; title('Gaussian noise');
Ics = imnoise(A,'salt & pepper', 0.1); % Salt & pepper noise
subplot(2,2,2) ; imshow(uint8(Ics)); colormap gray;
axis equal; axis tight; title('Salt and pepper');
gaussfilter(double(Icg),1);
Icg_b = gaussfilter(double(Icg), 1);
Ics_b = gaussfilter(double(Ics), 1);
subplot(2,2,3) ; imshow(uint8(Icg_b)); colormap gray;
axis equal; axis tight; title('Filtered') ;
subplot(2,2,4) ; imshow(uint8(Ics_b)); colormap gray;
axis equal; axis tight; title('Filtered');

%b)Sharpening image with Laplacian
I = imread('museum.jpg');
g = -1*ones(3)/9;
g(2,2) = 17/9;
Is = double(rgb2gray(I)); 
Isharp = conv2(Is, g , 'same');
figure; subplot(1,2,1); imshow(uint8(Is)); title('Original');
subplot(1,2,2); imshow(uint8(Isharp)); title('Sharpened');

%c)Median filter
x = [zeros(1, 14), ones(1, 11), zeros(1, 15)]; % Input signal
xc = x; xc(11) = 5; xc(18) = 5; % Corrupted signal
figure;
subplot(1, 4, 1); plot(x); axis([1, 40, 0, 7]); title('Input');
subplot(1, 4, 2); plot(xc); axis([1, 40, 0, 7]); title('Corrupted');
g = gauss(1);
x_g = conv(xc, g, 'same');
x_m = simple_median(xc, 5);
subplot(1, 4, 3); plot(x_g); axis([1, 40, 0, 7]); title('Gauss');
subplot(1, 4, 4); plot(x_m); axis([1, 40, 0, 7]); title('Median');

%d) 
I = rgb2gray(imread('piano.jpg'));
Inoise = imnoise(I,'gaussian', 0, 0.01);
figure; subplot(2,3,1); imshow(uint8(Inoise)); title('Gaussian noise');
Ig = gaussfilter(double(I), 1); subplot(2,3,2); imshow(uint8(Ig)); title('Gaussian filter');
Im = median2D(Inoise, 4); subplot(2,3,3); imshow(uint8(Im)); title('Median filter');
Inoise = imnoise(I,'salt & pepper', 0.1);
subplot(2,3,4); imshow(uint8(Inoise)); title('Salt and pepper');
Ig = gaussfilter(double(I), 1); subplot(2,3,5); imshow(uint8(Ig)); title('Gaussian filter');
Im = median2D(Inoise, 4); subplot(2,3,6); imshow(uint8(Im)); title('Median filter');

%Complexity (image nxn)
%   gaussfilter: 2*n^2*r  (r legnth of the gauss kernel)
%   median2D:    n^2*w^2log(w^2)

%e) 
%hybrid.m


