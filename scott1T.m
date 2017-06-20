% calculates 3 point Gaussian quadrature for three different equations

% set equations to function handles
f=@(x) cos(x);
g=@(x) x.^2+sqrt(x);
h=@(x) 0.2+25.*x-200.*x.^2+675.*x.^3-900.*x.^4+400.*x.^5;

% calculate 3pt quad, built in integration, and the relative error for each
% equation
f1=scott1(f,0,5);
true1 = integral(f,0,5);
err1 = abs((f1-true1)/true1);

g1=scott1(g,0,4);
true2 = integral(g,0,4);
err2 = abs((g1-true2)/true2);

h1=scott1(h,0,0.8);
true3 = integral(h,0,0.8);
err3 = abs((h1-true3)/true3);

% display results
% ideally these would not extend past 80 characters a line, but Matlab did
% something very strange when I created new lines that I couldn't correct
fprintf('\nGaussian 3 point quadrature of cos(x): %f\nBuiltin function value: %f\nRelative Error: %f\n\n', f1,true1, err1)
fprintf('Gaussian 3 point quadrature of x^2+sqrt(x): %f\nBuiltin function value: %f\nRelative Error: %f\n\n', g1,true2, err2)
fprintf('Gaussian 3 point quadrature of 0.2+25*x-200*x^2+675*x^3-900*x^4+400*x^5: %f\nBuiltin function value: %f\nRelative Error: %f\n\n', h1,true3, err3)