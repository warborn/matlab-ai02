clc, clear all, close all;

image = rgb2gray(imread('flor.jpg'));
bin_image = imbinarize(imnoise(image, 'salt & pepper', 0.05));

str_el = ones(3,3);
[rows, cols] = size(bin_image);

for i = 2:rows-1
	for j = 2:cols-1
		value = str_el .* bin_image(i-1:i+1, j-1:j+1);
		dilation(i, j) = max(max(value));
	end
end

figure, imshowpair(bin_image, dilation, 'montage');