clc, clear all, close all;
image = imread('sweater.jpg');

[rows, cols, channels] = size(image);
output = uint8(zeros(rows, cols));

for i = 1:rows
	for j = 1:cols
		if image(i, j, 1) >= 0 && image(i, j, 2) >= 0 && image(i, j, 3) >= 0 && image(i, j, 1) <= 25 && image(i, j, 2) < 25 && image(i, j, 3) < 25
			% output(i, j, 1) = 255;
			output(i, j) = 255;
			% output(i, j, 2) = 255;
			% output(i, j, 3) = 255;
		end
	end
end

figure, imshowpair(image, output, 'montage');

% saveas(output, 'cropped', 'bmpmono');
output = output(230:310, 275:525);
imwrite(output, 'cropped.bmp');

cropped = imread('cropped.bmp');
[rows, cols] = size(cropped);
[letter, b] = imcrop(cropped);
figure, imshow(letter);

correlation = real(ifft2(fft2(cropped) .* (fft2(rot90(letter, 2), rows, cols))));
figure, mesh(correlation);

threshold = max(max(correlation));
output = correlation > (threshold - 10);
figure, imshow(output);