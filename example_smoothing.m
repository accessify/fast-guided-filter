% example: edge-preserving smoothing

close all;

I = double(imread('.\img_smoothing\cat.bmp')) / 255; % this image is too small to fully unleash the power of Fast GF
p = I;
r = 4;
eps = 0.2^2; % try eps=0.1^2, 0.2^2, 0.4^2

tic;
q = guidedfilter(I, p, r, eps);
toc;

s = 4; % sampling ratio
tic;
q_sub = fastguidedfilter(I, p, r, eps, s);
toc;

figure();
imshow([I, q, q_sub], [0, 1]);
