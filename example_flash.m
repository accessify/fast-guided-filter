% example: flash/noflash denoising

close all;

I = double(imread('.\img_flash\cave-flash.bmp')) / 255;
p = double(imread('.\img_flash\cave-noflash.bmp')) / 255;

r = 8;
eps = 0.02^2;

q = zeros(size(I));
tic;
q(:, :, 1) = guidedfilter(I(:, :, 1), p(:, :, 1), r, eps);
q(:, :, 2) = guidedfilter(I(:, :, 2), p(:, :, 2), r, eps);
q(:, :, 3) = guidedfilter(I(:, :, 3), p(:, :, 3), r, eps);
toc;

s = 4;
q_sub = zeros(size(I));
tic;
q_sub(:, :, 1) = fastguidedfilter(I(:, :, 1), p(:, :, 1), r, eps, s);
q_sub(:, :, 2) = fastguidedfilter(I(:, :, 2), p(:, :, 2), r, eps, s);
q_sub(:, :, 3) = fastguidedfilter(I(:, :, 3), p(:, :, 3), r, eps, s);
toc;

figure();
imshow([I, p, q, q_sub], [0, 1]);
