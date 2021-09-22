%a)
P = load('points.txt');
[U, Mu] = pca_dual(P);
%Compare
%[U1, S, V, Mu] = direct_pca_demo(P);
%U1
U = U(:,1:2);

%project to PCA
%Y = U.'*(P - Mu);
%remove eigenvector with lowest variance
%U(:,end) = 0;
%project back to original space
%X = U*Y + Mu;
%figure; clf; hold on; draw_reconstructions(P, X);

%b)
%project to PCA
Y = U.'*(P - Mu);
%project back to original space
X = U*Y + Mu;
figure; clf; hold on; draw_reconstructions(P, X);
