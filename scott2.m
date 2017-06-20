function [ solnmatrix, runtime ] = scott2( x_vals )
%scott2 Finds Gaussian quadrature and trapezoid estimates, and evaluates
%using the built in integral function, and the runtime for each
%   The methods were tested first with a simple equation (x^2) to check the
%   functionality. The methods produced less accurate results with the
%   trigonometric function. Also, the quadrature was consistently more accurate
%   for x^2 but the trap model was more accurate for cos(t^2) once x > 4. Both
%   methods became extremely incaccurate (and large) once x > 6.

% -----------------------------------------------------------------------

% Compute using Gaussian quadrature

% start timer
tic

% set function handle
fresnel =@(t) cos(t.^2);

% find Gaussian quad
gauss_est = scott1(fresnel, 0, x_vals);

% end quadrature timer
quad_time = toc;

% -----------------------------------------------------------------------

% initialize trap list
trap_est = [];
cur_trap = 0;

% Compute using Trap rule - 10 subdivisions
for i = 1:length(x_vals)
    xx = linspace(0,x_vals(i),11);
    cur_trap = 0;
    for j = 1:10
        cur_trap = cur_trap+(xx(j+1)-xx(j)).*...
            ((fresnel(xx(j+1))+fresnel(xx(j)))/2);
    end
    trap_est = [trap_est cur_trap];
end

trap_time = toc;

% -----------------------------------------------------------------------

% Compute using integral

int_est = [];

for i=1:length(x_vals)
    int_est = [int_est integral(fresnel,0,i)];
end

int_time = toc;

% -----------------------------------------------------------------------

% assign estimates to matrix
solnmatrix = [gauss_est;trap_est;int_est];

% -----------------------------------------------------------------------

% assign runtimes to row vector
runtime = [quad_time trap_time int_time];

end