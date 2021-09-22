
images = ["panorama/panorama1.jpg", "panorama/panorama2.jpg", 'panorama/panorama3.jpg', 'panorama/panorama4.jpg', 'panorama/panorama5.jpg', 'panorama/panorama6.jpg'];

fuse = imread(images(1));
for i=1:2
    I1 = imread(images(i));
    G1 = rgb2gray(I1);
    I2 = imread(images(i+1));
    G2 = rgb2gray(I2);
    M = find_matches(G2,G1);
    M = sortrows(M, 5);
    M = M(1:10,:);
    %figure; displaymatches(I2, M(:,1), M(:,2), I1, M(:,3), M(:,4));
    H = estimate_homography(M(:,1), M(:,2), M(:,3), M(:,4));
    IM = merge_homography(I1,I2, H);
    figure; imshow(IM); 
end

