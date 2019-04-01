% EXAMPLE OF READING IN S1P FILE FORMAT

dir = 'C:\Users\sthoma11\vnaJ.3.1\export\';
fname = 'VNA_160906_152229.s1p';

H = dlmread([dir, fname], ' ', 3, 0);

f = H(:, 1);
db = H(:, 2);
angdeg = H(:, 3);

mag = 10 .^ (db ./ 20);

Gre = mag .* cos(pi*ang/180);
Gim = mag .* sin(ang*pi/180);
Gamma = complex(Gre, Gim);

plot(real(Gamma), imag(Gamma));

xlim([-1, 1]);
ylim([-1, 1]);
axis equal;