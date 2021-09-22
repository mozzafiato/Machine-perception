function Ig = median2D(I, W)
d = floor(W/2);
%round to next odd num;
y = 2*floor(W/2)+1
v = zeros(y, y);
v(d+1,d+1) = 1;
I = conv2(I, v)
for i = 1+d:size(I,1)-d
    for j = 1+d:size(I,2)-d
        Ig(i-d,j-d) = median(I(i-d:i+d, j-d:j+d),'all');
    end
end
end