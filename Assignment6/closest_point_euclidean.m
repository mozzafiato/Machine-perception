function [point, ind] = closest_point_euclidean(Q,P)

min = 100;
ind = 0;
for i=1:length(P)
    D = norm(P(:,i) - Q);
    if D < min 
        min = D;
        ind = i;
    end
end

point = P(:,ind);

end