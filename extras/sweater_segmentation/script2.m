image = imread('sweater2.jpg');

[rows, cols, channels] = size(image);
output = uint8(ones(rows, cols, channels) * 255);

for i = 1:rows
  for j = 1:cols
    if image(i, j, 1) < 60 && image(i, j, 1) > 0 && image(i, j, 2) < 90 && image(i, j, 2) > 0 && image(i, j, 3) < 200 && image(i, j, 3) > 10
       output(i, j, 1) = image(i, j, 3);
       output(i, j, 2) = image(i, j, 2);
       output(i, j, 3) = image(i, j, 1);
     else 
      output(i, j, 1) = image(i, j, 1);
      output(i, j, 2) = image(i, j, 2);
      output(i, j, 3) = image(i, j, 3);
     end
  end
end

imshowpair(image, output, 'montage');

    