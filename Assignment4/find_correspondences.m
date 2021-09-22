function [indices, distances] = find_correspondences(D1, D2)

indices = zeros(size(D1,1),1);
distances = zeros(size(D1,1),1);

for i = 1:size(D1,1)
    ind = 0;
    min = 1;
   for j = 1:size(D2,1)
       d = hellinger(D1(i,:).',D2(j,:).');
       if d < min
           min = d;
           ind = j;
       end
   end
   indices(i) = ind;
   distances(i) = min;
end

end