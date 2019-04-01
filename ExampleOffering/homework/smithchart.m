function smithchart(line_color, hide_text)
% Prints a Smithchart to the screen

%figure(1);clf;

if (nargin < 2)
    hide_text = 0;
end
if ((nargin < 1) || isempty(line_color))
    linc = [.125, .125, .125]; % line color
else
  linc = line_color;
end


% plot real line
x = [-1, 1];
y = [0, 0];
plot( x, y , 'color', linc);

axis equal;
axis off;
hold on;

% plot constant resistance (uses circle method)
for R = [0, 10, 25, 50, 100, 250]
  r = R/50;
  rad = 1/(r + 1);
  cent = 1-rad;
  th = linspace(0, 2*pi, 500);
  plot(rad*cos(th) + cent, rad*sin(th), 'color', linc)
end

% plot constant reactance (uses circle method)
for X = [10, 25, 50, 100, 250]
  x = X/50;
  rad = 1/(x);
  cent = rad;
  th = 2 * atan(x) * linspace(0, 1, 500);
  plot(1 - rad*sin(th), cent - rad*cos(th), 'color', linc);
  plot(1 - rad*sin(th), -cent + rad*cos(th), 'color', linc);
end

%% Adds text
if (hide_text ~= 1)
  topstr = {'+j0.2', '+j0.5', '+j1', '+j2', '+j5'};
  botstr = {'-j0.2', '-j0.5', '-j1', '+j2', '-j5'};

  top = [-1.2, .38
	 -.85, 0.85
         -.1,   1.1
	 0.6, 0.9
	 0.9, 0.5];
  bot = [top(:, 1), -1*top(:, 2)];

  realstr = {'0', '0.2', '0.5', '1', '2', '5', '\infty'};
  real = [-1.1, 0
	  -.72, .05
	  -.42, .05
	  0, .05
	  1/3, .05
	  .6, .05
	  1.05, .02];

  coords = [top; bot; real];
  str = [topstr(:); botstr(:); realstr(:)];
  for n = 1 : length(coords)
    text(coords(n, 1), coords(n, 2), str(n), 'fontsize', 10)
  end
end


end
% closes function
