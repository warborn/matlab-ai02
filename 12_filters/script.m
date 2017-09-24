image = rgb2gray(imread('tulips.jpg'));
noise_image = imnoise(image, 'salt & pepper', 0.05);
% imshow(noise_image);

[rows cols] = size(image);

for i = 2:rows - 1
	for j = 2:cols - 1
		% (i - 1, j - 1) (i - 1, j) (i - 1, j + 1)
		% (i, j - 1)	   (i, j)     (i, j + 1)
		% (i + 1, j - 1) (i + 1, j) (i + 1, j + 1)
		output(i, j) = sum(sum(noise_image(i-1:i+1, j-1:j+1))) / 9;
	end
end

figure(1),
subplot(1, 2, 1), imshow(noise_image),title('Noise Image'),
subplot(1, 2, 2), imshow(uint8(output)), title('Median Filter');