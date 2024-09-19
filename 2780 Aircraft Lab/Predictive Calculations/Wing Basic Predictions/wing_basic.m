% Define the domain for b_wing and c_wing
b_wing = linspace(3, 5, 100);        % corresponds to x
c_wing = linspace(0.65, 1, 100);     % corresponds to y

% Create a meshgrid for b_wing and c_wing
[B, C] = meshgrid(b_wing, c_wing);

% Calculate S_wing = b_wing * c_wing and AR_wing = b_wing / c_wing
S_wing = B .* C;   % S_wing corresponds to f(x,y) = xy
AR_wing = B ./ C;  % AR_wing corresponds to g(x,y) = x/y

% Define constants for V_stall and W_L calculations
W_oz = 8.5;
W = (W_oz + 1.4 * S_wing) ./ 16;  % Weight in pounds with added S_wing dependency
rho = 0.0024;                     % Air density in slugs/ft^3
CL_max = 1.2;                     % Maximum lift coefficient

% Calculate V_stall and W_L
V_stall = sqrt((2 * W) ./ (rho .* S_wing .* CL_max)); % V_stall formula
W_L = W ./ S_wing;                                    % Wing loading formula

% Filter S_wing and AR_wing to stay within the specified ranges
valid_indices = (S_wing >= 3.25 & S_wing <= 4.24) & (AR_wing >= 5 & AR_wing <= 7);

% Filter all matrices based on the valid indices
S_wing_filtered = S_wing;
S_wing_filtered(~valid_indices) = NaN; % Set invalid points to NaN

AR_wing_filtered = AR_wing;
AR_wing_filtered(~valid_indices) = NaN; % Set invalid points to NaN

V_stall_filtered = V_stall;
V_stall_filtered(~valid_indices) = NaN; % Set invalid points to NaN

W_L_filtered = W_L;
W_L_filtered(~valid_indices) = NaN; % Set invalid points to NaN

% Plot pcolor for c_wing with S_wing on the secondary axis
figure;
pcolor(b_wing, c_wing, S_wing_filtered); % Plot c_wing on primary y-axis
shading flat; % Remove grid lines inside cells for a cleaner look
title('Color Plot of Wing Planform Area vs Span and Chord Length');
xlabel('Span (ft)');
ylabel('Chord Length (ft)');
set(gca, 'YDir', 'normal'); % Ensure y-axis is in the correct direction
colorbar;
colormap(turbo); % Use a high-contrast colormap
clim([3.25, 4.24]); % Set the color limits to the filtered range

% Add contour lines to enhance visibility with more levels
hold on;
contour(b_wing, c_wing, S_wing_filtered, 15, 'LineColor', 'k', 'LineWidth', 0.5); % 15 contour levels
hold off;

% Add a secondary y-axis for S_wing
yyaxis right
plot(b_wing, S_wing_filtered(round(length(c_wing)/2), :), 'r--'); % Correctly plot S_wing at the mid c_wing
ylabel('Planform Area (ft^2)'); % Label for secondary axis
axis tight; % Adjust axis limits
grid on;

% Plot pcolor for c_wing with AR_wing on the secondary axis
figure;
pcolor(b_wing, c_wing, AR_wing_filtered); % Plot c_wing on primary y-axis
shading flat; % Remove grid lines inside cells for a cleaner look
title('Color Plot of Wing Aspect Ratio vs Span and Chord Length');
xlabel('Span (ft)');
ylabel('Chord Length (ft)');
set(gca, 'YDir', 'normal'); % Ensure y-axis is in the correct direction
colorbar;
colormap(turbo); % Apply colormap
clim([5, 7]); % Set the color limits to the filtered range for AR_wing

% Add contour lines to enhance visibility with more levels
hold on;
contour(b_wing, c_wing, AR_wing_filtered, 15, 'LineColor', 'k', 'LineWidth', 0.5); % 15 contour levels
hold off;

% Add a secondary y-axis for AR_wing
yyaxis right
plot(b_wing, AR_wing_filtered(round(length(c_wing)/2), :), 'r--'); % Correctly plot AR_wing at the mid c_wing
ylabel('Aspect Ratio'); % Label for secondary axis
axis tight; % Adjust axis limits
grid on;

% Plot pcolor for c_wing with V_stall on the secondary axis
figure;
pcolor(b_wing, c_wing, V_stall_filtered); % Plot c_wing on primary y-axis
shading flat; % Remove grid lines inside cells for a cleaner look
title('Color Plot of Stall Velocity vs Wing Span and Chord Length');
xlabel('Span (ft)');
ylabel('Chord Length (ft)');
set(gca, 'YDir', 'normal'); % Ensure y-axis is in the correct direction
colorbar;
colormap(turbo); % Apply colormap
clim auto; % Allow V_stall values to auto-scale within their range

% Add contour lines to enhance visibility with more levels
hold on;
contour(b_wing, c_wing, V_stall_filtered, 15, 'LineColor', 'k', 'LineWidth', 0.5); % 15 contour levels
hold off;

% Add a secondary y-axis for V_stall
yyaxis right
plot(b_wing, V_stall_filtered(round(length(c_wing)/2), :), 'r--'); % Correctly plot V_stall at the mid c_wing
ylabel('Stall Velocity (ft/s)'); % Label for secondary axis
axis tight; % Adjust axis limits
grid on;

% Plot pcolor for c_wing with W_L on the secondary axis
figure;
pcolor(b_wing, c_wing, W_L_filtered); % Plot c_wing on primary y-axis
shading flat; % Remove grid lines inside cells for a cleaner look
title('Color Plot of Wing Loading vs Span and Chord Length');
xlabel('Span (ft)');
ylabel('Chord Length (ft)');
set(gca, 'YDir', 'normal'); % Ensure y-axis is in the correct direction
colorbar;
colormap(turbo); % Apply colormap
clim auto; % Allow W_L values to auto-scale within their range

% Add contour lines to enhance visibility with more levels
hold on;
contour(b_wing, c_wing, W_L_filtered, 15, 'LineColor', 'k', 'LineWidth', 0.5); % 15 contour levels
hold off;

% Add a secondary y-axis for W_L
yyaxis right
plot(b_wing, W_L_filtered(round(length(c_wing)/2), :), 'r--'); % Correctly plot W_L at the mid c_wing
ylabel('Wing Loading (lb/ft^2)'); % Label for secondary axis
axis tight; % Adjust axis limits
grid on;

% Enhance grid accuracy
set(gca, 'XGrid', 'on', 'YGrid', 'on', 'GridColor', [0 0 0], 'GridAlpha', 0.6, 'MinorGridLineStyle', '-');
set(gca, 'XMinorGrid', 'on', 'YMinorGrid', 'on'); % Add minor grid lines for more precision

% 2D Plot of S_wing vs AR_wing within specified ranges
figure;
scatter(S_wing_filtered(:), AR_wing_filtered(:), 10, 'filled'); % Flatten matrices for plotting
title('2D Plot of Planform Area vs Aspect Ratio within Specified Ranges');
xlabel('Planform Area (ft^2)');
ylabel('Aspect Ratio');
grid on;
