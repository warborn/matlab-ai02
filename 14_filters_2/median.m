image = imnoise(rgb2gray(imread('tulips.jpg')), 'salt & pepper', 0.05);
[rows cols] = size(image);

for i = 2:rows - 1
	for j = 2:cols - 1
		kernel = image(i - 1:i + 1, j - 1:j + 1);
		median_filter(i, j) = get_median(kernel(:));
	end
end

figure(1)
subplot(1, 2, 1), imshow(image), title('Original'),
subplot(1, 2, 2), imshow(median_filter), title('Median Filter');