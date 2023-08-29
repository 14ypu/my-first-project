%plot([1 2 3 4 5 6],[0 3 1 6 4 10],'o')
%hold on
%plot([1 2 3 4 5 6],[0 3 1 5 4 10],'^')
%hold on
%x = [1 2 3 4 5 6];
%y = [0 3 1 3 4 10];
close all;
fig = figure('Position',[0 0 1300 850]);
Oxy21 = [1.152 1.564 2.448];
Oxy15 = [1.6 2.256 3.184];
Oxy10 = [1.87 3 3.616];
ytotal = [Oxy21; Oxy15; Oxy10];
err = [0.15 0.1 0.14; 0.16 0.12 0.11; 0.18 0.17 0.18];
x = [800 1000 1200];

plot(x,Oxy21,'o',MarkerFaceColor=[1 0 0],MarkerSize=12,MarkerEdgeColor='none');
hold on
errorbar(x,Oxy21,err,"vertical","LineStyle","none");
hold on
plot(x,Oxy15,'^',MarkerFaceColor=[0 1 0],MarkerSize=12,MarkerEdgeColor='none');
hold on
plot(x,Oxy10,'square',MarkerFaceColor=[0 0 1],MarkerSize=14,MarkerEdgeColor='none');
hold on

coefficients21 = polyfit(x, Oxy21, 1);
xFit = linspace(min(x), max(x), 1000);
yFit = polyval(coefficients21 , xFit);
hold on;
%plot(xFit, yFit,'LineWidth', 1.25,'LineStyle','--');
plot(xFit, yFit, 'LineWidth', 1.5,'LineStyle','--','Color',[1 0 0]);

hold on

coefficients15 = polyfit(x, Oxy15, 1);
xFit = linspace(min(x), max(x), 1000);
yFit = polyval(coefficients15 , xFit);
hold on;
%plot(xFit, yFit,'LineWidth', 1.25,'LineStyle','--');
plot(xFit, yFit, 'LineWidth', 1.5,'LineStyle','--','Color',[0 1 0]);

hold on

coefficients10 = polyfit(x, Oxy10, 1);
xFit = linspace(min(x), max(x), 1000);
yFit = polyval(coefficients10 , xFit);
hold on;
%plot(xFit, yFit,'LineWidth', 1.25,'LineStyle','--');
plot(xFit, yFit, 'LineWidth', 1.5,'LineStyle','--','Color',[0 0 1]);

hold on


%trendline(x,Oxy21);
%hold on
%trendline(x,Oxy15);
%hold on
%trendline(x,Oxy10);
%hold on
grid off
xlim([750 1250]);
xticks(800:200:1200);
set(gca, 'XTickLabel', {'1200','1000','800'});

ylim([0 4]);
yticks(0:0.5:4);