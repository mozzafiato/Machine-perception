%a) descriptors_maglap

%b)
I1 = imread('graf/graf1_small.jpg');
I2 = imread('graf/graf2_small.jpg');
I1 = rgb2gray(I1);
I2 = rgb2gray(I2);
sigma = 3;
t = 100;
bins = 16;
m = 41;
[Hess1, py1, px1] = hessian_points(I1, sigma, t);
[Hess2, py2, px2] = hessian_points(I2, sigma, t);
D1 = descriptors_maglap(I1, px1, py1, m, sigma, bins);
D2 = descriptors_maglap(I2, px2, py2, m, sigma, bins);
[indices, distances] = find_correspondences(D1, D2);
px2 = px2(indices);
py2 = py2(indices);
displaymatches(I1, px1, py1, I2, px2, py2);

%c)
M = find_matches(I1,I2, sigma, sigma, t, bins, m);
displaymatches(I1, M(:,1), M(:,2), I2, M(:,3), M(:,4));

M = find_matches2(I1,I2)
M = sortrows(M, 5);
M = M(1:min(size(M,1),10),:);
figure; displaymatches(I1, M(:,1), M(:,2), I2, M(:,3), M(:,4));
