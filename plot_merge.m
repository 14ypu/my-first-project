%ve do thi
close all;
config.Linewidth = 1.2;

tmHHR1 = finaltiming(:,1);
tmHHR2 = finaltiming(:,2);
tmHHR3 = finaltiming(:,3);
yHHR1 = finalHHR(:,1);
yHHR2 = finalHHR(:,2);
yHHR3 = finalHHR(:,3);

yPRS1 = PRS(:,2);
yPRS2 = PRS(:,3);
yPRS3 = PRS(:,4);

figure
set(gca,'fontname','times'); % Set it to times
title('What is my name?','FontSize',16);
%[hHHR1,hHHR2,hHHR3,hPRS1,hPRS2,hPRS3]=plotyy([timing,timing,timing],[yHHR1,yHHR2,yHHR3],[timing,timing,timing],[yPRS1,yPRS2,yPRS3]);
%set(gca,'fontname','times')  % Set it to times
%xlabel('Time after Start of Energizing (ms)','FontSize',16)
%ylabel('Combustion Pressure (bar)','FontSize',16)
%plot(timing,yHHR1,'r',timing,yHHR2,'g',timing,yHHR3,'b','LineWidth',1.5);

%[hAx,hLineHHR,hLinePRS] = plotyy(timing,[yHHR1,yHHR2,yHHR3],timing,[yPRS1,yPRS2,yPRS3]);
yyaxis left 
[hHHR] = plot([tmHHR1,tmHHR2,tmHHR3],[yHHR1,yHHR2,yHHR3]);

hHHR(1).LineStyle = '-';
hHHR(1).Color = 'red';
hHHR(2).LineStyle = '-.';
hHHR(2).Color = 'green';
hHHR(3).LineStyle = '--';
hHHR(3).Color = 'blue';
ylabel('Heat Release Rate (J/ms)','FontSize',16); % left y-axis 


yyaxis right 
[hPRS] = plot(timing,[yPRS1,yPRS2,yPRS3]);

hPRS(1).LineStyle = '-';
hPRS(1).Color = 'black';
hPRS(2).LineStyle = '-.';
hPRS(2).Color = 'magenta';
hPRS(3).LineStyle = '--';
hPRS(3).Color = 'cyan';
ylabel('Combustion Pressure (bar)','FontSize',16); % right y-axis

legend('Heat Release Rate 1','Heat Release Rate 2','Heat Release Rate 3',...
    'Combustion Pressure 1','Combustion Pressure 2','Combustion Pressure 3',...
    'FontSize',14);
grid on
for i=1:1:3
    hHHR(i).LineWidth = config.Linewidth;
    hPRS(i).LineWidth = config.Linewidth;
end
xlabel('Time after Start of Energizing (ms)','FontSize',16);
axis equal
hold on

