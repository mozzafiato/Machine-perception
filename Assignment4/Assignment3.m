%a) H = estimate_homography(px1, py1, px2, py2)

%b)
I1 = imread('newyork/newyork1.jpg');
I2 = imread('newyork/newyork2.jpg');
M = load('newyork/newyork.txt');
displaymatches(I1, M(:,1), M(:,2), I2, M(:,3), M(:,4));
H = estimate_homography(M(:,1), M(:,2), M(:,3), M(:,4));
IT = transform_homography(I1, H);
displaymatches(I1, M(:,1), M(:,2), IT, M(:,3), M(:,4));
%G1 = imread('graf/graf1.jpg');
%I1 = rgb2gray(G1);
%G2 = imread('graf/graf2.jpg');
%I2 = rgb2gray(G2);
%M = load('graf/graf.txt');
%figure; displaymatches(G1, M(:,1), M(:,2), G2, M(:,3), M(:,4));
%H = estimate_homography(M(:,1), M(:,2), M(:,3), M(:,4));

%c)
sigma = 4;
t = 5000;
m = 41;
bins = 16;
M = find_matches(I1,I2, sigma, sigma, t, bins, m);
M = sortrows(M, 5);
M = M(1:5,:);
figure; displaymatches(I1, M(:,1), M(:,2), I2, M(:,3), M(:,4));
figure; subplot(1,3,1); imagesc(I1); axis tight; axis equal; colormap gray; title('I1');
subplot(1,3,2); imagesc(I2); axis tight; axis equal;  colormap gray; title('I2');
H = estimate_homography(M(:,1), M(:,2), M(:,3), M(:,4));
IT = transform_homography(I1, H);
subplot(1,3,3); imagesc(uint8(IT)); axis tight; axis equal;  colormap gray; title('I1 to I2');
figure; displaymatches(I1, M(:,1), M(:,2), IT, M(:,3), M(:,4));

%d) panorama.m
