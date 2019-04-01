% EXAMPLE OF READING IN S1P FILE FORMAT

dir = 'C:\Users\sthoma11\Desktop\';
fname = 'hw2problem3.s1p';

H = dlmread([dir, fname], ' ', 3, 0);

f = H(:, 1);
db = H(:, 2);
angdeg = H(:, 3);

mag = 10 .^ (db ./ 20);

Gre = mag .* cos(pi*angdeg/180);
Gim = mag .* sin(angdeg*pi/180);

Gamma = Gre + 1j*Gim;

Zl = 50 * (1 + Gamma)./(1 - Gamma);

figure(1);clf;
smithchart()
h = plot(Gamma);
set(h, 'linewidth', 2)


n = length(f);
fc = f(n/2);
fprintf('The impedance at %3.2f MHz is %.2f + %.2fj Ohms\n', fc*1e-6, real(Zl(n/2)), imag(Zl(n/2)));


% implement matching

l1 = 10e-9;
l2 = 28e-9;
c1 = 10e-12;

Rl1 = (2 * pi * f * l1) ./ (20);
Rl2 = (2 * pi * f * l2) ./ (20);
Rc1 = 1 ./ (2 * pi * f * c1);

Zl1 = Rl1 + 1j*2*pi*f*l1;
Zl2 = Rl2 + 1j*2*pi*f*l2;
Zc2 = Rc1 + 1 ./ (1j * 2 * pi * f * c1);

% For ignoring Q
%Zl1 = 0 + 1j*2*pi*f*l1;
%Zl2 = 0 + 1j*2*pi*f*l2;
%Zc2 = 0 + 1 ./ (1j * 2 * pi * f * c1);

% add shunt l
Zm1 = 1 ./ ( (1 ./ Zl) + ( 1 ./ Zl1) );

gm1 = (Zm1 - 50) ./ (Zm1 + 50);

plot(gm1)

% add series l
Zm2 = Zl2 + Zm1;

gm2 = (Zm2 - 50) ./ (Zm2 + 50);

plot(gm2)

h = plot(gm2(n/2));
set(h, 'linewidth', 4, 'marker', 'o', 'color', 'r', 'linestyle', 'none');

legend(h, 'Matched 915 MHz')





