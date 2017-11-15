clc, clear all, close all;
image = rgb2gray(imread('plate.png'));
figure, imshow(uint8(image));

binary_image = image < 100;
figure, imshow(binary_image);

sum_rows = sum(binary_image');
figure, plot(sum_rows);

cutout_letters = binary_image(150:400, :);
figure, imshow(cutout_letters);

sum_colums = sum(cutout_letters);
figure, plot(sum_colums);

cutout_letter = cutout_letters(:, 460:580);
figure, imshow(cutout_letter);