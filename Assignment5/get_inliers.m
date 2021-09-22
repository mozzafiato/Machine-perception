function [x1in, x2in, error] = get_inliers(F, x1, x2, eps)
x1in = [];
x2in = [];
error = -1;
for i=1:length(x1)
    [d, d1, d2] = reprojection_error([x1(i,:), 1]', [x2(i,:), 1]', F);
    if (d1 < eps) & (d2 < eps)
        x1in = [x1in; x1(i,:)];
        x2in = [x2in; x2(i,:)];
        error = d;
    end
end