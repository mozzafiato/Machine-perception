function M = immask(RGBImage, BinImage)

RBGImage = double(RGBImage);
%split image in 3 channels
R = RGBImage(:,:,1);
G = RGBImage(:,:,2);
B = RGBImage(:,:,3);

%set corresponding pixels to 0
R(BinImage == 0) = 0;
G(BinImage == 0) = 0;
B(BinImage == 0) = 0;

M = cat(3, R, G, B);

