%Question
F = load('epipolar/house_fundamental.txt');
pL1 = [120; 300; 1];
lR1 = F.'*pL1;
pL2 = [170; 300; 1];
lR2 = F.'*pL2;
A = [lR1.' ; lR2.'];
[U, S, V] = svd(A);
intersection = V(:,3);

%a) fundamental_matrix.m

%b) 
pairs = load('epipolar/house_points.txt');
I1 = imread('epipolar/house1.jpg');
I2 = imread('epipolar/house2.jpg');
[F, e1, e2] = fundamental_matrix(pairs(:,1:2), pairs(:,3:4));

pL = [85; 233; 1];

lineR = F*pL;

figure; subplot(1,2,1); imshow(rgb2gray(I1)); title('Left image');
hold on; plot(pairs(:,1), pairs(:,2), 'r.', 'MarkerSize', 10);
hold on; plot(pL(1), pL(2), 'gx', 'MarkerSize', 10);
subplot(1,2,2); imshow(rgb2gray(I2)); title('Right image');
hold on; plot(pairs(:,3), pairs(:,4), 'r.', 'MarkerSize', 10);
hold on; draw_line(lineR, size(I2, 2), size(I2, 1), 'g');

%c) reprojection.m
x1 = [85; 233; 1];
x2 = [67; 219; 1];
reprojection(pairs, x1, x2)

%d) get_inliers.m

%e) ransac.m

%f) find_matches_ransac


