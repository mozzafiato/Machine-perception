I1 = imread('epipolar/library1.jpg');
I2 = imread('epipolar/library2.jpg');

sigma1 = 8;
sigma2 = 8;
t = 50;
bins = 16;
m = 41;
M = find_matches(rgb2gray(I1), rgb2gray(I2), sigma1, sigma2, t, bins, m);
figure; displaymatches(I1, M(:,1), M(:,2), I2, M(:,3), M(:,4));

eps = 15;
k = 100;
[F, e1, e2, px1, px2, error, p] = ransac_fundamental2(M(:,1:2), M(:,3:4), eps, k);

figure; subplot(1,2,1); imshow(rgb2gray(I1)); title('Outlier(red), Inliers(glue)');
hold on; plot(pairs(:,1), pairs(:,2), 'r.', 'MarkerSize', 10);
hold on; plot(px1(:,1), px1(:,2), 'b.', 'MarkerSize', 10);

subplot(1,2,2); imshow(rgb2gray(I2)); title(['Inliers: ', num2str(p*100), '1%, Error: ', num2str(error)]);
hold on; plot(pairs(:,3), pairs(:,4), 'r.', 'MarkerSize', 10);
hold on; plot(px2(:,1), px2(:,2), 'b.', 'MarkerSize', 10);

figure; displaymatches(I1, px1(:,1), px1(:,2), I2, px2(:,1), px2(:,2));

