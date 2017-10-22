clc, clear all, close all;

image = imread('sweater.png');

[rows, cols, ~] = size(image);

for i = 1:rows
	for j = 1:cols
		if image(i, j, 1) >= 180 && image(i, j, 2) >= 120 && image(i, j, 3) >= 87 && image(i, j, 1) <= 190 && image(i, j, 2) <= 130 && image(i, j, 3) <= 95
			image(i, j, 1) = 74;
			image(i, j, 2) = 13;
			image(i, j, 3) = 12;
		end
	end
end


output = zeros(rows, cols, 3);
for i = 1:rows
	for j = 1:cols
		if image(i, j, 1) >= 0 && image(i, j, 2) >= 0 && image(i, j, 3) >= 0 && image(i, j, 1) <= 130 && image(i, j, 2) <= 40 && image(i, j, 3) <= 40
			output(i, j, 1) = 255;
			output(i, j, 2) = 0;
			output(i, j, 3) = 0;
		end
	end
end

imwrite(output, 'segmented.png');
figure, imshow(output);
edge_image = edge(rgb2gray(output));

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

figure, imshow(edge_image);

for i = 1:pixel
	signature(i) = sqrt((x - row_counter(i))^2 + (y - column_counter(i))^2);
end

figure, plot(signature);