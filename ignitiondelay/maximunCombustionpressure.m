close all;
fig2 = figure('Position',[0 0 1300 850]);
%input parameter
maxCombustionPress800_800 = 12.57;
maxCombustionPress800_1200 = 10.75;
maxCombustionPress1000_800 = 9.86;
maxCombustionPress1000_1200 = 11.58;
maxCombustionPress = [maxCombustionPress800_800;maxCombustionPress800_1200;maxCombustionPress1000_800;maxCombustionPress1000_1200];
errhigh = [1 ;1; 1; 1];
errlow = [1; 2 ;1; 1];

%err = 0.3*y;
%y = [1200K 1000K 800K];
%x = categorical({'1200K','1000K','800K'});
%x = reordercats(x,{'1200K','1000K','800K'});
%ylim([0 5]);
%bp = bar(x,y,'BarWidth',1); %Acceptable range [0 1] 
bp = bar(maxCombustionPress,'BarWidth',0.7,'LineWidth',1.5); %Acceptable range [0 1] 
hold on
for k = 1:size(maxCombustionPress,2)
    % get x positions per group
    xpos = bp(k).XData + bp(k).XOffset;
    % draw errorbar
    errorbar(xpos, maxCombustionPress(:,k), errlow(:,k),errhigh(:,k), 'LineStyle', 'none', ... 
        'Color', 'k', 'LineWidth', 1.5);
end
%title('What is my name?','FontSize',20,'Position',[2 4.7])
xlabel('Ambient temperature (K)','FontSize',20,'FontName','times');
ylabel('Maximum Combustion Pressure (ms)','FontSize',20,'FontName','times');
%{
hp = bar(y);
cm = colororder; % or replace with the desired colormap
hatchfill2(hp(1),'single','HatchAngle',0,'hatchcolor',cm(1,:));
hatchfill2(hp(2),'cross','HatchAngle',45,'hatchcolor',cm(2,:));
hatchfill2(hp(3),'single','HatchAngle',45,'hatchcolor',cm(3,:));
for i = 1:numel(hp)
    hp(i).FaceColor = 'none';
end
%}
cm = colororder; % or replace with the desired colormap
A = hatchfill2(bp(1),'single','HatchAngle',0,'hatchcolor',[0 0 0],'HatchLineWidth',1.5);
B = hatchfill2(bp(2),'cross','HatchAngle',45,'hatchcolor',[1 0 0],'HatchLineWidth',1.5);
C = hatchfill2(bp(3),'single','HatchAngle',45,'hatchcolor',[0 0 1],'HatchLineWidth',1.5);
D = hatchfill2(bp(4),'single','HatchAngle',45,'hatchcolor',[0 0 1],'HatchLineWidth',1.5);

for i = 1:numel(bp)
    bp(i).FaceColor = 'none';
end
hold on
%bp(1).FaceColor = 'r';
%bp(2).FaceColor = 'g';
%bp(3).FaceColor = 'b';
%hatchfill2(legendABC(1),'single','HatchAngle',0,'hatchcolor',[0 0 0],'HatchLineWidth',1.5);

%legend([A B C D],{' 21% O_{2} ' ' 15% O_{2} ' ' 10% O_{2} '},'FontSize',20,'FontWeight','normal');

%set(gca,'YTick',0:1:4,'YTickLabel',0:1:5)
set(gca,'YLim',[4 16]);
set(gca,'YTick',4:2:16);
set(gca, 'XTickLabel', {'1200','1000','800','zz'},'FontName','times');
ax = gca;
ax.XAxis.FontSize = 20; %Xtick fontsize %https://www.mathworks.com/matlabcentral/answers/511665-fontsize-and-properties-of-xticklabels-using-figure-handles
ax.YAxis.FontSize = 20; %Ytick fontsize
set(gca,'fontname','Times','FontSize',20); % Set it to times

%text(,num2str(y(:,1)),'HorizontalAlignment','center','VerticalAlignment','bottom');
%errhigh = 0.1*y;
%errlow  = (-0.1)*y;
%er = errorbar(x,y,errlow,errhigh);   

%xCnt = vertcat(bp.XEndPoints);
%text(xCnt(:),y(:),compose('%d',y(:)),'HorizontalAlignment','center','VerticalAlignment','bottom');
%text(1:length(y),y,num2str(y),'vert','bottom','horiz','center')

%width = bp.BarWidth;
%for i=1:length(y(:, 1))
%    row = y(i, :);
%    % 0.5 is approximate net width of white spacings per group
%    offset = ((width + 0.3) / length(row)) / 2;
%    x = linspace(i-offset, i+offset, length(row));
%    text(x,row,num2str(row'),'vert','bottom','horiz','center','FontSize',18,'FontWeight');
%end
%str = {'P_{inj} = 1000bar';'m_{inj} = 67.93mg'};
%text(0.9,20,str,'FontSize',16,'FontWeight','normal',BackgroundColor=[1 1 1]);

%set(gca,'fontname','Carial','FontSize',20); % Set it to times
set(gca,'LineWidth',1.5);
set(gca,'fontweight');

%str = {'Diesel combustion';'Solenoid injector';'P_{inj} = 1000 bar'};
%text(1.1,14,str,'FontSize',20,'FontWeight','normal',BackgroundColor=[1 1 1],fontname='times');

%grid on
hold on
