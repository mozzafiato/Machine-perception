F = load('epipolar/house_fundamental.txt')
pL1 = [120; 300; 1];
lR1 = F.'*pL1;
pL2 = [170; 300; 1];
lR2 = F.'*pL2;
A = [lR1.' ; lR2.']
[U, S, V] = svd(A)
e = V(:,3)
