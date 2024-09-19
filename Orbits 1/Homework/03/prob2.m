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

% Spinning constants

angVel = 7.2921159e-5; % (rads/s)
phi_rolla = 0.662377304619; % (rads)

vGrnd = 13411.2; % (m/s)
vAbs = vGrnd + (radius * cos(phi_rolla) * angVel);

% Part A

energy = (vAbs^2 / 2) - (mu / radius);
energy_km = energy / 1000000;

fprintf('The specific energy of Dr. P’s Corvette driving due East from Rolla at a local speed of 30,000 mph is %.6f km^2./s^2\n', energy_km);

% Part B

h_mag = radius * vAbs;
h_mag_km = h_mag / 1000000;

fprintf('The specific angular momentum of Dr. P’s Corvette driving due East from Rolla at a local speed of 30,000 mph is %.6f km^2/s\n', h_mag_km);

% Part c

a = - mu ./ (2 * energy);
a_km = a / 1000;

fprintf('The semi-major axis of Dr. P’s Corvette driving due East from Rolla at a local speed of 30,000 mph is %.6f km\n', a_km);


% Part D

r_moon = 378000000 + radius; % (m)

vMoon = sqrt(mu * ((2 / r_moon) - (1 / a)));
vMoon_km = vMoon / 1000;

fprintf('The velocity of Dr. P’s Corvette driving due East from Rolla at a local speed of 30,000 mph when it reaches the orbital distance of the moon is %.6f km/s\n', vMoon_km);