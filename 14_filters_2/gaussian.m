image = imnoise(rgb2gray(imread('tulips.jpg')), 'salt & pepper', 0.05);
[rows cols] = size(image);
kernel = [1, 2, 1; 2, 4, 2; 1, 2, 1];
d_image = double(double(image));

for i = 2:rows - 1
	for j = 2:cols - 1
		kernel = image(i - 1:i + 1, j - 1:j + 1);
		gaussian_filter(i, j) = (sum(sum(d_image(i-1:i+1, j-1:j+1) .* kernel))) / 16;
	end
end

figure(1)
subplot(1, 2, 1), imshow(image), title('Original'),
subplot(1, 2, 2), imshow(uint8(gaussian_filter)), title('Gaussian Filter');