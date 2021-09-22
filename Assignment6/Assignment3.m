%a)
[M, n, m] = prepare_data('faces/1');

%b)
[U, Mu] = pca_dual(M);
images = 5;

U1 = U;
%project to PCA space
Y = U.'*(M - Mu);
%change one component
U(4047,:) = 0;
%project back to original space
X = U*Y + Mu;

figure;
for i=1:images
   I = reshape(U(:,i), [n, m]);
   subplot(1,images,i); imagesc(I); colormap gray; axis equal; axis tight;
end

dim = [1 2 3 4 5 4074];

figure;
for i=1:length(dim)
    U = U1;
    %project to PCA space
    Y = U.'*(M - Mu);
    %change one of the first five components
    U(dim(i),:) = 0;
    %project back to original space
    X = U*Y + Mu;
    I1 = reshape(X(:,1), [n, m]);
    I2 = reshape(M(:,1), [n, m]);
    subplot(1,length(dim),i); imagesc(I1); colormap gray; axis equal; axis tight;
end

%b)
%as3c.m
