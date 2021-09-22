
images = ["panorama/panorama1.jpg", "panorama/panorama2.jpg", 'panorama/panorama3.jpg', 'panorama/panorama4.jpg', 'panorama/panorama5.jpg', 'panorama/panorama6.jpg'];

I1 = imread(images(1)); G1 = rgb2gray(I1);
I2 = imread(images(2)); G2 = rgb2gray(I2);
I3 = imread(images(3)); G3 = rgb2gray(I3);
I4 = imread(images(4)); G4 = rgb2gray(I4);
I5 = imread(images(5)); G5 = rgb2gray(I5);
I6 = imread(images(6)); G6 = rgb2gray(I6);

sigma1 =4;
sigma2 =4;
t = 3000;
bins = 16;
m = 41;

M = find_matches(G2,G1,sigma1, sigma2, t, bins, m);
H = estimate_homography(M(:,1), M(:,2), M(:,3), M(:,4));
IM1 = merge_homography(I1,I2, H);
figure; imshow(IM1);

M = find_matches(G4,G3,sigma1, sigma2, t, bins, m);
H = estimate_homography(M(:,1), M(:,2), M(:,3), M(:,4));
IM2 = merge_homography(I3,I4, H);
figure; imshow(IM2);

M = find_matches(G6,G5,sigma1, sigma2, t, bins, m);
H = estimate_homography(M(:,1), M(:,2), M(:,3), M(:,4));
IM3 = merge_homography(I5,I6, H);
figure; imshow(IM3);
IM3 = IM3(1:end-50,:,:);

M = find_matches(rgb2gray(IM3), rgb2gray(IM2),sigma1, sigma2, t, bins, m);
M = M(1:5,:);
H = estimate_homography(M(:,1), M(:,2), M(:,3), M(:,4));
IG1 = merge_homography(IM2,IM3, H);
figure; imshow(IG1);

%IM1 = IM1(1:min(size(IM1,1), size(IG1,1)), :, :);
%IG1 = IG1(1:min(size(IM1,1), size(IG1,1)), :, :);

M = find_matches(rgb2gray(IG1), rgb2gray(IM1),sigma1, sigma2, t, bins, m);
%M = M(1:5,:);
H = estimate_homography(M(:,1), M(:,2), M(:,3), M(:,4));
figure; displaymatches(IG1, M(:,1), M(:,2), IM1, M(:,3), M(:,4));
IG2 = merge_homography(IM1,IG1, H);
figure; imshow(IG2);
%figure; imshow(IG2(1:end-250,1:end-500,:));


