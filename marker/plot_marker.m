close all;
fig = figure('Position',[0 0 1300 850]);
Oxy21 = [1.152 1.564 2.448];
Oxy15 = [1.6 2.256 3.184];
Oxy10 = [1.87 3 3.616];
ytotal = [Oxy21; Oxy15; Oxy10];
err21 = [0.15 0.16 0.18];
err15 = [0.1 0.12 0.17];
err10 = [0.14 0.11 0.18];
x = [800 1000 1200];

plot(x,Oxy21,'^',MarkerFaceColor=[0 0 0],MarkerSize=12,MarkerEdgeColor='none');
hold on

errorbar(x,Oxy21,err21,"vertical","LineStyle","none",Color=[0 0 0],LineWidth=1);
hold on

plot(x,Oxy15,'square',MarkerFaceColor=[1 0 0],MarkerSize=14,MarkerEdgeColor='none');
hold on

errorbar(x,Oxy15,err15,"vertical","LineStyle","none",Color=[0 0 0],LineWidth=1);
hold on

plot(x,Oxy10,'o',MarkerFaceColor=[0 0 1],MarkerSize=12,MarkerEdgeColor='none');
hold on

errorbar(x,Oxy10,err10,"vertical","LineStyle","none",Color=[0 0 0],LineWidth=1);
hold on

coefficients21 = polyfit(x, Oxy21, 1);
xFit = linspace(min(x), max(x), 1000);
yFit21 = polyval(coefficients21 , xFit);
%plot(xFit, yFit,'LineWidth', 1.25,'LineStyle','--');
plot(xFit, yFit21, 'LineWidth', 1.5,'LineStyle','--','Color',[0 0 0]);
hold on

coefficients15 = polyfit(x, Oxy15, 1);
xFit = linspace(min(x), max(x), 1000);
yFit15 = polyval(coefficients15 , xFit);
hold on;
%plot(xFit, yFit,'LineWidth', 1.25,'LineStyle','--');
plot(xFit, yFit15, 'LineWidth', 1.5,'LineStyle','--','Color',[1 0 0]);
hold on

coefficients10 = polyfit(x, Oxy10, 1);
%xFit = linspace(min(x), max(x), 1000);
yFit10 = polyval(coefficients10 , xFit);
hold on;
%plot(xFit, yFit,'LineWidth', 1.25,'LineStyle','--');
plot(xFit, yFit10, 'LineWidth', 1.5,'LineStyle','--','Color',[0 0 1]);
hold on

grid off
xlim([750 1250]);
xticks(800:200:1200);
xlabel('Ambient temperature condition (K)','FontSize',20,'Color','black'); % left y-axis 
set(gca, 'XTickLabel', {'1200','1000','800'},'FontSize',20);

ylim([0 4]);
yticks(0:0.5:4);
ylabel('Ignition delay (ms)','FontSize',20,'Color','black'); % left y-axis 

set(gca,'fontname','Times','FontSize',20); % Set it to times
set(gca,'LineWidth',2);
legend({'21% O_{2} ','','15% O_{2} ','','10% O_{2} ',''},'FontSize',20,'Fontweight','normal','Orientation','horizontal',LineWidth=1.5);
str = {'Diesel combustion';'Solenoid injector';'P_{inj} = 1000 bar'};
text(1100,1,str,'FontName','Times','FontSize',20,'FontWeight','normal',BackgroundColor=[1 1 1]);
hold on
