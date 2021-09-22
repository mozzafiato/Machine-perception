function M = find_matches(I1, I2, sigma1, sigma2, t, bins, m)

[Hess1, py1, px1] = hessian_points(I1, sigma1, t);
[Hess2, py2, px2] = hessian_points(I2, sigma1, t);
D1 = descriptors_maglap(I1, px1, py1, m, sigma2, bins);
D2 = descriptors_maglap(I2, px2, py2, m, sigma2, bins);
[indices1, distances1] = find_correspondences(D1, D2);
[indices2, distances2] = find_correspondences(D2,D1);

match = 1;
M = [];

for i=1:length(indices1)
   j = indices1(i);
   if indices2(j) == i
       M = [M; zeros(1,5)];
       M(match,1) = px1(i);
       M(match,2) = py1(i);
       M(match,3) = px2(j);
       M(match,4) = py2(j);
       M(match,5) = distances1(i);
       match = match + 1;
   end
end

M = sortrows(M, 5);
%M = M(1:min(size(M,1),20),:);

end