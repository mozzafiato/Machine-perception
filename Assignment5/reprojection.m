function reprojection(points, x1, x2)

[F, e1, e2] = fundamental_matrix(points(:,1:2), points(:,3:4));

%i)
d = reprojection_error(x1, x2, F)

%ii)
s = 0;
for i=1:length(points)
    points(i,1:2);
    points(i,3:4);
    d = reprojection_error([points(i,1:2), 1]', [points(i,3:4), 1]', F);
    s = s + d;
end
avgD = s / length(points)

end