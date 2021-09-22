function Ig = simple_median(I, W)
d = floor(W/2);
%round to next odd value
y = 2*floor(W/2)+1;
v = zeros(y, 1);
v(d+1) = 1;
I = conv(I, v);

for i = 1+d:length(I)-d
   Ig(i-d) = median(I(i-d:i+d));
end

end