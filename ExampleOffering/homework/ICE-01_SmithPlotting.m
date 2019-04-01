%%
figure(1);clf;

linc = [.125, .125, .125]; % line color


% plot real line
x = [-1, 1];
y = [0, 0];
plot( x, y , 'color', linc);

axis equal;
axis off;
hold on;



if 0
  r = ones(1, 500) * 0;
  x = linspace(-1000, 1000, 500);
  
  z = complex(r, x) ./ 50;
  
  g = (z - 1) ./ (z + 1);
  
  plot(real(g), imag(g));
end

% plot constant resistance
for R = [0, 10, 25, 50, 100, 200]
  r = R/50;
  rad = 1/(r + 1);
  cent = 1-rad;
  th = linspace(0, 2*pi, 500);
  plot(rad*cos(th) + cent, rad*sin(th), 'color', linc)
end


if 0
  r = linspace(0, 1000, 500);
  x = ones(1, 500) * -10;
  
  z = complex(r, x) ./ 50;
  
  g = (z - 1) ./ (z + 1);

  plot(real(g), imag(g));
end

% plot constant reactance
for X = [10, 25, 50, 100, 200]
  x = X/50;
  rad = 1/(x);
  cent = rad;
  th = 2 * atan(x) * linspace(0, 1, 500);
  plot(1 - rad*sin(th), cent - rad*cos(th), 'color', linc);
  plot(1 - rad*sin(th), -cent + rad*cos(th), 'color', linc);
end

% ADD TEXT
%  Make function!




%%
l = 54e-9;
c = .45e-12;

w = 2 * pi * 915e6;

zs = 50 + 1j*w*l + 1/(1j*w*c);


gs = (zs - 50) / (zs + 50);

gss = conj(gs);

plot(real(gss), imag(gss), 'x')


%%
    ltest = 22;
    l = ltest * 1e-9;
    z1 = 1/(1j*w*1e-12) + 15 + 1j*w*l;
    
    z2 = 1j*w*6e-9;
    zl = (z1 * z2) / (z1 + z2);
    gl = (zl - 50) / (zl + 50);
    plot(real(gl), imag(gl), 'o')