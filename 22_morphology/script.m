clc, clear all, close all;

image = rgb2gray(imread('flor.jpg'));
bin_image = imbinarize(imnoise(image, 'salt & pepper', 0.05));

erotion_image = im_erotion(bin_image);
dilation_image = im_dilation(bin_image);

% dilation -> erotion
closed_image = im_erotion(im_dilation(bin_image));

% erosion -> dilation
opened_image = im_dilation(im_erotion(bin_image));

figure, imshowpair(bin_image, erotion_image, 'montage'), title('Erotion');
figure, imshowpair(bin_image, dilation_image, 'montage'), title('Dilation');
figure, imshowpair(bin_image, closed_image, 'montage'), title('Closing');
figure, imshowpair(bin_image, opened_image, 'montage'), title('Opening');