% Friis model, for LOS + GROUND + CEILING
%
clear all;
figure(1);clf;

f = 915e6;
c = 3e8;

y = 1.5;
ceil = 4;

%%
d = linspace(3, 25, 5000);
wl = c/f;

theta = 2*pi*f/c * d;

pl = 1./(4*pi*d.^2);

CHANNEL = pl;
gdbi = 6;
pt = 1;
gant = 10^(gdbi/10);
pr = pt * gant * gant * wl^2 / (4*pi) * CHANNEL;

plot(d, 30+10*log10(pr));
grid on;

%% ADD IN GROUND
y = 3;
gd = 2 * sqrt(d.^2/4 + y^2);
plg =  1./(4*pi*gd.^2);
thetag = 2*pi*f/c * gd;

a = pl.*exp(1j*theta);
b = plg.*exp(1j*thetag);
CHANNEL = abs(a + b);
prg = pt * gant * gant * wl^2 / (4*pi) * CHANNEL;
hold all;
plot(d, 30+10*log10(prg));

%% ADD IN CEILING
cd = 2 * sqrt(d.^2/4 + (ceil-y)^2);
plc =  1./(4*pi*cd.^2);
thetac = 2*pi*f/c * cd;

c = plc.*exp(1j*thetac);
CHANNEL = abs(a + b + c);
prc = pt * gant * gant * wl^2 / (4*pi) * CHANNEL;
hold all;
plot(d, 30+10*log10(prc));

set(gca, 'fontsize', 14);
xlabel('distance (m)');
ylabel('Received power (dBm)')
legend('Friis - Line of sight', 'line of sight + ground', 'line of sight + ground + ceiling')

print('-dpng', 'out.png')
