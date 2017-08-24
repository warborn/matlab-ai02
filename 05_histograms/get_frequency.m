function [ frequencies ] = get_frequency( image )
  % get_frequency Function that generates a vector that represents the histogram for an image
  [rows, cols] = size(image);
  frequencies = zeros(1, 256);

  for i = 1:rows
    for j = 1:cols
      value = image(i, j) + 1;
      frequencies(value) = frequencies(value) + 1;
    end
  end
end 