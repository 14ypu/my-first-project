%ve do thi
close all;
format long;

for i = 1:1251
    tmHHR1 = 1000*HHR10(1:i,1);
    tmHHR2 = 1000*HHR15(1:i,1);
    tmHHR3 = 1000*HHR20(1:i,1);
    yHHR1 = HHR10(1:i,2)/1000;
    yHHR2 = HHR15(1:i,2)/1000;
    yHHR3 = HHR20(1:i,2)/1000;
end
%tmHHR1 = HHR800(:,3);
%tmHHR2 = HHR1000(:,3);
%tmHHR3 = HHR1200(:,3);
%yHHR1 = HHR800(:,4);
%yHHR2 = HHR1000(:,4);
%yHHR3 = HHR1200(:,4);
for i = 1:1251
    tmPRS1 = 1000*PRS10(1:i,1);
    tmPRS2 = 1000*PRS15(1:i,1);
    tmPRS3 = 1000*PRS20(1:i,1);
    yPRS1 = PRS10(1:i,2);
    yPRS2 = PRS15(1:i,2);
    yPRS3 = PRS20(1:i,2);
end


fig = figure('Name','Measured Data','Color','w','Position',[0 0 1300 850]);
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

set(gca,'fontname','Times','FontSize',20); % Set it to times
set(gca,'LineWidth',1.25);
%set(gca,'fontweight','bold');
set(gca,'GridColor',color.grid);
%title('10% O2 - 1200 bar','FontSize',20);
%title('15% O2 - 1200 bar','FontSize',20);
%title('20% O2 - 1200 bar','FontSize',20);

%[hHHR1,hHHR2,hHHR3,hPRS1,hPRS2,hPRS3]=plotyy([timing,timing,timing],[yHHR1,yHHR2,yHHR3],[timing,timing,timing],[yPRS1,yPRS2,yPRS3]);
%set(gca,'fontname','times')  % Set it to times
%xlabel('Time after Start of Energizing (ms)','FontSize',16)
%ylabel('Combustion Pressure (bar)','FontSize',16)
%plot(timing,yHHR1,'r',timing,yHHR2,'g',timing,yHHR3,'b','LineWidth',1.5);
%[hAx,hLineHHR,hLinePRS] = plotyy(timing,[yHHR1,yHHR2,yHHR3],timing,[yPRS1,yPRS2,yPRS3]);

yyaxis left 
[hHHR] = plot(tmHHR1,yHHR1,tmHHR2,yHHR2,tmHHR3,yHHR3);

hHHR(1).LineStyle = '-.';
hHHR(1).Color = color.blue;
%hHHR(1).Marker = 'o';
hHHR(2).LineStyle = ':';
hHHR(2).Color = color.red;
%hHHR(2).LineWidth = 5;
hHHR(3).LineStyle = '-';
hHHR(3).Color = color.black;
ylabel('Heat Release Rate (J/ms)','FontSize',20,'Color','black'); % left y-axis 
ylim ([-200 600]); %scaling
%yticks(-1:0.1:7);

yyaxis right 
[hPRS] = plot(tmPRS1,yPRS1,tmPRS2,yPRS2,tmPRS3,yPRS3);

hPRS(1).LineStyle = '-.';
hPRS(1).Color = color.blue;
hPRS(2).LineStyle = ':';
hPRS(2).Color = color.red;
hPRS(3).LineStyle = '-';
hPRS(3).Color = color.black;
ylabel('Combustion Pressure (bar)','FontSize',20); % right y-axis
ylim ([PRS10(1,2)-4 PRS10(1,2)+12]);
%ylim auto;
yticks(PRS10(1,2)-4 : 2 : PRS10(1,2)+12);

legend(' 10% O_{2 } ',' 15% O_{2 } ',' 21% O_{2 } ','FontSize',20,'Fontweight','normal');
%str = {'A simple plot';'Note here'};
%text(15,7,str,"FontSize",16,FontWeight="bold");
%grid on
%grid minor

config.Linewidth = 1.75; %Linewidth of main line
%for i=1:1:3
   % hHHR(i).LineWidth = config.Linewidth;
   % hPRS(i).LineWidth = config.Linewidth;
%end
hHHR(1).LineWidth = config.Linewidth;
hPRS(1).LineWidth = config.Linewidth;
hHHR(2).LineWidth = config.Linewidth + 0.3;
hPRS(2).LineWidth = config.Linewidth + 0.3;
hHHR(3).LineWidth = config.Linewidth;
hPRS(3).LineWidth = config.Linewidth;

%set(gcf, 'Color', 'w'); 
%set(gca, 'color', 'none'); 

%X-axis config
ax = gca;               % get the current axis
ax.Clipping = 'off';    % turn clipping off
set(ax,'xaxisLocation','bottom')

xlabel('Time after Start of Injector Energizing (ms)','FontSize',20,'Color','black');
xlim([0 20]);
xticks(0:1:20);

str = {'P_{amb} = 51 bar';'T_{amb} = 1200 K';'P_{inj} = 1000 bar'};
text(12.5,55,str,'FontSize',20,'FontWeight','normal',BackgroundColor=[1 1 1],fontname='times');

hold on
