function [ frequencies ] = get_histogram( image )
  % get_histogram Function that generates a vector that represents the histogram for an image
  [rows, cols, rgb] = size(image);
  frequencies = zeros(1, 256);

  for i = 1:rows
    for j = 1:cols
      index = image(i, j) + 1;
      frequencies(index) = frequencies(index) + 1;
    end
  end
end 