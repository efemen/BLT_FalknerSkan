%% This .m file contains the visualization part of the HW and is seperated 
% with the intention of decluttering the main code.


%% theta plot
figure(1);
plot(eta_master(1:last_etas(1),1), t_master(1:last_etas(1),1),"Color", "#071013", "LineWidth", 1.5)
hold on
xlabel("\eta", 'FontSize', 10)
ylabel("\theta", 'FontSize', 10)
grid on

plot(eta_master(1:last_etas(2),2), t_master(1:last_etas(2),2),"Color", "#23b5d3", "LineWidth", 1.5)
plot(eta_master(1:last_etas(3),3), t_master(1:last_etas(3),3),"Color", "#B4DC7F", "LineWidth", 1.5)
plot(eta_master(1:last_etas(4),4), t_master(1:last_etas(4),4),"Color", "#dc602e", "LineWidth", 1.5)

legend("Pr = 0.02","Pr = 0.9", "Pr = 1", "Pr = 90", "Location","northeast")

ax = gca;
ax.FontSize = 10;

%% f'' plot
figure(2)
plot(eta_master(1:last_etas(1),1), dt_master(1:last_etas(1),1),"Color", "#071013", "LineWidth", 1.5)

hold on
xlabel("\eta", 'FontSize', 10)
ylabel("f''(\eta)", 'FontSize', 10)
grid on

plot(eta_master(1:last_etas(2),2), dt_master(1:last_etas(2),2),"Color", "#23b5d3", "LineWidth", 1.5)
plot(eta_master(1:last_etas(3),3), dt_master(1:last_etas(3),3),"Color", "#B4DC7F", "LineWidth", 1.5)
plot(eta_master(1:last_etas(4),4), dt_master(1:last_etas(4),4),"Color", "#dc602e", "LineWidth", 1.5)

legend("Pr = 0.02","Pr = 0.9", "Pr = 1", "Pr = 90", "Location","southeast")


