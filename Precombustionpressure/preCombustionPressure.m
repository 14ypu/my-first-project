%ve do thi
close all;
format long;

for i = 1:100001
    tmPreCombustionPress = 1000*CombustionPressure(1:i,1);
    yPreCombustionPress = CombustionPressure(1:i,2);
end

fig = figure('Name','Measured Data','Color','w','Position',[0 0 1300 850]);
color.grid = [0 0 0];
color.green = [0 0.35 0]; %refer RGB Triplet Code https://www.tug.org/pracjourn/2007-4/walden/color.pdf 
color.black = [0 0 0];
color.red = [1 0 0];
color.blue = [0 0 1];
left.color = color.black; %RGB Black code
right.color = color.black; %RGB Black code
set(fig,'defaultAxesColorOrder',[left.color; right.color]);
set(gca,'fontname','Times','FontSize',20); % Set it to times
set(gca,'LineWidth',1.25);
set(gca,'GridColor',color.grid);

[hHHR] = plot(tmPreCombustionPress,yPreCombustionPress);
hHHR(1).LineStyle = '-';
hHHR(1).Color = color.blue;
ylabel('Combustion Pressure (bar)','FontSize',20,'Color','black','fontname','Times'); % left y-axis 
ylim ([5 75]);

%legend(' 10% O_{2 } ','FontSize',20,'Fontweight','normal','fontname','Times');

config.Linewidth = 2; %Linewidth of main line
hHHR(1).LineWidth = config.Linewidth;
hPRS(1).LineWidth = config.Linewidth;

ax = gca;               % get the current axis
ax.Clipping = 'off';    % turn clipping off
set(ax,'xaxisLocation','bottom')
xlabel('Time after Start of Spark Ignited (ms)','FontSize',20,'Color','black','fontname','Times');
xlim([-100 1700]);
set(gca,'fontname','Times','FontSize',20); % Set it to times
%xticks(0:1:20);

%str = {'P_{amb} = 51 bar';'T_{amb} = 1200 K';'P_{inj} = 1000 bar'};
%text(12.5,55,str,'FontSize',20,'FontWeight','normal',BackgroundColor=[1 1 1],fontname='times');

hold on
