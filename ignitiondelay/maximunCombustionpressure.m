close all;
fig = figure('Position',[0 0 1300 850]);
maxCombustionPress800_800 = 12.57;
maxCombustionPress800_1200 = 10.57;
maxCombustionPress1000_800 = 9.86;
maxCombustionPress1000_1200 = 11.58;

maxCombustionPress = [maxCombustionPress800_800 maxCombustionPress800_1200 maxCombustionPress1000_800 maxCombustionPress1000_1200];
%Oxy15 = [1.6 2.256 3.184];
%Oxy10 = [1.87 3 3.616];
%ytotal = [maxCombustionPress; Oxy15; Oxy10];
errhigh = [0.22 0.29 0.42 0.34];
%errlow = [0.15 0.15 0.15 0.15];
%err15 = [0.1 0.12 0.17];
%err10 = [0.14 0.11 0.18];
x = [1 2 3 4];
color.green = [0 1 0]; %refer RGB Triplet Code https://www.tug.org/pracjourn/2007-4/walden/color.pdf 
color.black = [0 0 0];
color.red = [1 0 0];
color.blue = [0 0 1];

plot(x(1,1),maxCombustionPress(1,1),'^',MarkerFaceColor=color.black,MarkerSize=17,MarkerEdgeColor='none');
hold on
plot(x(1,2),maxCombustionPress(1,2),'square',MarkerFaceColor=color.red,MarkerSize=18,MarkerEdgeColor='none');
hold on
plot(x(1,3),maxCombustionPress(1,3),'o',MarkerFaceColor=color.blue,MarkerSize=17,MarkerEdgeColor='none');
hold on
plot(x(1,4),maxCombustionPress(1,4),'diamond',MarkerFaceColor=color.green,MarkerSize=17,MarkerEdgeColor='none');
hold on

errorbar(x,maxCombustionPress,errhigh,"vertical","LineStyle","none",Color=[0 0 0],LineWidth=1.25);
hold on

x_loc = 1:length(maxCombustionPress);
y_loc = maxCombustionPress + 0.05;
text(x_loc+0.1,y_loc,num2str(maxCombustionPress'),'vert','top','horiz','left','FontSize',20,'Fontname','Times'); 
hold on
%plot(x,Oxy15,'square',MarkerFaceColor=[1 0 0],MarkerSize=14,MarkerEdgeColor='none');
%hold onx`
%
%errorbar(x,Oxy15,err15,"vertical","LineStyle","none",Color=[0 0 0],LineWidth=1);
%hold on
%
%plot(x,Oxy10,'o',MarkerFaceColor=[0 0 1],MarkerSize=12,MarkerEdgeColor='none');
%hold on
%
%errorbar(x,Oxy10,err10,"vertical","LineStyle","none",Color=[0 0 0],LineWidth=1);
%hold on

%coefficients21 = polyfit(x, maxCombustionPress, 1);
%xFit = linspace(min(x), max(x), 1000);
%yFit21 = polyval(coefficients21 , xFit);
%%plot(xFit, yFit,'LineWidth', 1.25,'LineStyle','--');
%plot(xFit, yFit21, 'LineWidth', 1.5,'LineStyle','--','Color',[0 0 0]);
%hold on
%
%coefficients15 = polyfit(x, Oxy15, 1);
%xFit = linspace(min(x), max(x), 1000);
%yFit15 = polyval(coefficients15 , xFit);
%hold on;
%%plot(xFit, yFit,'LineWidth', 1.25,'LineStyle','--');
%plot(xFit, yFit15, 'LineWidth', 1.5,'LineStyle','--','Color',[1 0 0]);
%hold on
%
%coefficients10 = polyfit(x, Oxy10, 1);
%%xFit = linspace(min(x), max(x), 1000);
%yFit10 = polyval(coefficients10 , xFit);
%hold on;
%%plot(xFit, yFit,'LineWidth', 1.25,'LineStyle','--');
%plot(xFit, yFit10, 'LineWidth', 1.5,'LineStyle','--','Color',[0 0 1]);
%hold on
ax = gca;

xlim([0.5 4.5]);
xticks(1:1:4);
%xlabel('Ambient temperature condition (K)','FontSize',20,'Color','black'); % left y-axis 
set(gca, 'XTickLabel', {'800K-800bar','800K-1200bar','1000K-800bar','1000K-1200bar'},'FontSize',20);

ylim([9 13.5]);
yticks(9:0.5: 13.5);
ylabel('Maximum Combustion Pressure (bar)','FontSize',20,'Color','black'); % left y-axis 

set(gca,'fontname','Times','FontSize',20); % Set it to times
set(gca,'LineWidth',2);
%legend({'21% O_{2} ','','15% O_{2} ','','10% O_{2} ',''},'FontSize',20,'Fontweight','normal','Orientation','horizontal',LineWidth=1.5);
str = {'Diesel combustion';'Solenoid injector';'O_{2} = 21 %'};
text(3.5,12.75,str,'FontName','Times','FontSize',20,'FontWeight','normal',BackgroundColor=[1 1 1]);

%ax.ZGrid = 'on';
ax.XGrid = 'off';
ax.YGrid = 'off';
hold on