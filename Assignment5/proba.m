pairs = load('epipolar/library_matches.txt');
I1 = imread('epipolar/library1.jpg');
I2 = imread('epipolar/library2.jpg');

K1 = load('epipolar/library1_camera.txt');
K2 = load('epipolar/library2_camera.txt');

eps = 0.15;
k = 100;

px1 = [pairs(:,1:2) ones(size(pairs(:,1:2),1),1)];
px2 = [pairs(:,3:4) ones(size(pairs(:,3:4),1),1)];

[F, e1, e2, px1, px2, error] = ransac_fundamental2(px1, px2, eps, k);

figure; subplot(1,2,1); imshow(rgb2gray(I1)); title('Outlier(red), Inliers(blue)');
hold on; plot(pairs(:,1), pairs(:,2), 'r.', 'MarkerSize', 10);
hold on; plot(px1(:,1), px1(:,2), 'b.', 'MarkerSize', 10);

subplot(1,2,2); imshow(rgb2gray(I2)); title(['Inliers: 0.71%, Error: ' num2str(error)]);
hold on; plot(pairs(:,3), pairs(:,4), 'r.', 'MarkerSize', 10);
hold on; plot(px2(:,1), px2(:,2), 'b.', 'MarkerSize', 10);

px1 = [px1 ones(size(px1,1),1)];
px2 = [px2 ones(size(px2,1),1)];

X1 = triangulate(px1', px2', K1, K2);
X2 = triangulate(px2', px1', K2, K1);

figure; subplot(1,3,1); imshow(rgb2gray(I1)); title('Left camera');
draw_points(px1); 
subplot(1,3,2); imshow(rgb2gray(I2)); title('Right camera');
draw_points(px1); 
subplot(1,3,3); show_triangulation(X1); title('Triagulated 3D points');
