%--------------------------------
disp('Problem 3a');

R = 5*(6.371e+06); % Planet radius
row = 5*5429; % Planet Density
r = 1.496e+11; % Distance of falcon to planet mass center
G = 6.67430e-11; % Universal gravitational constant
F = 2.5;

% Density to mass
m_planet = (row)*(4/3)*pi*(R^3);

% Mass of falcon
m_falcon = (F*(r^2))/(G*m_planet); % kg
m_falcon_mtons = m_falcon / 1e3; % metric tons
m_falcon_tons = m_falcon_mtons*1.10231; % tons
fprintf('Mass of Millennium Falcon: %.2f metric tons \n', m_falcon_mtons);
fprintf('Mass of Millennium Falcon: %.2f tons \n', m_falcon_tons);

%---------------------------------
disp('Problem 3b');

g = 9.807; % m/(s^2)
a = 0.1*g;

dist = sqrt((G*m_planet)/a); % Meters
dist_km = dist/1000; % km

fprintf('Distance of Millennium Falcon from center of planet: %.2f km \n', dist_km);

%--------------------------------
disp('Problem 3c');

num_points = 1e6; % Number of points to plot
distance = linspace(r, R, num_points); % Meters
distance_km = distance / 1000; % km
force = (G * m_planet * m_falcon) ./ (distance .^ 2); % Newtons

figure(1);
plot(distance_km, force, 'b');
xlabel('Distance (km)');
ylabel('Force (N)');
title('Distance vs Force on Falcon');