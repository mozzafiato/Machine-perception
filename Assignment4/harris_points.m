function [I_harr, px, py] = harris_points(I, sigma, threshold)
sigma2 = 1.6;
alfa = 0.06;
G = gauss(sigma2);

[Ix, Iy] = image_derivatives(I, sigma);

c11 = sigma^2 * conv2(Ix.^2, G, 'same');
c12 = sigma^2 * conv2(Ix.*Iy, G, 'same');
c21 = sigma^2 * conv2(Ix.*Iy, G, 'same');
c22 = sigma^2 * conv2(Iy.^2, G, 'same');

det = (c11.*c22) - (c21.*c12);
trace = c11 + c22;

I_harr = (det - alfa.*trace.^2);
%nonmaxima supression
px = [];
py = [];

for i = 2:size(I_harr, 1)-1
    for j = 2:size(I_harr,2)-1
       M = I_harr(i-1:i+1, j-1:j+1);
       M(2,2) = 0;
       v = M(:);
       B = v>I_harr(i,j);
       if sum(B) == 0 && I_harr(i,j) >= threshold
           px = [px; i];
           py = [py; j];
       end
    end
end
I_harr = I_harr >= threshold;
%I_harr(I_harr < threshold) = 0;
end