function M = find_matches2(I1, I2)

sigma = 5;
t = 5000;
bins = 16;
m = 41;

[Hess1, py1, px1] = hessian_points(I1, sigma, t);
[Hess2, py2, px2] = hessian_points(I2, sigma, t);
D1 = descriptors_maglap(I1, px1, py1, m, sigma, bins);
D2 = descriptors_maglap(I2, px2, py2, m, sigma, bins);
[indices1, distances1] = find_correspondences2(D1, D2);
[indices2, distances2] = find_correspondences2(D2,D1);

match = 1;
M = [];

for i=1:length(indices1)
       j = indices1(i);
        if indices2(j) == i && distances1(i) > 0.5
         M = [M; zeros(1,5)];
         M(match,1) = px1(i);
         M(match,2) = py1(i);
         M(match,3) = px2(j);
         M(match,4) = py2(j);
         M(match,5) = distances1(i);
         match = match + 1;
        end
end

size(M)

end