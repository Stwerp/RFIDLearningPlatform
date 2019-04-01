%% PROBLEM 1:
figure(1);clf;
smithchart([1, 0, 0], 1);
set(gca, 'xdir', 'reverse');
hax = axes();
smithchart();

p1 = 50 * [.2 - j*0.5];

h = plotz(p1, 'o');
set(h, 'markersize', 12, 'linewidth', 2)

p1e = 50 * [.2 + 1j*2];
h = plotz(p1e, 'x');
set(h, 'markersize', 12, 'linewidth', 2)

%% PROBLEM 2:
figure(1);clf;
smithchart([1, 0, 0], 1);
set(gca, 'xdir', 'reverse');
hax = axes();
smithchart();

p2 = 50 * [.5 + j*.5];

h = plotz(p2, 'o');
set(h, 'markersize', 12, 'linewidth', 2)

p2e = 50 * [1 - 1j];
h = plotz(p2e, 'x');
set(h, 'markersize', 12, 'linewidth', 2)


%% PROBLEM 3:
figure(1);clf;
smithchart([1, 0, 0], 1);
set(gca, 'xdir', 'reverse');
hax = axes();
smithchart();

p3 = 50 * [2 + 1j*5];

h = plotz(p3, 'o');
set(h, 'markersize', 12, 'linewidth', 2)

p3e = 50 * [.25 - .25j];
h = plotz(p3e, 'x');
set(h, 'markersize', 12, 'linewidth', 2)
