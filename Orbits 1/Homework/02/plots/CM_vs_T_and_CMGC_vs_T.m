% Define Weights (Weights can be used rather than masses because
% gravitational constant cancels out in center mass equation

W_a = 20;
W_b = 25;
W_c = 22;
W_d = 40;

W = W_a + W_b + W_c + W_d;

% Define Vectors x and y components (relative to geometric center, o)

r_ax = 2.5;
r_ay = 2.5;

r_bx = 2.5;
r_by = -2.5;

r_cx = -2.5;
r_cy = -2.5;

r_dx = -2.5;
r_dy = 2.5;

% Time range from 0 to 25 seconds
t = linspace(0, 25, 1000); % 1000 points for smooth plots

% Replace these with the actual functions later
RCM_x = (((W_a * r_ax) + (W_c * r_cx) + (W_d * r_dx)) + (W_b * (2.5 - (0.2 * t)))) ./ W;
RCM_y = (((W_a * r_ay) + (W_b * r_by) + (W_c * r_cy) + (W_d * r_dy))) ./ W .* ones(size(t));

distance_to_center = sqrt(RCM_x.^2 + RCM_y.^2);

figure;
% Plot 1: X and Y Components of Center Mass vs Time
subplot(2, 1, 1); % Creates a 2x1 grid of plots, and this is the first plot
plot(t, RCM_x, 'b', 'LineWidth', 1.5); % Plot X component in blue
hold on; % Keep the current plot to overlay the Y component
plot(t, RCM_y, 'g--', 'LineWidth', 1.5); % Plot Y component in green dashed line
title('Center Mass (X and Y components) vs Time');
xlabel('Time (s)');
ylabel('Center Mass');
legend('X component', 'Y component');
grid on; % Add grid to the plot
hold off; % Release the plot hold

% Plot 2: Distance From Center Mass to Geometric Center vs Time
subplot(2, 1, 2); % This is the second plot in the 2x1 grid
plot(t, distance_to_center, 'r', 'LineWidth', 1.5); % Plot in red with line width of 1.5
title('Distance From Center Mass to Geometric Center vs Time');
xlabel('Time (s)');
ylabel('Distance to Geometric Center');
grid on; % Add grid to the plot
