%a)
I = imread('test_points.jpg');
I = rgb2gray(I);
sigma = 3;
t = 250;
[Hess, px, py] = hessian_points(I, sigma, t);
figure; subplot(2,3,1); imagesc(Hess); axis tight; axis equal; colormap gray; title('Hessian \sigma=3');
subplot(2,3,4); imshow(I); hold on;
plot(py, px, 'r+', 'LineWidth', 2, 'MarkerSize', 1);
sigma = 6;
t = 250;
[Hess, px, py] = hessian_points(I, sigma, t);
subplot(2,3,2); imagesc(Hess); axis tight; axis equal; colormap gray; title('Hessian \sigma=6');
subplot(2,3,5); imshow(I); hold on;
plot(py, px, 'r+', 'LineWidth', 2, 'MarkerSize', 1);
sigma = 9;
t = 250;
[Hess, px, py] = hessian_points(I, sigma, t);
subplot(2,3,3); imagesc(Hess); axis tight; axis equal; colormap gray; title('Hessian \sigma=9');
subplot(2,3,6); imshow(I); hold on;
plot(py, px, 'r+', 'LineWidth', 2, 'MarkerSize', 1);

%b)
sigma = 3;
t = 250;
[Harr, px, py] = harris_points(I, sigma, t);
figure; subplot(2,3,1); imagesc(Harr); axis tight; axis equal; colormap gray; title('Harris \sigma=3');
subplot(2,3,4); imshow(I); hold on;
plot(py, px, 'r+', 'LineWidth', 2, 'MarkerSize', 1);
sigma = 6;
t = 250;
[Harr, px, py] = harris_points(I, sigma, t);
subplot(2,3,2); imagesc(Harr); axis tight; axis equal; colormap gray; title('Harris \sigma=6');
subplot(2,3,5); imshow(I); hold on;
plot(py, px, 'r+', 'LineWidth', 2, 'MarkerSize', 1);
sigma = 9;
t = 250;
[Harr, px, py] = harris_points(I, sigma, t);
subplot(2,3,3); imagesc(Harr); axis tight; axis equal; colormap gray; title('Harris \sigma=9');
subplot(2,3,6); imshow(I); hold on;
plot(py, px, 'r+', 'LineWidth', 2, 'MarkerSize', 1);

