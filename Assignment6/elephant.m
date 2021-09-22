I = rgb2gray(imread('elephant.jpg'));
figure; subplot(1,2,1); imshow(I);

[M, n, m] = prepare_data('faces/1');
[U, Mu] = pca_dual(M);

E = double(reshape(I,[],1));

Y = U.'*(E- Mu);
X = U*Y + Mu;

I_nova = uint8(reshape(X, [n, m]));

subplot(1,2,2); imshow(I_nova); axis tight; axis equal; colormap gray;