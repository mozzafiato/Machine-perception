I1 = imread('epipolar/house1.jpg');
I2 = imread('epipolar/house2.jpg');
pairs = load('epipolar/house_matches.txt');

eps = 5.0;
k = 100;
p = 0.71;
[F, e1, e2, px1, px2, error] = ransac_fundamental(pairs(:,1:2), pairs(:,3:4), eps, k, p);


pL = [px1(4,:) 1]';
pR = [px2(4,:) 1]';
lineR = F*pL;

figure; subplot(1,2,1); imshow(rgb2gray(I1)); title('Outlier(red), Inliers(glue), Selected(green)');
hold on; plot(pairs(:,1), pairs(:,2), 'r.', 'MarkerSize', 10);
hold on; plot(px1(:,1), px1(:,2), 'b.', 'MarkerSize', 10);
hold on; plot(pL(1), pL(2), 'g.', 'MarkerSize', 10);

subplot(1,2,2); imshow(rgb2gray(I2)); title(['Inliers: 0.71%, Error: ' num2str(error)]);
hold on; plot(pairs(:,3), pairs(:,4), 'r.', 'MarkerSize', 10);
hold on; plot(px2(:,1), px2(:,2), 'b.', 'MarkerSize', 10);
hold on; draw_line(lineR, size(I2, 2), size(I2, 1), 'g');
hold on; plot(pR(1), pR(2), 'g.', 'MarkerSize', 10);
