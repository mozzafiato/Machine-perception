function [M, n, m] = prepare_data(dirr)

images=dir(dirr);
I = imread([dirr  '/' images(3).name]);
n = size(I,1);
m = size(I,2);
q = length(images)-2;
M = zeros(n*m,q);

for i=3:length(images)
   filename = [dirr  '/' images(i).name];
   I = imread(filename);
   M(:,i-2) = reshape(I,[],1);
end

end