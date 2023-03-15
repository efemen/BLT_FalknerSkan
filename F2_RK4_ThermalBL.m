%% RK4 numerical solver modified for solving Falkner-Skan equation.

function [f_next, g_next] = F2_RK4_ThermalBL(dh, d_eta, f, g, i, Pr, f_blasius)

    if i > 117
        f_blasius(i) = f_blasius(117) + d_eta * (i - 117);
    end
    
    dg1 = d_eta * dh(Pr, f_blasius(i), g(i));
    df1 = d_eta * g(i);
    
    dg2 = d_eta * dh(Pr, f_blasius(i), g(i) + dg1 * 0.5);
    df2 = d_eta * (g(i) + dg1 * 0.5);
    
    dg3 = d_eta * dh(Pr, f_blasius(i), g(i) + dg2 * 0.5);
    df3 = d_eta * (g(i) + dg2 * 0.5);

    dg4 = d_eta * dh(Pr, f_blasius(i), g(i) + dg3 * 0.5);
    df4 = d_eta * (g(i) + dg3);
   
    g(i + 1) = g(i) + (dg1 + 2*dg2 + 2*dg3 + dg4) / 6;
    f(i + 1) = f(i) + (df1 + 2*df2 + 2*df3 + df4) / 6;

    f_next = f;
    g_next = g;
end