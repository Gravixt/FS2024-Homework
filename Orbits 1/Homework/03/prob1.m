% Clear old data, plots, and console
clear
close all
clc

% Define constant variables

G = 6.67430e-11; % (N * m^2 ./ kg) or (m^3 ./ kg * s^2)
m_earth = 5.9722e24; % (kg)
m_car = 0; % Negligable compared to m_earth
mu = G * (m_earth + m_car);
radius = 6378.137e3; % Equatorial radius (m)

% Define "theta"
resolution = 1e5;
theta = linspace(0,2*pi, resolution);

% Spinning constants

angVel = 7.2921159e-5; % (rads/s)
phi_rolla = 0.662377304619; % (rads)
phi_quito = -0.0031529896536; % (rads)


% Part A

V_esc_ns = sqrt(2 * mu ./ radius) ./ 1000; % Escape velocity if the Earth is not spinning (km/s)
ns_mph = V_esc_ns * 3600 ./ 1.60934; % No spin escape velocity (m)
ns_mps = V_esc_ns * 1000;

fprintf('The escape velocity if the earth is NOT spinning is %.6f km/s, or %.6f mph \n', V_esc_ns, ns_mph);


% Part B

% Escape velocity with a spinning Earth
b_a = 1;
b_b = 2 * angVel * radius * sin(theta) * cos(phi_rolla);
b_c = angVel.^2 * radius.^2 * (cos(phi_rolla)).^2 - ns_mps.^2;

bDiscriminant = b_b.^2 - 4*b_a*b_c;

bRoot1 = (-b_b + sqrt(bDiscriminant)) / (2*b_a); % Can ignore negative solution because of changing theta

V_esc_rolla = bRoot1 / 1000;

figure;
plot(theta, V_esc_rolla);
title('Escape Velocity vs Direction Driven (Rolla)');
xlabel('Direction (rads)');
ylabel('Magnitude of Required Escape Velocity (km/s)');
hold off;

% Part C

% Escape velocity with a spinning Earth
c_a = 1;
c_b = 2 * angVel * radius * sin(theta) * cos(phi_quito);
c_c = angVel.^2 * radius.^2 * (cos(phi_quito)).^2 - ns_mps.^2;

cDiscriminant = c_b.^2 - 4*c_a*c_c;

cRoot1 = (-c_b + sqrt(cDiscriminant)) / (2*c_a); % Can ignore negative solution because of changing theta

V_esc_quito = cRoot1 / 1000;

figure;
plot(theta, V_esc_quito);
title('Escape Velocity vs Direction Driven (Quito)');
xlabel('Direction (rads)');
ylabel('Magnitude of Required Escape Velocity (km/s)');
hold off;

figure;
hold on;
plot(theta, V_esc_rolla, 'r'); % Plot Rolla in red
plot(theta, V_esc_quito, 'b'); % Plot Quito in blue

% Add legend to differentiate between the two curves
legend('Rolla', 'Quito');

% Add title and axis labels
title('Escape Velocity vs Direction Driven for Rolla and Quito');
xlabel('Direction (rads)');
ylabel('Magnitude of Required Escape Velocity (km/s)');

hold off;