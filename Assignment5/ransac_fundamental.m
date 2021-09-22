function [F, e1, e2, px1, px2, error] = ransac_fundamental(x1, x2, eps, k,percentage)
% Input:
% x1, x2 : 3xN matrix of N homogeneous points v 2D space
% eps : threshold for inliers
% k : number of iterations
% Output:
% F : 3x3 fundamental matrix: x2' * F * x1 = 0
% e1 : epipole in image 1: F * e1 = 0
% e2 : epipole in image 2: F' * e2 = 0
% x1, x2 : 3xNi matrix of Ni homogeneous inlier points

for i=1:k
    randomIndices = randperm(length(x1), 8);
    [F, e1, e2] = fundamental_matrix(x1(randomIndices,:), x2(randomIndices,:));
    [x1in, x2in, error] = get_inliers(F, x1, x2, eps);
    p = length(x1in)/length(x1);
    if p >= percentage
        px1 = x1in;
        px2 = x2in;
        [F, e1, e2] = fundamental_matrix(x1in, x2in);
        fprintf('Converged to optimal F\n')
        break
    end
    if i == k
       fprintf('Reached maximal interations\n') 
    end
end

end