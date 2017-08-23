% Materia: Inteligencia Artificial I
% Alumno: Munguía Cruz Iván Alejandro

% Practica 1. Introducción a MATLAB

% 1. Expresiones

% Inciso a - g:
clc, clear all, close all;
a = 186 * 31
b = 124312 - 5478
c = 17456^0.4
d = 711 / 134
e = sin(pi/8)
f = sqrt(1 + atan(1)^2)
x = 12/6
z = 36 - 7
y = log(18 * z + x)

% 2. Operaciones con Vectores y Matrices

% Inciso a - j:
A = [2,-1,4;6,9,-4;0,2,3];
B = [1,3,4;5,7,9;9,10,11];
A + B, A - B, A * B
U = [1 2 3 5]
V = [6 9 11 3]
U * transpose(V),U .* V, U + V, 10 .* U
A(2,3) = 0, B(3,1) = 1
k = {U(1,3),V(1,4),B(2,1)}
R = linspace(-5,10,10)
f = inv(A)
C = [5 6 7;11 15 20]
g = C(1:2,3)
h = zeros(5,5)
d = ones(2,3), d .* 2, d * C
d .* C

% 3. Graficas

% 1:
% Definición de intervalo para que se aprecie mejor la gráfica
x = 0:0.01:2 * pi
title('Seno de X')
xlabel('Eje X')
ylabel('Eje Y')
figure(1), plot(x, sin(x), 'b')
grid

% 2:
% Definición de intervalo para que se aprecie mejor la gráfica
x = -5:0.2:2 * pi
title('Seno de X y Yangente de X')
xlabel('Eje X')
ylabel('Eje Y')
figure(1), plot(x, sin(x), 'b', x, tan(x), 'r')

% 3:
t = 0:pi / 50:10 * pi
title('Elipse')
xlabel('Eje X')
ylabel('Eje Y')
figure(1), plot3(sin(t), cos(t), t, 'g')