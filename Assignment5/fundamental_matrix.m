function [F, e1, e2] = fundamental_matrix(x1, x2)
% Input: x1, x2 : 3xN N homogeneous points in 2D
% Output:
% F : 3x3 fundamental matrix: x2' * F * x1 = 0
% e1 : epipole in the first image: F * e1 = 0
% e2 : epipole in the second image: F' * e2 = 0

[px1, T1] = normalize_points(x1');
[px2, T2] = normalize_points(x2');
%px1 = x1;
%px2 = x2;
A = zeros(length(px1), 9);

for i = 1:length(px1)
    A(i,1) = px1(1,i)*px2(1,i);
    A(i,2) = px1(1,i)*px2(2,i);
    A(i,3) = px1(1,i);
    A(i,4) = px1(2,i)*px2(1,i);
    A(i,5) = px1(2,i)*px2(2,i);
    A(i,6) = px1(2,i);
    A(i,7) = px2(1,i);
    A(i,8) = px2(2,i);
    A(i,9) = 1;
end

[U, S, V] = svd(A);
v = V(:,9);
F = reshape(v,[3,3]);

[U, D, V] = svd(F);
D(end,end) = 0;
F = U*D*V';
F = T2'*F*T1;

[U, D, V] = svd(F);

e1 = V(:,3) / V(3,3);
e2 = U(:,3) / U(3,3);
