%% Simulation for the passive cable equation in Gabbiani & Cox, Mathematics for Neuroscientists
close all;
clear;
clc;

% Parameters
Cm = 1;		% micro F / cm^2
g_L = 1/15; %0.3;     		% mS / cm^2
R_2 = 0.3; % 0.034;		% k Ohm cm
tau = Cm/g_L;
cab_rad = 1e-4;  % cable radius (cm)
lambda = sqrt(cab_rad/(2*R_2*g_L));
l = 0.1; % length of the cable (cm)
T = 1; % total time
Nx = 100; % total steps of length
Nt = 1000; % total steps of time
dx = l / Nx; % stepsize of length
dt = T / Nt; % stepsize of time


% generating the meshgrids
x = linspace(0, l, Nx);
t = linspace(0, T, Nt);

% initialize the solution matrix
u = zeros(Nx, Nt);

% initial conditions
u(:,1) = x';

% iterations
for n = 1:Nt-1
    for i = 2:Nx-1
        u(i,n+1) = u(i,n) - dt * ((1/tau) * u(i,n) - (lambda^2/tau) * (u(i+1,n) - 2*u(i,n) + u(i-1,n)) / dx^2);
    end
    
    % Boundary conditions
    u(1,n+1) = 0;
    u(Nx,n+1) = 0;
end

% Visualization
[X, T] = meshgrid(x, t);
surf(X, T, u');
% title('Numerical simulation for the Cable equation');
xlabel('x (cm)', 'FontName', 'Times New Roman');
ylabel('t (ms)', 'FontName', 'Times New Roman');
zlabel('v(x,t) (mV)', 'FontName', 'Times New Roman');
colormap(jet);
cb = colorbar; 
cb.Label.FontName = 'Times New Roman'; 
cb.Label.String = 'v(x,t) (mV)'; 
shading interp;
grid on;

% Set the font name for the tick labels
ax = gca;
ax.XAxis.FontName = 'Times New Roman';
ax.YAxis.FontName = 'Times New Roman';
ax.ZAxis.FontName = 'Times New Roman';

% Find the maximum value and its position in the solution matrix
[maxValue, maxIndex] = max(u(:));
[maxRow, maxCol] = ind2sub(size(u), maxIndex);

% Get the coordinates corresponding to the maximum value
maxX = x(maxRow);
maxT = t(maxCol);

% Add a black annotation at the maximum value position
text(maxX, maxT, maxValue, ...
    ['(' num2str(maxX, '%.2f') ', ' num2str(maxT, '%.2f') ', ' num2str(maxValue, '%.2f') ')'], ...
    'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom', ...
    'BackgroundColor', 'black', 'Color', 'white', 'FontSize', 10, 'FontName', 'Times New Roman');

% Highlight the maximum value point on the surface
hold on;
plot3(maxX, maxT, maxValue, 'ko', 'MarkerSize', 10, 'MarkerFaceColor', 'k');
hold off;
