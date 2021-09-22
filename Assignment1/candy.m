I = imread('candy.jpg');
Id = double(I);

%1) Compute mask M
Ir = Id(:,:,1);
Ig = Id(:,:,2);
Ib = Id(:,:,3);
tr = otsu(Ir);
tg = otsu(Ig);
tb = otsu(Ib);
Mr = Ir > tr;
Mg = Ig > tg;
Mb = Ib > tb;
M = Mr;
M(Mg == 0) = 0;
M(Mb == 0) = 0;
M = 1 - M;
%figure; clf; imshow(M);
SE = ones(10);
M = imerode(imdilate(M, SE), SE);
%figure('Name','Closing'); clf; imshow(M);
SE = ones(20);
M = imdilate(imerode(M,SE), SE);
%figure('Name','Opening'); clf; imshow(M);
M_candies = double(immask(I,M));
%figure; clf; imagesc(uint8(M_candies)); axis equal; axis tight; impixelinfo();

%2) Labels and averages
L = bwlabel(M);
no_candies = max(L(:));
[x, y, z] = size(I);
averageR = zeros(x, y, 1);
averageG = zeros(x, y, 1);
averageB = zeros(x, y, 1);
averages = zeros(no_candies, 3); 
M_candiesR = double(M_candies(:,:,1));
M_candiesG = double(M_candies(:,:,2));
M_candiesB = double(M_candies(:,:,3));

for i = 1:no_candies
    R = mean(M_candiesR(L(:) == i));
    G = mean(M_candiesG(L(:) == i));
    B = mean(M_candiesB(L(:) == i));
    averageR(L(:) == i) = R;
    averageG(L(:) == i) = G;
    averageB(L(:) == i) = B;
    averages(i,1) = R;
    averages(i,2) = G;
    averages(i,3) = B;
end

Average = cat(3,uint8(averageR), uint8(averageG), uint8(averageB));
figure('Name','Average'); clf; imagesc(Average); impixelinfo();

%3)ginput
figure; imshow(I);
[x, y] = ginput(1)
x = floor(x); y = floor(y);
v(1) = double(Average(y, x, 1));
v(2) = double(Average(y, x, 2));
v(3) = double(Average(y, x, 3));
v = double(v)

indexes = [];
for i =1:no_candies
    if norm(averages(i,:)-v) > 50
        indexes = [indexes, i];
    end
end

for i = indexes
    M(L == i) = 0;
end

L = bwlabel(M); 
no_candies_selected = max(L(:));
figure; imshow(I); text(10,10, ['Count: ',num2str(no_candies_selected)]);
s = regionprops(L,'centroid');
centroids = cat(1,s.Centroid);
hold on
plot(centroids(:,1),centroids(:,2),'o')


    

