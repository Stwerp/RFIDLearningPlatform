%create a vector for capacitance. Vary it from say, 0.5pF up to 10 pF
c = linspace(0.05e-12, 50e-12, 500);
% choose a frequency
f = 915e6; % 915 MHz
% form the reactance (X in Z = R + jX)
w = 2 * pi * f;
X = -1j ./ (w * c);
% define an R variable for the resistor
R = 22;
% form Z which is the parallel combination of R and C
Zp = 1 ./ ( (1 ./ X) + (1 ./ R) );
% or 
%Zp = (R * X) ./ (R + X);
% Then calculate gamma
z0 = 50; % characteristic impedance
gamma = (Zp - z0) ./ (Zp + z0);

figure(1);clf;
smithchart()
plot(real(gamma), imag(gamma))