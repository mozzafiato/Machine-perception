function H = estimate_homography(px1, py1, px2, py2)

px1 = px1(:); py1 = py1(:);
px2 = px2(:); py2 = py2(:);

A = zeros(2*length(px1), 9);

ind = 1;
for i=1:2:length(px1)*2
    A(i,1) = px1(ind);
    A(i,2) = py1(ind);
    A(i,3) = 1;
    A(i,7) = (-1)*px1(ind)*px2(ind);
    A(i,8) = (-1)*px2(ind)*py1(ind);
    A(i,9) = (-1)*px2(ind);
    
    A(i+1,4) = px1(ind);
    A(i+1,5) = py1(ind);
    A(i+1,6) = 1;
    A(i+1,7) = (-1)*py2(ind)*px1(ind);
    A(i+1,8) = (-1)*py2(ind)*py1(ind);
    A(i+1,9) = (-1)*py2(ind);
    ind = ind + 1;
end

[U, S, V] = svd(A);
h = V(:,end).'/V(end,end);
H = reshape(h,[3,3]);
H = H.';

end