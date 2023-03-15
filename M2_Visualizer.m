%% This .m file contains the visualization part of the HW and is seperated 
% with the intention of decluttering the main code.

% Point of inflection identification

[poi_val, poi_pos] = min(abs(hh_master(1:round(last_etas(1)*0.5),1)));

%% f' plot
figure(1);
plot(eta_master(1:last_etas(1),1), g_master(1:last_etas(1),1),"Color", "#071013", "LineWidth", 1.5)
hold on
xlabel("\eta", 'FontSize', 10)
ylabel("f'(\eta)", 'FontSize', 10)
grid on

plot(eta_master(1:last_etas(2),2), g_master(1:last_etas(2),2),"Color", "#23b5d3", "LineWidth", 1.5)
plot(eta_master(1:last_etas(3),3), g_master(1:last_etas(3),3),"Color", "#B4DC7F", "LineWidth", 1.5)
plot(eta_master(1:last_etas(4),4), g_master(1:last_etas(4),4),"Color", "#dc602e", "LineWidth", 1.5)

%% plot the point of inflection

plot(eta_master(poi_pos,1), g_master(poi_pos, 1) , "o","MarkerSize",7,"Color","red")
quiver(eta_master(poi_pos,1) + 1, g_master(poi_pos, 1) - 0.1, -1, 0.1, "filled", "Color","k")

legend("\beta = -0.19","\beta = 0", "\beta = 0.29", "\beta = 1", "Location","southeast")
text(eta_master(poi_pos,1) + 1, g_master(poi_pos, 1) - 0.1, " Point of inflection @ \eta = " + eta_master(poi_pos,1))

ax = gca;
ax.FontSize = 10;

%% f'' plot
figure(2)
plot(eta_master(1:last_etas(1),1), h_master(1:last_etas(1),1),"Color", "#071013", "LineWidth", 1.5)

hold on
xlabel("\eta", 'FontSize', 10)
ylabel("f''(\eta)", 'FontSize', 10)
grid on

plot(eta_master(1:last_etas(2),2), h_master(1:last_etas(2),2),"Color", "#23b5d3", "LineWidth", 1.5)
plot(eta_master(1:last_etas(3),3), h_master(1:last_etas(3),3),"Color", "#B4DC7F", "LineWidth", 1.5)
plot(eta_master(1:last_etas(4),4), h_master(1:last_etas(4),4),"Color", "#dc602e", "LineWidth", 1.5)

legend("\beta = -0.19","\beta = 0", "\beta = 0.29", "\beta = 1", "Location","northeast")


%% f''' plot
figure(3)
plot(eta_master(1:last_etas(1),1), hh_master(1:last_etas(1),1),"Color", "#071013", "LineWidth", 1.5)
hold on
xlabel("\eta", 'FontSize', 10)
ylabel("f'''(\eta)", 'FontSize', 10)
grid on

plot( eta_master(1:last_etas(2),2), hh_master(1:last_etas(2),2),"Color", "#23b5d3", "LineWidth", 1.5)
plot( eta_master(1:last_etas(3),3), hh_master(1:last_etas(3),3),"Color", "#B4DC7F", "LineWidth", 1.5)
plot( eta_master(1:last_etas(4),4), hh_master(1:last_etas(4),4),"Color", "#dc602e", "LineWidth", 1.5)

ax = gca;
ax.FontSize = 10;

yline(0,"LineWidth",1);
xline(eta_master(poi_pos,1),"k--");
legend("\beta = -0.19","\beta = 0", "\beta = 0.29", "\beta = 1", "Location","southeast")
