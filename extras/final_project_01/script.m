clc, clear all close all;

% create a webcam object
cam = webcam(); 

% define an infinite loop
while true
  % take a snapshot using the webcam
  image = spanshot(cam);
end