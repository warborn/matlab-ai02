clc, clear all, close all;

image = rgb2gray(imread('image.bmp'));
edge_image = edge(image);

[rows, cols] = size(image);
pixel = 0;
for i = 1:rows
	for j = 1:cols
		if edge_image(i, j) == 1
			pixel = pixel + 1;
			row_counter(pixel) = i;
			column_counter(pixel) = j;
		end
	end
end

sum_rows = sum(row_counter);
sum_cols = sum(column_counter);
x = round(sum_rows/pixel);
y = round(sum_cols/pixel);

edge_image(x-1:x+1, y-1:y+1) = 1;

figure, imshow(edge_image)

for i = 1:pixel
	firm(i) = sqrt((x - row_counter(i))^2 + (y - column_counter(i))^2);
end

figure, plot(firm)