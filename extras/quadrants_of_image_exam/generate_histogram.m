function [ frequencies ] = get_histogram(image)
  frequencies = zeros(1, 256);
  [rows cols ~] = size(image);
  for i = 1:rows
    for j = 1:cols
      index = image(i, i) + 1;
      frequencies(index) = frequencies(index) + 1;
    end
  end
end