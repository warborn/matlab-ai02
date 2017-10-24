clc, clear all, close all;

image = imread('cat.jpg');
gray_image = rgb2gray(image);
[rows, cols] = size(gray_image);

[rows, cols, ~] = size(image);
output = uint8(zeros(rows, cols, 3));

for i = 1:rows
	for j = 1:cols
		if image(i, j, 1) >= 130 && image(i, j, 2) >= 40 && image(i, j, 3) >= 10 && image(i, j, 1) <= 180 && image(i, j, 2) <= 100 && image(i, j, 3) <= 80
		output(i, j, 1) = image(i, j, 1);
		output(i, j, 2) = image(i, j, 2);
		output(i, j, 3) = image(i, j, 3);
		end
	end
end

figure, imshow(image);
threshold = imbinarize(rgb2gray(output), 50/255);
threshold = im_dilation(threshold);
figure, imshow(threshold);
segmented = gray_image(:, :, [1, 1, 1]);

for i = 1:rows
	for j = 1:cols
		pixel = threshold(i, j);
		if(pixel == 1) 
			% segmented(i, j, 1) = image(i, j, 1);
			% segmented(i, j, 2) = image(i, j, 2);
			% segmented(i, j, 3) = image(i, j, 3);
			segmented(i, j, 1) = 136;
			segmented(i, j, 2) = 0;
			segmented(i, j, 3) = 21;
		end
	end
end

figure, imshow(segmented);