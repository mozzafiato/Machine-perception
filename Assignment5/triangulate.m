function X = triangulate(pts_1, pts_2, P_1, P_2)
% Input:
% pts_1 ... 3xN left camera points in homogeneous coordinates
% pts_2 ... 3xN right camera points in homogeneous coordinates
% P_1 ... 3x4 calibration matrix of the left camera
% P_2 ... 3x4 calibration matrix of the right camera
% Output:
% X ... 4XN vector of 3D points in homogeneous coordinates

X = [] ;
for i = 1 : size(pts_1,2)
a1 = cross_form(pts_1(:,i)) ;
a2 = cross_form(pts_2(:,i)) ;
c1 = a1*P_1 ;
c2 = a2*P_2 ;
A = [ c1(1:2,:); c2(1:2,:) ] ;
% TODO: perform SVD decomposition of matrix A
[U, S, V] = svd(A);
x = V(:,end);
% store the solution in vector X
X = [X, x] ;
end
for i=1:size(X,2)
   X(:,i) = X(:,i)/X(4,i); 
end