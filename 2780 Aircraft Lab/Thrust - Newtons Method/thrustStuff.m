% AE 2780
% Newton's Method (root finder) for Octave
%% prep
close all % closes all plots
clear % clears all user declared variables
clc % clears the command window
%% in-line function allocation
funnum = '1'; % a label for the function for convenience
fun =@(anyx) anyx.^3 - cos(anyx); % creates a callable function of any x-value
dfun =@(anyx) 2 * anyx + sin(anyx); % derivative of the above function w.r.t. x
%% initial conditions
n1 = 1; % iteration counter initial
x0 = 1; % initial x-guess
tol = 1e-8; % convergence criteria (i.e., how close to zero do we call zero)
x(n1) = x0; % create x-array with initial guess as first entry
Fx(n1) = fun(x(n1)); % create f(x)-array using initial x for first entry
Dfx(n1) = dfun(x(n1)); % create df(x)/dx array using initial x for first entry
maxiter = 1000; % run-a-way catch for iterative solver
%% iterative solver
while abs(Fx(n1))>tol && n1<maxiter % "Run the contents until EITHER condition fails"
    % evaluate new x-value using Newton's Method formula and add entry to x-array
    x(n1+1) = x(n1) - Fx(n1)/Dfx(n1);
    % evaluate new f(x) using new x-value and add entry to f(x) array
    Fx(n1+1) = fun(x(n1+1));
    % evaluate new df(x)/dx using new x-value and add entry to df(x)/dx array
    Dfx(n1+1) = dfun(x(n1+1));
    % increment iterative counter by 1
    % This doubles as the array address for x, Fx, Dfx so it must be a whole number
    n1 = n1+1;
end
%% print out results to command window
fprintf('Final f(x) is %e.\n',Fx(end))
fprintf('Final x is %0.8f.\n',x(end))
fprintf('Number of iterations: %i.\n',n1)
%% plot x-convergence
fig1 = figure(); % initialize a figure with label 'fig1'
plot(x,'linewidth',2);
xlabel('iterations');
ylabel('x'); ax1 = gca();
set(ax1,'xgrid','on','ygrid','on','fontsize',18,'linewidth',1);
%% create a large array of x-values and fill in f(x)
Xspace = linspace(0,10,1000);
% Pre-allocate Fspace
Fspace = zeros(size(Xspace));
% Fill Fspace using vectorized operation
Fspace = fun(Xspace);
%% plot f(x) and highlight root (zero intercept)
fig2 = figure();
plot(Xspace, Fspace, 'linewidth', 2);
hold on;
plot(x(end), Fx(end), '.', 'markersize', 30);
hold off;
xlabel('x');
ylabel('f(x)');
ax2 = gca();
set(ax2, 'xgrid', 'on', 'ygrid', 'on', 'fontsize', 18, 'linewidth', 1);
%% save figures to image files for reporting
saveas(fig1,['convergence',funnum,'.png']);
saveas(fig2,['function',funnum,'.png']);