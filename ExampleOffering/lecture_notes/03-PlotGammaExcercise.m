% problem 1

Z0 = 50;
Zl = 100;
gamma = (Zl - Z0)./(Zl + Z0);


figure(1);clf;
h = plot(real(gamma), imag(gamma), 'x', 'linewidth', 4);
xlim([-1, 1]);
ylim([-1, 1]);
grid on;
set(gca, 'fontsize', 14);
xlabel('Real Part of \Gamma');
ylabel('Imag. Part of \Gamma');
title('Problem 1');



%%%%% Problem 2
f = 1e9;
Z0 = 50;
L = 33e-9;
Xl = 1j .* (2*pi*f) .* L;
Zl = 0 + Xl;

gamma = (Zl - Z0)./(Zl + Z0);


figure(2);clf;
h = plot(real(gamma), imag(gamma), 'x', 'linewidth', 4);
xlim([-1, 1]);
ylim([-1, 1]);
grid on;
set(gca, 'fontsize', 14);
xlabel('Real Part of \Gamma');
ylabel('Imag. Part of \Gamma');
title('Problem 2');


%%%%% Problem 3
f = 500e6:50e6:1e9;
Z0 = 50;
L = 33e-9;
Xl = 1j .* (2*pi*f) .* L;
Zl = 0 + Xl;

gamma = (Zl - Z0)./(Zl + Z0);


figure(3);clf;
h = plot(real(gamma), imag(gamma), 'linewidth', 2);
xlim([-1, 1]);
ylim([-1, 1]);
grid on;
set(gca, 'fontsize', 14);
xlabel('Real Part of \Gamma');
ylabel('Imag. Part of \Gamma');
title('Problem 3');



%%%%% Problem 4
f = 1e9;
Z0 = 50;
C = 10e-12;
Xc = 1 ./ (1j * (2*pi*f) .* C);
Zl = 50 + Xc;

gamma = (Zl - Z0)./(Zl + Z0);


figure(4);clf;
h = plot(real(gamma), imag(gamma), 'x', 'linewidth', 4);
xlim([-1, 1]);
ylim([-1, 1]);
grid on;
set(gca, 'fontsize', 14);
xlabel('Real Part of \Gamma');
ylabel('Imag. Part of \Gamma');
title('Problem 4');


%%%%% Problem 5
f = 1e9;
Z0 = 50;
C = .5e-12:.5e-12:10e-12;
Xc = 1 ./ (1j * (2*pi*f) .* C);
Zl = 50 + Xc;

gamma = (Zl - Z0)./(Zl + Z0);


figure(5);clf;
h = plot(real(gamma), imag(gamma), 'linewidth', 2);
xlim([-1, 1]);
ylim([-1, 1]);
grid on;
set(gca, 'fontsize', 14);
xlabel('Real Part of \Gamma');
ylabel('Imag. Part of \Gamma');
title('Problem 5');