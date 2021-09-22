function retrieval_system(images, bins)
%load images
values = zeros(bins*bins*bins);
figure; 

%the first image is the reference image
H1 = myhist3(imread(images(1)), 8);
H1 = reshape(H1,[],1);

%compute frequencies of each bin of each histogram
for i = 1:length(images)
    images(i)
    Im = imread(images(i));
    subplot(3,length(images),i); imshow(Im);
    H = myhist3(Im, 8);
    H = reshape(H,[],1);
    d = compare_histograms(H1,H,"l2");
    subplot(3, length(images),i+3); bar(H); title(['distance = ', num2str(d)]); 
    H_weighted = zeros(bins*bins*bins);
    for j = 1:length(H)
        f = exp((-5)*H(j));
        H_weighted(j) = H(j)*f;
        %sums up bins for the final histogram
        values(j)= values(j) + H(j);
    end
    H_weighted = H_weighted / sum(H_weighted);
    if i == 1
        H2 = H_weighted;
    end
    d = compare_histograms(H2,H_weighted,"l2");
    subplot(3, length(images), i+6); bar(H_weighted); title(['distance = ', num2str(d)]); 
end


%plot frequencies, not weighted
h = values / sum(values);
figure; subplot(1,2,1); bar(h); title('Not weighted');

weight = zeros(bins*bins*bins);
for i = 1:length(values)
    weight(i) = exp((-5)*values(i));
    values(i) = values(i) * weight(i);
end

%normalize and plot weighted histogram
values = values / sum(values);
subplot(1,2,2); bar(values); title('Weighted');
end

