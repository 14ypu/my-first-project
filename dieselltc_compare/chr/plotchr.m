%%
%ve do thi CHR
close all;
format long;

data_import_800_800 = B021O2800K800barCHR;
data_import_800_1200 = B021O2800K1200barCHR;
data_import_1000_800 = B021O21000K800barCHR;
data_import_1000_1200 = B021O21000K1200barCHR;

for i = 1:1001
    tmchr_800_800 = 1000*data_import_800_800(1:i,2);
    ychr_800_800 = data_import_800_800(1:i,1);
    tmchr_800_1200 = 1000*data_import_800_1200(1:i,2);
    ychr_800_1200 = data_import_800_1200(1:i,1);
    tmchr_1000_800 = 1000*data_import_1000_800(1:i,2);
    ychr_1000_800 = data_import_1000_800(1:i,1);   
    tmchr_1000_1200 = 1000*data_import_1000_1200(1:i,2);
    ychr_1000_1200 = data_import_1000_1200(1:i,1);     
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
%set(gca,'fontname','Times','FontSize',20); % Set it to times
%set(gca,'LineWidth',1.6);
set(gca,'GridColor',color.grid);

[hchr] = plot(tmchr_800_800,ychr_800_800,tmchr_800_1200,ychr_800_1200,tmchr_1000_800,ychr_1000_800,tmchr_1000_1200,ychr_1000_1200);
config.Linewidth = 1.5; %Linewidth of main line
for i = 1:1:4
    hchr(i).LineStyle = '-';
    hchr(i).LineWidth = config.Linewidth;
end
hchr(1).Color = color.black;
hchr(2).Color = color.red;
hchr(3).Color = color.blue;
hchr(4).Color = color.green;
ylabel('Combustion Pressure (bar)','FontSize',20,'Color','black','fontname','Times'); % left y-axis 
ylim auto
%yticks(33:5:48);
legend('ychr_800_800','ychr_800_1200','ychr_1000_800','ychr_1000_1200','FontSize',20,'Fontweight','normal','fontname','Times');

ax = gca;               % get the current axis
ax.Clipping = 'off';    % turn clipping off
set(ax,'xaxisLocation','bottom')
xlabel('Time after Start of Spark Ignited (ms)','FontSize',20,'Color','black','fontname','Times');
%xlim([-100 1700]);
xlim auto
set(gca,'fontname','Times','FontSize',20); % Set it to times
%xticks(0:1:20);
set(gca,'LineWidth',2);

%str = {'P_{amb} = 51 bar';'T_{amb} = 1200 K';'P_{inj} = 1000 bar'};
%text(12.5,55,str,'FontSize',20,'FontWeight','normal',BackgroundColor=[1 1 1],fontname='times');

hold on