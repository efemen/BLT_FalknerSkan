%% This .m file contains the visualization part of the HW and is seperated 
% with the intention of decluttering the main code.

vel_figure = figure(1);
plot(eta_master(1:last_etas(1),1), g_master(1:last_etas(1),1),"Color", "#071013", "LineWidth", 1.5)
hold on
xlabel("\eta", 'FontSize', 10)
ylabel("f'(\eta)", 'FontSize', 10)
grid on

plot(eta_master(1:last_etas(2),2), g_master(1:last_etas(2),2),"Color", "#23b5d3", "LineWidth", 1.5)
plot(eta_master(1:last_etas(3),3), g_master(1:last_etas(3),3),"Color", "#B4DC7F", "LineWidth", 1.5)
plot(eta_master(1:last_etas(4),4), g_master(1:last_etas(4),4),"Color", "#dc602e", "LineWidth", 1.5)


legend("\beta = 1","\beta = 0.29", "\beta = 0", "\beta = -0.19", "Location","southeast")
ax = gca;
ax.FontSize = 10;

figure(2)
plot(eta_master(1:last_etas(1),1), h_master(1:last_etas(1),1),"Color", "#071013", "LineWidth", 1.5)
hold on
xlabel("\eta", 'FontSize', 10)
ylabel("f''(\eta)", 'FontSize', 10)
grid on

plot(eta_master(1:last_etas(2),2), h_master(1:last_etas(2),2),"Color", "#23b5d3", "LineWidth", 1.5)
plot(eta_master(1:last_etas(3),3), h_master(1:last_etas(3),3),"Color", "#B4DC7F", "LineWidth", 1.5)
plot(eta_master(1:last_etas(4),4), h_master(1:last_etas(4),4),"Color", "#dc602e", "LineWidth", 1.5)
legend("\beta = 1","\beta = 0.29", "\beta = 0", "\beta = -0.19", "Location","northeast")

figure(3)
plot(eta_master(1:last_etas(1) - 1,1), diff(h_master(1:last_etas(1),1)),"Color", "#071013", "LineWidth", 1.5)
hold on
xlabel("\eta", 'FontSize', 10)
ylabel("f'''(\eta)", 'FontSize', 10)
grid on

plot(eta_master(1:last_etas(2)-1,2), diff(h_master(1:last_etas(2),2)),"Color", "#23b5d3", "LineWidth", 1.5)
plot(eta_master(1:last_etas(3)-1,3), diff(h_master(1:last_etas(3),3)),"Color", "#B4DC7F", "LineWidth", 1.5)
plot(eta_master(1:last_etas(4)-1,4), diff(h_master(1:last_etas(4),4)),"Color", "#dc602e", "LineWidth", 1.5)
legend("\beta = 1","\beta = 0.29", "\beta = 0", "\beta = -0.19", "Location","northeast")



