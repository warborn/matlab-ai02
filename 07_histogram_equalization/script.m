image = rgb2gray(imread('tulips.jpg'));

[row col] = size(image);
histogram = get_histogram(image);
total_pixels = row * col;
accummulative = zeros(1, 256);
probability = zeros(1, 256);
equalizer = zeros(1, 256);

equalized_image = zeros(row, col);

for i = 1:256
	probability(i) = histogram(i) / total_pixels;
end

accummulative(1) = probability(1);
for i = 2:256
	accummulative(i) = accummulative(i - 1) + probability(i);
end

equalizer = accummulative * 255;

for i = 1:row
	for j = 1:col
		pixel = image(i, j);
		equalized_image(i, j) = equalizer(pixel + 1);
	end
end

equalized_image = uint8(equalized_image);

figure(1)
subplot(2,2,1), imshow(image)
subplot(2,2,2), imshow(equalized_image)
subplot(2,2,3), bar(histogram)
subplot(2,2,4), bar(get_histogram(equalized_image))