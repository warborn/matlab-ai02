image = imread('sweater.jpg');

[rows, cols, channels] = size(image);
output = uint8(ones(rows, cols, channels) * 255);

for i = 1:rows
  for j = 1:cols
    % if image(i, j, 1) < 240 && image(i, j, 1) > 40 && image(i, j, 2) < 80 && image(i, j, 2) > 10 && image(i, j, 3) < 110 && image(i, j, 3) > 4
       output(i, j, 1) = image(i, j, 3);
       output(i, j, 2) = image(i, j, 2);
       output(i, j, 3) = image(i, j, 1);
     % end
  end
end

imshowpair(image, output, 'montage');

    