%% RK4 numerical solver modified for solving Blasius Similarity Equation.

function [f_next, g_next, h_next] = RK4_FalknerSkan(dh, d_eta, f, g, h, i)

    dg1 = d_eta * h(i);
    df1 = d_eta * g(i);
    dh1 = d_eta * dh(f(i), g(i), h(i));

    dg2 = d_eta * (h(i) + dh1 * 0.5);
    df2 = d_eta * (g(i) + dg1 * 0.5);
    dh2 = d_eta * dh(f(i) + 0.5 * df1, g(i) + 0.5 * dg1, h(i) + 0.5 * dh1);

    dg3 = d_eta * (h(i) + dh2 * 0.5);
    df3 = d_eta * (g(i) + dg2 * 0.5);
    dh3 = d_eta * dh(f(i) + 0.5 * df2, g(i) + 0.5 * dg2, h(i) + 0.5 * dh2);

    dg4 = d_eta * (h(i) + dh3);
    df4 = d_eta * (g(i) + dg3);
    dh4 = d_eta * dh(f(i) + df3, g(i) + dg3 ,h(i) + dh3);

    g(i + 1) = g(i) + (dg1 + 2*dg2 + 2*dg3 + dg4) / 6;
    f(i + 1) = f(i) + (df1 + 2*df2 + 2*df3 + df4) / 6;
    h(i + 1) = h(i) + (dh1 + 2*dh2 + 2*dh3 + dh4) / 6;

    f_next = f;
    g_next = g;
    h_next = h;
end