clc, clear all, close all;

image = imread('image.bmp');

[rows, cols] = size(image);
[letter, b] = imcrop(image);

% figure, imshow(image);
figure, imshow(letter);

correlation = real(ifft2(fft2(image) .* (fft2(rot90(letter, 2), rows, cols))));
figure, mesh(correlation);

threshold = max(max(correlation));
output = correlation > (threshold - 10);
figure, imshow(output);