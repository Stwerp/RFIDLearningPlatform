clear all;

syms('r');

fmhz = 915;
s = fmhz / 300;

dBm = 27;
pt = 10^(dBm/10); % mW
dbi = 8; % ant. gain (dBi)

eqn = fmhz/300 == pt * 10^(dbi/10) / (4 * pi * (r)^2);

soln = solve(eqn, r);
dist = eval( soln(soln > 0));
fprintf('********\nMaximum permissible exposure:\n')
fprintf('Distance is %.3f cm\n', dist);
fprintf('or rather,  %.3f feet\n', dist * 0.0328084 );

eqn = fmhz/1500 == pt * 10^(dbi/10) / (4 * pi * (r)^2);

soln = solve(eqn, r);
dist = eval( soln(soln > 0));
fprintf('********\nLimits for general population:\n')
fprintf('Distance is %.3f cm\n', dist);
fprintf('or rather,  %.3f feet\n', dist * 0.0328084 );