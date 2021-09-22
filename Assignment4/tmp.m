sigma1=3;
sigma2=3;
t = 100;
bins = 20;
m = 41;

IG1 = imread("p1.jpg");
IM3 = imread("p2.jpg");
M = find_matches(rgb2gray(IG1), rgb2gray(IM3),sigma1, sigma2, t, bins, m);
M = M(1:5,:);
H = estimate_homography(M(:,1), M(:,2), M(:,3), M(:,4));
figure; displaymatches(IG1, M(:,1), M(:,2), IM3, M(:,3), M(:,4));
%IG2 = merge_homography(IG1,IM3, H);
%figure; imshow(IG2);

