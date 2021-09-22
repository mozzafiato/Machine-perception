%a) %b)
P = load('points.txt');
[U, S, ~, Mu] = direct_pca_demo(P)
P
%c)
H = sum(cumsum(S,2),1);
H = H / max(H);
figure; bar(1:length(H), H);

%d)
%project to PCA
Y = U.'*(P - Mu);
%remove eigenvector with lowest variance
U(:,end) = 0;
%project back to original space
X = U*Y + Mu;
figure; clf; hold on; draw_reconstructions(P, X);

%e) 
Q = [3;6];
[point, ind] = closest_point_euclidean(Q, P);
P1 = [P, Q];
[U, S, V, Mu] = direct_pca_demo(P1);
%remove the variation of the second eigenvector
U(:,2) = 0;
%project to subspace
Y = U.'*(P1 - Mu);
%project back to original space
Q1 = Y(:,end);
[point2, ind2] = closest_point_euclidean(Q1, Y(:,1:end-1));
X = U*Y + Mu;
figure; hold on; draw_reconstructions(P1, X);

