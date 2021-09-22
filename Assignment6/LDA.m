[M1, n, m] = prepare_data('faces/1');
[M2, n, m] = prepare_data('faces/2');
[M3, n, m] = prepare_data('faces/3');

c = 3;
n = 64;
X = [M1 M2 M3];

%PCA
[U, Mu, C] = pca_dual(X);
U1 = U;
size(U1)
U = U(:,1:2);
Y = U.'*(X - Mu);
figure; subplot(1,2,1); plot(Y(1,1:64),Y(2,1:64),'r.'); hold on;
plot(Y(1,65:128),Y(2,65:128),'g.'); hold on;
plot(Y(1,129:end),Y(2,129:end),'b.'); hold off; axis tight; axis equal; title('PCA');

U1 = U1(:,1:30);
X = U1.'*(X - Mu);
[W,Ms,MM] = f_lda(X,c,n);
Y = W.'*(X-MM);

subplot(1,2,2); plot(Y(1,1:64),Y(2,1:64),'r.'); hold on;
plot(Y(1,65:128),Y(2,65:128),'g.'); hold on;
plot(Y(1,129:end),Y(2,129:end),'b.'); axis tight; axis equal; title('LDA');