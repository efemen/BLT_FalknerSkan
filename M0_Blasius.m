%% Efe Egemen Sen - 110190129 - 07/03/2022 - UZB386E Boundary Layer Theory 
% Blasius Solution with RK4
clear; clc;

% beta = [-0.19; -0.19; 0; 0.29; 1];

d_eta = 0.01;

eta = 0:d_eta:15;
N = length(eta);

f = zeros(N,1); % f(eta)
g = f;          % g(eta) = f'
h = f;          % h(eta) = f''

dh = @(f,h) - h * f; % dh/d_eta obtained from 2f''' + f''f = 0

h(1) = 0.3;        % initial guess for f'''
h_last = h(1);     % last guess for f'''
g_inf = 0;         % f'(inf) = 1 boundary value checker.

iteration = 0;     % iteration count over initial guess.
Kp = 0.1;          % step size for Newton.
acc_target = 1e-9; % target accuracy.


while true
    iteration = iteration + 1;

    for i = 1:(N - 1)
        [f, g, h] = RK4_Blasius(dh, d_eta, f, g, h, i);
    
        if h(i) < acc_target
            g_inf = g(i);   % set g_inf to the converged value.
            break
        end
    end

    if abs(g_inf - 1) > acc_target
        f = zeros(N,1); % reset matrices for next iteration
        g = f;
        h = f;
        h(1) = h_last + (1 - g_inf) * Kp;
        h_last = h(1);
    else
        disp("Target accuracy reached. h(0) = " + string(h(1)))
        disp(iteration + " iterations completed.")
        break
    end
end




