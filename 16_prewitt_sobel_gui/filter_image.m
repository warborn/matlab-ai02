function [filter_image] = filter_image(image, ftype, reducer_factor)
	if strcmp(ftype, 'prewitt')
		k = 1;
	else
		k = 2;
	end

	image = double(image);
	
	[rows cols] = size(image);
	gdx = [1 0 -1; k 0 -k; 1 0 -1];
	gdy = [1 k 1; 0 0 0; -1 -k -1];

	for i = 2:rows - 1
		for j = 2:cols -1
			kernel = image(i-1:i+1,j-1:j+1);
			mgdx(i, j) = abs(sum(sum(kernel .* gdx)));
			mgdy(i, j) = abs(sum(sum(kernel .* gdy)));
		end
	end

	magnitude = uint8(mgdx + mgdy);

	filter_image = magnitude > 60;

	[rows cols] = size(filter_image);

	for h = 1:reducer_factor
		for i = 1:rows - 2
			for j = 1:cols - 2
				if filter_image(i, j) == 1 && filter_image(i + 1, j) == 1 && filter_image(i + 2, j) == 0
					filter_image(i + 1, j) = 0;
				end

				if filter_image(i, j) == 1 && filter_image(i, j + 1) == 1 && filter_image(i, j + 2) == 0
					filter_image(i, j + 1) = 0;
				end
			end
		end
	end
end