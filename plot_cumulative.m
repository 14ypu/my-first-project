close all;
format long;
%Validate timing range
count = 1;
while A10HHR800(count,2) <= 0.02
    count = count + 1;
end
range.array_value = count; %run validate to find
%1200K
for i = 1:range.array_value
    tmHHRC20 = 1000*C20HHR1200(1:i,2);
    %tmHHRC15 = 1000*C15HHR1200(1:i,2);
    tmHHRC10 = 1000*C10HHR1200(1:i,2);
    yHHRC20 = C20HHR1200(1:i,1);
    %yHHRC15 = C15HHR1200(1:i,1);
    yHHRC10 = C10HHR1200(1:i,1);
end

%1000K
for i = 1:range.array_value
    tmHHRB20 = 1000*B20HHR1000(1:i,2);
    %tmHHRB15 = 1000*B15HHR1000(1:i,2);
    tmHHRB10 = 1000*B10HHR1000(1:i,2);
    yHHRB20 = B20HHR1000(1:i,1);
    %yHHRB15 = B15HHR1000(1:i,1);
    yHHRB10 = B10HHR1000(1:i,1);
end

%800K
for i = 1:range.array_value
    tmHHRA20 = 1000*A20HHR800(1:i,2);
    %tmHHRA15 = 1000*A15HHR800(1:i,2);
    tmHHRA10 = 1000*A10HHR800(1:i,2);
    yHHRA20 = A20HHR800(1:i,1);
    %yHHRA15 = A15HHR800(1:i,1);
    yHHRA10 = A10HHR800(1:i,1);
end

fig = figure('Name','Cumulative_Heatlease_Rate','Color','w'); %Create Figure
%Figure config
set(gca,'fontname','Carial','FontSize',18); % Set it to times
set(gca,'LineWidth',2);
set(gca,'fontweight','bold');
%Color code
color.green = [0 0.35 0]; %refer RGB Triplet Code https://www.tug.org/pracjourn/2007-4/walden/color.pdf 
color.black = [0 0 0];
color.red = [1 0 0];
color.blue = [0 0 1];

%title
title('Cumulative Heat release Rate','FontSize',20);
hold on
%plot
[hHHR1200] = plot(tmHHRC20,yHHRC20,tmHHRC10,yHHRC10);
hold on
[hHHR1000] = plot(tmHHRB20,yHHRB20,tmHHRB10,yHHRB10);
hold on
[hHHR800] = plot(tmHHRA20,yHHRA20,tmHHRA10,yHHRA10);
hold on
%Line Config
config.Linewidth = 3;
hHHR1200(1).LineStyle = '-';
hHHR1200(1).Color = color.black;
%hHHR(1).Marker = 'o';
hHHR1200(2).LineStyle = ':';
hHHR1200(2).Color = color.black;
%hHHR(2).LineWidth = 5;
%hHHR1200(3).LineStyle = '-.';
%hHHR1200(3).Color = color.black;

hHHR1000(1).LineStyle = '-';
hHHR1000(1).Color = color.red;
%hHHR(1).Marker = 'o';
hHHR1000(2).LineStyle = ':';
hHHR1000(2).Color = color.red;
%hHHR(2).LineWidth = 5;
%hHHR1000(3).LineStyle = '-.';
%hHHR1000(3).Color = color.red;

hHHR800(1).LineStyle = '-';
hHHR800(1).Color = color.blue;
%hHHR(1).Marker = 'o';
hHHR800(2).LineStyle = ':';
hHHR800(2).Color = color.blue;
%hHHR(2).LineWidth = 5;
%hHHR800(3).LineStyle = '-.';
%hHHR800(3).Color = color.blue;

%Linewidth config
for i = 1:1:2
    hHHR1200(i).LineWidth = config.Linewidth;
    hHHR1000(i).LineWidth = config.Linewidth;
    hHHR800(i).LineWidth = config.Linewidth;
end

%x-axis
ax = gca;               % get the current axis
ax.Clipping = 'off';    % turn clipping off
%set(ax,'xaxisLocation','top')

xlabel('Time after Start of Energizing (ms)','FontSize',20,'Color','black');
xlim([0 20]);
%xlim auto;
xticks(0:1:20);

%y-axis
ylabel('Heat Release Rate (J)','FontSize',20,'Color','black'); % left y-axis 
ylim ([-300 2400]); %scaling
yticks(-300:300:2400);

%Legend
%legend('21% O2 - 1200K','15% O2 - 1200K','10% O2 - 1200K',...
%    '21% O2 - 1000K','15% O2 - 1000K','10% O2 - 1000K',...
%    '21% O2 - 800K','15% O2 - 800K','10% O2 - 800K','FontSize',14,'FontWeight','normal');

legend('21% O2 - 1200K','10% O2 - 1200K',...
    '21% O2 - 1000K','10% O2 - 1000K',...
    '21% O2 - 800K','10% O2 - 800K','FontSize',14,'FontWeight','normal');
grid on
hold on

%fix_dottedline('untitled.eps');
save('cumlative_workspace')
savefig('cumulative figure')
