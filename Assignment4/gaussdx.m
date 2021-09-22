function dx = gaussdx(sigma)
x = -round(3.0*sigma):round(3.0*sigma);
dx = (-1)/(sqrt(2*pi)*sigma^3)*x.*exp(-x.^2/(2*sigma^2)); %calculate derivative of Gaussian kernel for values of x (in one line)
dx = dx / sum(abs(dx)) ; % normalization