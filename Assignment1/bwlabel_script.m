I = imread('coins.jpg'); % Load a synthetic mask

% Compute mask M
Id = double(rgb2gray(I));
t = otsu(Id);
M = Id < t ; %changed to <
%figure; clf; imagesc(M); axis equal; axis tight;
SE = ones(8);
M = imerode(imdilate(M, SE), SE);
figure; clf; imshow(M); axis equal; axis tight;

L = bwlabel(M); % Use connected components algorithm to label all components
%figure; clf; imagesc(L); axis equal; axis tight;
label_max = max(L(:)); % Counts coins

for i = 1:label_max
if sum(L(:) == i) > 700 % Only process labels that have more than 700 pixels
L(L == i) = 0;
end
end

figure; subplot(1, 2, 1);
imshow(I); title('Original');
subplot(1, 2, 2); 
imshow(immask(I, L > 0)); title('Processed'); % Display the result
colormap gray;
