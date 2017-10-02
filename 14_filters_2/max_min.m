image = imnoise(rgb2gray(imread('tulips.jpg')), 'salt & pepper', 0.05);
[rows cols] = size(image);

for i = 2:rows - 1
	for j = 2:cols - 1
		kernel = image(i - 1:i + 1, j - 1:j + 1);
		maximum_filter(i, j) = max(kernel(:));
		minimum_filter(i, j) = min(kernel(:));
	end
end

figure(1)
subplot(1, 3, 1), imshow(image), title('Original'),
subplot(1, 3, 2), imshow(maximum_filter), title('Maximum Filter');
subplot(1, 3, 3), imshow(minimum_filter), title('Minimum Filter');