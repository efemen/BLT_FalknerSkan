clear; clc;

load thermalBlasius.mat

prandtl_arr = [0.02 0.9 1 90];

d_eta = 0.05;
eta_max = 30;
Kp = 0.001;        % step size for Newton.
acc_target = 1e-4; % target accuracy.


eta_master = zeros(ceil(eta_max/d_eta), 4);
t_master = eta_master;
dt_master = t_master;


dt_inits = zeros(1,4);
last_etas = zeros(1,4);
dh = @(p, f, dt) -p * f * dt;

for pr_index = 1:length(prandtl_arr)
    pr = prandtl_arr(pr_index);
    
    eta = 0:d_eta:eta_max;
    N = length(eta);

    t = zeros(N,1); % t(eta) = θ
    dt = t;         % dt(eta) = θ'
    
    t(1) = 1; % θ(0) = 1

    dt(1) = -0.2;       % initial guess.
    dt_last = dt(1);
    t_inf = 0;         % free-stream boundary condition

    iteration = 0;     % iteration count over initial guess.

    while true
        iteration = iteration + 1;
    
        for i = 1:(N - 1)
            [t, dt] = F2_RK4_ThermalBL(dh, d_eta, t, dt, i, pr, f_blasius);
            if abs(dt(i)) < acc_target
                t_inf = t(i);
                c_index = i;
                break
            end
            if i == (N - 1)
                t_inf = t(N - 1);
                c_index = N - 1;
            end
        end

        
        if abs(t_inf) > acc_target
            t = zeros(N,1); % reset matrices for next iteration
            t(1) = 1;
            dt = t;
            dt(1) = dt_last - t_inf * Kp;
            dt_last = dt(1);
        else
            disp("Target accuracy reached. dt(0) = " + string(dt(1)))
            disp(iteration + " iterations completed.")
            eta = eta(1:c_index);
            t = t(1:c_index);
            dt = dt(1:c_index);
            break
        end
    end
    
    eta_master(1:c_index,pr_index) = eta;
    t_master(1:c_index, pr_index) = t;
    dt_master(1:c_index, pr_index) = dt;
    dt_inits(pr_index) = dt(1);
    last_etas(pr_index) = c_index;

end

run("M4_ThermalVisualizer.m")