clc, clear all, close all;
image = rgb2gray(imread('eye.jpg'));
image = imbinarize(image, 100 / 255);
figure, imshow(image);

% [centers, ~] = imfindcircles(image,[10 30], 'ObjectPolarity', 'dark', 'Sensitivity', 0.8, 'Method', 'twostage', 'EdgeThreshold', .05);

% if ~ isempty(centers)
%   center = centers(1, :);
%   center = round(center);
%   image(center(2) - 1 : center(2) + 1, center(1) - 7 : center(1) + 7, 1) = 255;
%   image(center(2) - 7 : center(2) + 7, center(1) - 1 : center(1) + 1, 1) = 255;
% end


% figure, imshow(image);