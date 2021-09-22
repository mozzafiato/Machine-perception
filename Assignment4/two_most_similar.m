function [ind1, s1, ind2, s2] = two_most_similar(h, D)
%finds two most similar
%to the histograms of descriptor D

s1 = 1;
s2 = 1;
ind1 = 0;
ind2 = 0;
for i=1:size(D,1)
    d = hellinger(h.' ,D(i,:).');
    if d < s1
        s2 = s1;
        ind2 = ind1;
        s1 = d;
        ind1 = i;
    elseif d < s2
        s2 = d;
        ind2 = i;
    end
end