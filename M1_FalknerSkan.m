%% Efe Egemen Sen - 110190129 - 07/03/2022 - UZB386E Boundary Layer Theory 
% Blasius Solution with RK4
clear; clc;

beta_arr = [-0.19; 0; 0.29; 1];
d_eta = 0.001;
eta_max = 15;

eta_master = zeros(eta_max/d_eta, 4);
f_master = eta_master;
g_master = f_master;
h_master = f_master;
h_inits = zeros(1,4);
last_etas = zeros(1,4);

for beta_index = 1:length(beta_arr)    

    beta = beta_arr(beta_index);
    
    eta = 0:d_eta:eta_max;
    N = length(eta);
    
    f = zeros(N,1); % f(eta)
    g = f;          % g(eta) = f'
    h = f;          % h(eta) = f''
    
    dh = @(f, g, h) - h * f - beta * (1 - g^2); % dh/d_eta obtained from f''' + ff'' + b*[1-f'^2]
    
    h(1) = 0.3;        % initial guess for f'''
    h_last = h(1);     % last guess for f'''
    g_inf = 0;         % f'(inf) = 1 boundary value checker.
    
    iteration = 0;     % iteration count over initial guess.
    Kp = 0.1;          % step size for Newton.
    acc_target = 1e-3; % target accuracy.
    
    while true
        iteration = iteration + 1;
    
        for i = 1:(N - 1)
            [f, g, h] = RK4_FalknerSkan(dh, d_eta, f, g, h, i);
        
            if h(i) < acc_target
                g_inf = g(i);   % set g_inf to the converged value.
                c_index = i;
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
            eta = eta(1:c_index);
            f = f(1:c_index);
            g = g(1:c_index);
            h = h(1:c_index);
            break
        end
    end
    
    eta_master(1:c_index, beta_index) = eta;
    f_master(1:c_index, beta_index) = f;
    g_master(1:c_index, beta_index) = g;
    h_master(1:c_index, beta_index) = h;
    h_inits(beta_index) = h(1);
    last_etas(beta_index) = c_index;
end

run("M2_Visualizer.m")