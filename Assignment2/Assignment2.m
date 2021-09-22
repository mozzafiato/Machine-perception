
%a) I = [0,1,1,1,0,0.7,0.5,0.2,0,0,1,0];
%   g = [0.5,1,0.3];
%   result = [0, 0.5,1.5,1.8,1.3,0.65,0.95, 0.81, 0.35,0.06, 0.5,1,0.3, 0]

%b) 
I = load("signal.txt");
g = load("kernel.txt");
Ig = simple_convolution(I, g);
figure; 
x = 1:length(I);
plot(x, I, 'b');
hold on;
plot(x, Ig, 'r');
hold on;
x = 1:length(g);
plot(x , g, 'g'); legend('Original','Result', 'Kernel');

%c) 5th and 6th element of the first Ig are 0. 
Ig = conv(I, g, 'same');

%d) Plot Gaussian kernels for values of sigma = 0.5, 1, 2, 3, 4.
sigma = [0.5, 1, 2, 3, 4];
colorstring = 'kbgry';
figure; hold on;
for i = 1:length(sigma)
    [X, G] = gauss(sigma(i));
    plot(G,X, 'Color', colorstring(i), 'DisplayName',['sigma = ', num2str(sigma(i))]);
end
legend

%Question: signals
%S = imread('signals.jpg');
%figure; imshow(S);

%d) Performing two consecutive convolutions on a signal,
% first Gaussian kernel k1 with sigma = 2, the second time with kernel k2.
% Plot all combinations
s = load("signal.txt");
figure; subplot(1,4,1); plot(1:length(s), s, 'b'); title('s');
[k1, x1] = gauss(2);
k2 = [0.1, 0.6, 0.4];
sk1 = simple_convolution(s,k1);
sk1k2 = simple_convolution(sk1,k2);
subplot(1,4,2); plot(1:length(sk1k2), sk1k2, 'b'); title('(s * k1) * k2)');
sk2 = simple_convolution(s,k2);
sk2k1 = simple_convolution(sk2, k1);
subplot(1,4,3); plot(1:length(sk2k1), sk2k1, 'b'); title('(s * k2) * k1');
k1k2 = simple_convolution(k1,k2);
sk1k2 = simple_convolution(s,k1k2);
subplot(1,4,4); plot(1:length(sk2k1), sk2k1, 'b'); title('s (k2 * k1)');


