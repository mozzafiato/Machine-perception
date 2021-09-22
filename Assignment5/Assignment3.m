%a)
pairs = load('epipolar/house_points.txt');
I1 = imread('epipolar/house1.jpg');
I2 = imread('epipolar/house2.jpg');

K1 = load('epipolar/house1_camera.txt');
K2 = load('epipolar/house2_camera.txt');

x1 = pairs(:, 1:2);
x1 = [x1 ones(size(x1,1),1)];
x2 = pairs(:, 3:4);
x2 = [x2 ones(size(x2,1),1)];

X1 = triangulate(x1', x2', K1, K2);
X2 = triangulate(x2', x1', K2, K1);

figure; subplot(1,3,1); imshow(rgb2gray(I1)); title('Left camera');
draw_points(x1);

subplot(1,3,2); imshow(rgb2gray(I2)); title('Right camera');
draw_points(x2); 
subplot(1,3,3); show_triangulation(X1); title('Triagulated 3D points');

%b) automatic_sparse_detection.m