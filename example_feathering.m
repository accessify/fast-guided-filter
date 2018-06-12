% example: guided feathering

close all;

I = double(imread('.\img_feathering\toy.bmp')) / 255;
p = double(rgb2gray(imread('.\img_feathering\toy-mask.bmp'))) / 255;

r = 60;
eps = 10^-6;

tic;
q = guidedfilter_color(I, p, r, eps);
toc;

s = 4;
tic;
q_sub = fastguidedfilter_color(I, p, r, eps, s);
toc;

figure();
imshow([I, repmat(p, [1, 1, 3]), repmat(q, [1, 1, 3]), repmat(q_sub, [1, 1, 3])], [0, 1]);
