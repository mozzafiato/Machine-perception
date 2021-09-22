function myhist_script(image, bins)
I = imread(image);
I = double(rgb2gray(I));
[H, bins] = myhist(I, bins);
figure; clf;
bar(bins, H)

