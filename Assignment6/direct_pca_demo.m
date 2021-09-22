function [U, S, V, Mu] = direct_pca_demo(P)

Mu = mean(P,2)
Pd = P - Mu
N = size(P,1);
C = (1/(N-1))*(Pd*Pd.');
[U, S, V] = svd(C);


figure; clf;
%subplot(1,2,1);
plot(P(1,:),P(2,:),'+'); hold on;
for i = 1 : size(P,2)
   text(P(1,i)-0.5, P(2,i), num2str(i)); 
end
xlabel('x_1'); ylabel('x_2');
xlim([-10 10]);
ylim([-10 10]);

draw_gauss2d(Mu, C, 'r', 1); hold on;
v1 = V(:,1)*S(1,1);
v2 = V(:,2)*S(2,2);
plot([Mu(1), v1(1)], [Mu(2), v1(2)], 'g');
plot([Mu(1), v2(1)], [Mu(2), v2(2)], 'r');




