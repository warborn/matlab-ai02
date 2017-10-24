clc, clear all, close all;
image = imread('reporter.jpg');
background = imread('background.jpg');

[rows, cols, ~] = size(image);
output = uint8(zeros(rows, cols, 3));

for i = 1:rows
	for j = 1:cols
		if image(i, j, 1) >= 50 && image(i, j, 2) >= 50 && image(i, j, 3) >= 40 && image(i, j, 1) <= 210 && image(i, j, 2) <= 240 && image(i, j, 3) <= 245
		else
			output(i, j, 1) = image(i, j, 1);
			output(i, j, 2) = image(i, j, 2);
			output(i, j, 3) = image(i, j, 3);
		end
	end
end

morph_image = imbinarize(rgb2gray(output), 1/250);
for i = 1:5
  morph_image = im_dilation(morph_image);
end

for i = 1:2
  morph_image = im_erotion(morph_image);
end

image = double(image);
background = double(background);
morph_image = double(morph_image);
inverse_image = ~morph_image;

figure, imshowpair(uint8(image), uint8(morph_image), 'montage');


color_output(:, :, 1) = morph_image(:, :) .* image(:, :, 1);
color_output(:, :, 2) = morph_image(:, :) .* image(:, :, 2);
color_output(:, :, 3) = morph_image(:, :) .* image(:, :, 3);

color_background(:, :, 1) = inverse_image(:, :) .* background(:, :, 1);
color_background(:, :, 2) = inverse_image(:, :) .* background(:, :, 2);
color_background(:, :, 3) = inverse_image(:, :) .* background(:, :, 3);

figure, imshowpair(uint8(color_output), uint8(color_background), 'montage');

merged_image = color_output + color_background;
figure, imshow(uint8(merged_image));