function [I_hess, px, py] = hessian_points( I, sigma, threshold)
%det(H(x, y)) = ?4(Ixx(x, y; ?)Iyy(x, y; ?) ? Ixy(x, y; ?)2)
[Ixx, Iyy, Ixy] = image_derivatives2(I, sigma);
I_hess = sigma^4*((Ixx.*Iyy) - Ixy.^2);

%nonmaxima supression
px = [];
py = [];

for i = 2:size(I_hess, 1)-1
    for j = 2:size(I_hess,2)-1
       M = I_hess(i-1:i+1, j-1:j+1);
       M(2,2) = 0;
       v = M(:);
       B = v>I_hess(i,j);
       if sum(B) == 0 && I_hess(i,j) >= threshold
           px = [px; i];
           py = [py; j];
       end
    end
end
end