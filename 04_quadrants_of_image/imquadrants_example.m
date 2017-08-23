image = imread('docker.png');
changed_image = imquadrants('docker.png', [4,3,2,1]);
% Display the changed image
figure(1),imshow(image)
figure(2),imshow(changed_image)