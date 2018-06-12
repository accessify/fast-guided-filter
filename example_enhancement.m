% example: detail enhancement

close all;

I = double(imread('.\img_enhancement\tulips.bmp')) / 255;
p = I;

r = 16;
eps = 0.1^2;

q = zeros(size(I));
tic;
q(:, :, 1) = guidedfilter(I(:, :, 1), p(:, :, 1), r, eps);
q(:, :, 2) = guidedfilter(I(:, :, 2), p(:, :, 2), r, eps);
q(:, :, 3) = guidedfilter(I(:, :, 3), p(:, :, 3), r, eps);
toc;

q_sub = zeros(size(I));
s = 4;
tic;
q_sub(:, :, 1) = fastguidedfilter(I(:, :, 1), p(:, :, 1), r, eps, s);
q_sub(:, :, 2) = fastguidedfilter(I(:, :, 2), p(:, :, 2), r, eps, s);
q_sub(:, :, 3) = fastguidedfilter(I(:, :, 3), p(:, :, 3), r, eps, s);
toc;

I_enhanced = (I - q) * 5 + q;
I_enhanced_sub = (I - q) * 5 + q_sub;

figure();
imshow([I, q, q_sub, I_enhanced, I_enhanced_sub], [0, 1]);
