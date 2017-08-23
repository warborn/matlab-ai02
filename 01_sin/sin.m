clc, clear all, close all;
% Sine of X graph
x=-pi/2:0.01:pi/2;
title('seno de x')
xlabel('eje x')
ylabel('eje y')

figure(1), subplot(1,2,1),plot(x,sin(x),'r')

% Cosine of x graph
title('coseno de x')
xlabel('eje x')
ylabel('eje y')

figure(1),subplot(1,2,2),plot(x, cos(x), 'm')