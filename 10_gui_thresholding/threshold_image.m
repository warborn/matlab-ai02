function [ binary_image ] = threshold_image(image, threshold_value)
  % Convert integer value to a decimal value between 0 and 1
  if isreal(threshold_value) && rem(threshold_value,1) == 0
    threshold_value = threshold_value / 255;
  end

  [rows, cols ~] = size(image);
  doubled_image = im2double(image);

  % Iterate over the image and update every pixel using the threshold value
  for i = 1:rows
    for j = 1:cols
      if(doubled_image(i, j) <= threshold_value)
        doubled_image(i, j) = 0;
      else
        doubled_image(i, j) = 1;
      end
    end
  end
  binary_image = im2uint8(doubled_image);
end