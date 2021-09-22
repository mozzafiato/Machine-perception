function [Ixx, Iyy, Ixy] = image_derivatives2(I, sigma)
    [Ix, Iy] = image_derivatives(I, sigma);
    G = gauss(sigma);
    D = gaussdx(sigma);
    Ixx = conv2(conv2(Ix, G', 'same'), D, 'same');
    Iyy = conv2(conv2(Iy, G, 'same'), D', 'same');
    Ixy = conv2(conv2(Iy, D, 'same'), D', 'same');
end