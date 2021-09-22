function [U, Mu, C] = pca_dual(P)

Mu = mean(P,2);
Pd = P - Mu;
m = size(P,2);
C = (1/(m-1))*((Pd.')*Pd);
[U, S] = svd(C);
s = diag(S) + 1e-15; 
Si = diag(1 ./ sqrt(s * (m - 1)));
U =Pd*U*Si;
%n = size(P,1);
%U = U(1:n,1:n);

end