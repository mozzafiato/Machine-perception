%Applying Gaussian filter on first image
I = imread('cat1.jpg');
figure; subplot(1,2,1); imshow(I);
r = squeeze(I(:,:,1));
g = squeeze(I(:,:,2));
b = squeeze(I(:,:,3));
sigma = 5; %for this example we will use this value
Ir = gaussfilter(double(r), 5);
Ig = gaussfilter(double(g), 5);
Ib = gaussfilter(double(b), 5);
Im1 = cat(3, uint8(Ir), uint8(Ig), uint8(Ib));
subplot(1,2,2); imshow(Im1);

%Applying Laplacian filter on second image
I = imread('cat2.jpg');
figure; subplot(1,2,1); imshow(I);
unit_impulse = [0 0 0; 0 1 0; 0 0 0];
gaussian = fspecial('gaussian', 3, sigma)
%gaussian = gaussian./max(max(gaussian))
kernel = unit_impulse - gaussian;
r = squeeze(I(:,:,1));
g = squeeze(I(:,:,2));
b = squeeze(I(:,:,3));

Ir = conv2(double(r), kernel , 'same');
Ig = conv2(double(g), kernel , 'same');
Ib = conv2(double(b), kernel , 'same');
Im2 = cat(3, uint8(Ir), uint8(Ig), uint8(Ib));
subplot(1,2,2); imshow(Im2); 

Ifinal = double(Im1) + double(Im2); 
figure; imshow(uint8(Ifinal)); 



