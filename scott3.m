function scott3( f, a, b )
%scott3 Plots a graph of the f(x) on [a,b] with the derivative calculated
%using differentiation formula

% ---------------------------------------------------------------------

% create x values vector
x = linspace(a,b,200);

% find step size
h = x(2)-x(1);

% initialize differential values vector
diffun = [];

% loop to calculate differential values on [a,b]
for i=1:length(x)
    if i <= length(x)-2 % forward looking
    diffun = [diffun (-f(x(i+2))+4*f(x(i+1))-3*f(x(i)))/(2*h)];
    elseif i > length(x)-2 % back looking
       diffun = [diffun (3*f(x(i))-4*f(x(i-1))+f(x(i-2)))/(2*h)]; 
    end
end

% create new plot each time function is called
figure('Menubar','none')
plot(x,f(x),x,diffun)
hold on % needed to plot derivatives in test script

end

