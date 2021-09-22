image = 24;
[M, n, m] = prepare_data('faces/2');
[U, Mu] = pca_dual(M);

components = [32, 16, 8, 4, 2, 1];

figure;
for i=1:length(components)
U1 = U;
%project to PCA space
Y = U1.'*(M - Mu);
%change one component
U1((components(i)+1):end,:) = 0;
%project back to original space
X = U1*Y + Mu;
I = reshape(X(:,image), [n, m]);
subplot(1,length(components),i); imagesc(I); colormap gray; axis equal; axis tight;
end