function [ gauss3pt ] = GaussianQuadEst( func, a, b )
%scott1 Returns the 3 point Gaussian quadrature estimate of the integral of
%the function from a to b
%   Converts limits of integration to [-1,1]

% Convert x value based on given interval
x =@(xd) ((b+a)+(b-a).*xd)./2;

% find derivative conversion factor
dx = (b-a)./2;

% set converted function handle
func2 =@(xd) func(x(xd)).*dx;

% find Gaussian 3 point quadrature of converted function
gauss3pt = 5/9.*func2(-sqrt(3/5))+8/9.*func2(0)+5/9.*func2(sqrt(3/5));

end

