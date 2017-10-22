clc, clear all, close all;

image = rgb2gray(imread('flor.jpg'));
bin_image = imbinarize(imnoise(image, 'salt & pepper', 0.05));

% erosion -> dilation
output = im_dilation(im_erotion(bin_image));

figure, imshowpair(bin_image, output, 'montage');