function [output] = im_dilation(image)
	str_el = ones(3,3);
	[rows, cols] = size(image);
	output = logical(zeros(rows, cols));

	for i = 2:rows-1
		for j = 2:cols-1
			value = str_el .* image(i-1:i+1, j-1:j+1);
			output(i, j) = min(min(value));
		end
	end
end