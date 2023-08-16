%ve do thi
close all;
format long;

for i = 1:1251
    tmHHR1 = 1000*HHR800(1:i,1);
    tmHHR2 = 1000*HHR1000(1:i,1);
    tmHHR3 = 1000*HHR1200(1:i,1);
    yHHR1 = HHR800(1:i,2)/1000;
    yHHR2 = HHR1000(1:i,2)/1000;
    yHHR3 = HHR1200(1:i,2)/1000;
end
%tmHHR1 = HHR800(:,3);
%tmHHR2 = HHR1000(:,3);
%tmHHR3 = HHR1200(:,3);
%yHHR1 = HHR800(:,4);
%yHHR2 = HHR1000(:,4);
%yHHR3 = HHR1200(:,4);
for i = 1:1251
    tmPRS1 = 1000*PRS800(1:i,1);
    tmPRS2 = 1000*PRS1000(1:i,1);
    tmPRS3 = 1000*PRS1200(1:i,1);
    yPRS1 = PRS800(1:i,2);
    yPRS2 = PRS1000(1:i,2);
    yPRS3 = PRS1200(1:i,2);
end


fig = figure('Name','Measured Data','Color','w');
color.grid = [0 0 0];
color.green = [0 0.35 0]; %refer RGB Triplet Code https://www.tug.org/pracjourn/2007-4/walden/color.pdf 
color.black = [0 0 0];
color.red = [1 0 0];
color.blue = [0 0 1];
%color. sẽ thành struct (color) với mới biến là 1 vector

left.color = color.black; %RGB Black code
right.color = color.black; %RGB Black code
set(fig,'defaultAxesColorOrder',[left.color; right.color]);
%set(gca,'defaultAxesColorOrder',[left.color; right.color]);

set(gca,'fontname','Carial','FontSize',18); % Set it to times
set(gca,'LineWidth',2);
set(gca,'fontweight','bold');
set(gca,'GridColor',color.grid);
%title('10% O2 - 1200 bar','FontSize',20);
%title('15% O2 - 1200 bar','FontSize',20);
title('20% O2 - 1200 bar','FontSize',20);

%[hHHR1,hHHR2,hHHR3,hPRS1,hPRS2,hPRS3]=plotyy([timing,timing,timing],[yHHR1,yHHR2,yHHR3],[timing,timing,timing],[yPRS1,yPRS2,yPRS3]);
%set(gca,'fontname','times')  % Set it to times
%xlabel('Time after Start of Energizing (ms)','FontSize',16)
%ylabel('Combustion Pressure (bar)','FontSize',16)
%plot(timing,yHHR1,'r',timing,yHHR2,'g',timing,yHHR3,'b','LineWidth',1.5);
%[hAx,hLineHHR,hLinePRS] = plotyy(timing,[yHHR1,yHHR2,yHHR3],timing,[yPRS1,yPRS2,yPRS3]);

yyaxis left 
[hHHR] = plot(tmHHR1,yHHR1,tmHHR2,yHHR2,tmHHR3,yHHR3);

hHHR(1).LineStyle = '-';
hHHR(1).Color = color.red;
%hHHR(1).Marker = 'o';
hHHR(2).LineStyle = ':';
hHHR(2).Color = color.green;
%hHHR(2).LineWidth = 5;
hHHR(3).LineStyle = '-.';
hHHR(3).Color = color.blue;
ylabel('Heat Release Rate (J/ms)','FontSize',20,'Color','black'); % left y-axis 
ylim ([0 700]); %scaling
%yticks(-1:0.1:7);

yyaxis right 
[hPRS] = plot(tmPRS1,yPRS1,tmPRS2,yPRS2,tmPRS3,yPRS3);

hPRS(1).LineStyle = '-';
hPRS(1).Color = color.red;
hPRS(2).LineStyle = ':';
hPRS(2).Color = color.green;
hPRS(3).LineStyle = '-.';
hPRS(3).Color = color.blue;
ylabel('Combustion Pressure (bar)','FontSize',20); % right y-axis
ylim ([-2 16]);
yticks(-2:2:16);

legend('10%O2 - 800K - 1200bar','10%O2 - 1000K - 1200bar','10%O2 - 1200K - 1200bar','FontSize',14);
str = {'A simple plot';'Note here'};
text(15,7,str,"FontSize",18,FontWeight="bold");
%grid on
%grid minor

config.Linewidth = 2; %Linewidth of main line
%for i=1:1:3
   % hHHR(i).LineWidth = config.Linewidth;
   % hPRS(i).LineWidth = config.Linewidth;
%end
hHHR(1).LineWidth = config.Linewidth;
hPRS(1).LineWidth = config.Linewidth;
hHHR(2).LineWidth = config.Linewidth + 0.5;
hPRS(2).LineWidth = config.Linewidth + 0.5;
hHHR(3).LineWidth = config.Linewidth;
hPRS(3).LineWidth = config.Linewidth;

%set(gcf, 'Color', 'w'); 
%set(gca, 'color', 'none'); 

%X-axis config
ax = gca;               % get the current axis
ax.Clipping = 'off';    % turn clipping off
set(ax,'xaxisLocation','top')

xlabel('Time after Start of Energizing (ms)','FontSize',20,'Color','black');
xlim([0 20]);
xticks(0:1:20);
hold on
