function [indices, distances] = find_correspondences2(D1, D2)

indices = zeros(size(D1,1),1);
distances = zeros(size(D1,1),1);

for i = 1:size(D1,1)
    [ind1, d1, ind2, d2] = two_most_similar(D1(i,:), D2);
    ratio = d1/d2;
    indices(i) = ind1;
    distances(i) = ratio;
end

end