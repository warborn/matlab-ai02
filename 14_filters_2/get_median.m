function [ med ] = get_median(array)
	[len ~] = size(array);
	for i = 1: len - 1
		for j = i + 1:len
			if array(j) < array(i)
				temp = array(i);
				array(i) = array(j);
				array(j) = temp;
			end
		end
	end

	mid_index = ceil(len / 2);
	if mod(len, 2) == 1
		med = array(mid_index);
	else
		med = (array(mid_index) + array(mid_index + 1)) / 2;
	end
end