I = imread('M.jpg');
figure; imshow(I);
L = bwlabel(M);
imagesc(L);
s = regionprops(L,'centroid');
centroids = cat(1,s.Centroid);
hold on
plot(centroids(:,1),centroids(:,2),'b*')