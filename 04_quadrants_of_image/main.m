% Materia: Inteligencia Artificial I
% Alumno: Munguía Cruz Iván Alejandro

% Read an image file
image = imread('docker.png');

% Extract 4 quadrants from the original image
top_left_image     = image(1:200, 1:349, :);
top_right_image    = image(1:200, 350:698,:);
bottom_left_image  = image(201:400, 1:349, :);
bottom_right_image = image(201:400, 350:698, :);

% From 4 quadrants, compose the original image
% quadrant order: 1, 2, 3, 4
% left_half_image = [top_left_image; bottom_left_image];
% right_half_image = [top_right_image; bottom_right_image];
% changed_image = [left_half_image right_half_image];

% Compose the image with the following quadrant order: 4, 3, 2, 1 
left_half_image = [bottom_right_image; top_right_image];
right_half_image = [bottom_left_image; top_left_image];
changed_image = [left_half_image right_half_image];

% Display the changed image
figure(1),imshow(image)
figure(2),imshow(changed_image)