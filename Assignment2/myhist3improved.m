function H = myhist3(img, bins)
% when computing cell indices add a small factor to avoid overflow
% problems
idx = floor(double(img) * bins / (255 + 1e-5)) + 1;
H = zeros(bins,bins,bins);
% increment the appropriate cell of the H(R,G,B) for each pixel in the image
n=size(img,1);
A = 1:n;
B = (1+n):(size(img,2)+ n);
index = [A, B];

for i = 1:size(B):
j = index[i, i+n];
R = idx(i, j, 1);
G = idx(i, j, 2);
B = idx(i, j, 3);
H(R,G,B) = H(R,G,B) + 1;
end
% normalize the histogram (sum of cell values should equal to 1)
H = H / sum(sum(sum(H)));