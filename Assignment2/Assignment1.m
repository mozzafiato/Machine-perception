%a) myhist3.m

%b)  Test the myhist3 function on the image umbrellas.jpg
I = imread("umbrellas.jpg");
H = myhist3(I, 8);
H1 = squeeze(sum(H,1));
H2 = squeeze(sum(H,2));
H3 = squeeze(sum(H,3));
figure; subplot(1,4,1); imshow(I);
subplot(1,4,2); bar3(H1);  
subplot(1,4,3); bar3(H2); 
subplot(1,4,4); bar3(H3);

%c) compare_histograms.m

%d) test compare_histograms
I1 = imread("images/object_01_1.png");
I2 = imread("images/object_02_1.png");
I3 = imread("images/object_03_1.png");
H1 = myhist3(I1, 8); H1 = reshape(H1,[],1);
H2 = myhist3(I2, 8); H2 = reshape(H2,[],1);
H3 = myhist3(I3, 8); H3 = reshape(H3,[],1);
figure; subplot(2,3, 1); imshow(I1); title('Image 1');
subplot(2,3,2); imshow(I2); title('Image 2');
subplot(2,3,3); imshow(I3); title('Image 3');
d11 = compare_histograms(H1,H1,"l2");
d12 = compare_histograms(H1, H2, "l2");
d13 = compare_histograms(H1, H3, "l2");
subplot(2,3,4); bar(H1); title(['l2(H1,H1) = ', num2str(d11)]);
subplot(2,3,5); bar(H2); title(['l2(H1,H2) = ', num2str(d12)]);
subplot(2,3,6); bar(H3); title(['l2(H1,H3) = ', num2str(d13)]);

%e) load_histogram_database
[hist_list, files] = load_histogram_database("images/", 8);
hist = hist_list(20,:);
d = zeros(size(hist_list,1),1);
distance = ["hellinger", "l2", "intersect", "chi2"];


for j = 1:size(distance,2)
    for i = 1:size(hist_list,1)
        d(i) = compare_histograms(hist, hist_list(i,:), distance(j));
    end
    [val ,ind] = sort(d,'ascend');

    figure('Name', distance(j));
    for i = 1:6
    image = string(files(ind(i)));
    I = imread(image);
    H = myhist3(I, 10); H = reshape(H,[],1);
    subplot(2,6,i); imshow(I); title(['Image ', num2str(ind(i))]);  
    subplot(2,6,i+6); bar(H); title([distance(j), " = ", num2str(round(val(i),2))]);  
    end
end
    
%g)  
visualize_distance(d);

%h)
images = ["images/object_06_3.png"; "images/object_04_3.png"; "images/object_08_1.png"];
retrieval_system(images, 8);

   
    


