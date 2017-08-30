function [ equalized_image ] = equalize_image(image)
	% Variable declarations
	[rows cols] = size(image);
	total_pixels = rows * cols;
	pmf = zeros(1, 256);
	cdf = zeros(1, 256);
	equalized_image = zeros(rows, cols);

	% 1. Generate histogram for image
	histogram = get_histogram(image);

	% 2. Calculate the PMF
	for i = 1:256
	  pmf(i) = histogram(i) / total_pixels;
	end

	% 3. Calculate the CDF
	cdf(1) = pmf(1);
	for i = 2:256
	  cdf(i) = cdf(i - 1) + pmf(i);
	end

	% 4. Equalize
	equalizer = cdf * 255;

	for i = 1:rows
	  for j = 1:cols
	    index = image(i, j) + 1;
	    equalized_image(i, j) = equalizer(index);
	  end
	end

	% 5. Generate histogram for equalized image
	equalized_image = uint8(equalized_image);
end