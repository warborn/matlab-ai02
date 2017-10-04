clc, clear all, close all;

image = double(rgb2gray(imread('tulips.jpg')));

[rows cols] = size(image);
gdx = [1 0 -1; 2 0 -2; 1 0 -1];
gdy = [1 2 1; 0 0 0; -1 -2 -1];

for i = 2:rows - 1
	for j = 2:cols -1
		kernel = image(i-1:i+1,j-1:j+1);
		mgdx(i, j) = abs(sum(sum(kernel .* gdx)));
		mgdy(i, j) = abs(sum(sum(kernel .* gdy)));
	end
end

magnitude = uint8(mgdx + mgdy);

figure, imshow(magnitude), title('Magnitude');
figure, imhist(magnitude), title('Histogram of the magnitude');

borders = magnitude > 60;

figure, imshow(borders), title('Magnitude Borders');
figure, imshow(edge(image)), title('Use of edge function');

[rows cols] = size(borders);

for h = 1:4
	for i = 1:rows - 2
		for j = 1:cols - 2
			if borders(i, j) == 1 && borders(i + 1, j) == 1 && borders(i + 2, j) == 0
				borders(i + 1, j) = 0;
			end

			if borders(i, j) == 1 && borders(i, j + 1) == 1 && borders(i, j + 2) == 0
				borders(i, j + 1) = 0;
			end
		end
	end
end

figure, imshow(borders), title('Manual Border Reduction');