%a) D = f*T/pz
%disparity and distance from the cameras are inversely related. 
%as the distance from the cameras increases, the disparity decreases.

%b) disparity.m
pz = linspace(0,2,20);
D = disparity(pz);
figure; plot(pz, D);


%c)
% f = 2.5mm
% T = 12cm
% 648 x 488
% pw = 7.4 * 10^-6 m
% x1 = 550; x2 = 300
% oddaljenost = (f*T) / ((x1-x2) * pw)
%