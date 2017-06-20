% create x value vectors
x = linspace(0,10,100);
x2 = linspace(2,4.5,100);

% set three funtions and their derivatives
f=@(x) x.^2+3.*x-2;
f1=@(x) 2.*x+3;
g=@(x) 1/3.*sin(2.^x)-5.*cos(2.*x);
g1=@(x) 0.231049.*2.^x.*cos(2.^x)+10.*sin(2.*x);
h=@(x) (x.^2+0.04-10.*x).^2-0.09.*(x.^2+0.04);
h1=@(x) 4.*(x.^3-15.*x.^2+49.995.*x-0.2);

% call scott3, plot derivative functions on function plot
scott3(f,0,10)
title('x^2+3x-2')
plot(x,f1(x))
legend('Function','Derivative-estimate','Derivative-calculated',...
    'Location','northwest')

scott3(g,2,4.5)
title('1/3sin(x^2)-5cos(2x)')
plot(x2,g1(x2))
legend('Function','Derivative-estimate','Derivative-calculated',...
    'Location','northwest')

scott3(h,0,10)
title('4(x^2+0.04-10x)^2-0.09(x^2+0.04)')
plot(x,h1(x))
legend('Function','Derivative-estimate','Derivative-calculated',...
    'Location','northwest')