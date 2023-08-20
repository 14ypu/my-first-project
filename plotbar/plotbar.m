close all;
fig2 = figure;
%input parameter
Oxy21 = [9.47 10.04 8.36];
Oxy16 = [13.66 14.70 12.04];
Oxy11 = [16.22 17.20 17.42];
y = [Oxy21; Oxy16; Oxy11];
errhigh = [0.7264 1.0624 0.732; 0.84 1.58 1.241; 1.20 1.78 1.23];
errlow = [0.6736 1.1136 0.778; 0.7968 1.38 1.176; 1.1328 1.88 1.63];
%err = 0.3*y;
%y = [Oxy21 Oxy16 Oxy11];
%x = categorical({'Oxy21%','Oxy16%','Oxy11%'});
%x = reordercats(x,{'Oxy21%','Oxy16%','Oxy11%'});
%ylim([0 5]);
%bp = bar(x,y,'BarWidth',1); %Acceptable range [0 1] 
bp = bar(y,'BarWidth',1,'LineWidth',1.5); %Acceptable range [0 1] 
hold on
for k = 1:size(y,2)
    % get x positions per group
    xpos = bp(k).XData + bp(k).XOffset;
    % draw errorbar
    errorbar(xpos, y(:,k), errlow(:,k),errhigh(:,k), 'LineStyle', 'none', ... 
        'Color', 'k', 'LineWidth', 1.5);
end
%title('What is my name?','FontSize',20,'Position',[2 4.7])
xlabel('Oxygen Concentration','FontSize',16);
ylabel('Combustion duration (ms)','FontSize',16);
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
for i = 1:numel(bp)
    bp(i).FaceColor = 'none';
end
hold on
%bp(1).FaceColor = 'r';
%bp(2).FaceColor = 'g';
%bp(3).FaceColor = 'b';
%hatchfill2(legendABC(1),'single','HatchAngle',0,'hatchcolor',[0 0 0],'HatchLineWidth',1.5);

legend([A B C],{'1200K' '1000K' '800K'},'FontSize',16,'FontWeight','normal');

%set(gca,'YTick',0:1:4,'YTickLabel',0:1:5)
set(gca,'YLim',[0 22]);
set(gca,'YTick',0:2:22);
set(gca, 'XTickLabel', {'21% O2','15% O2','10% O2'});
ax = gca;
ax.XAxis.FontSize = 16; %Xtick fontsize %https://www.mathworks.com/matlabcentral/answers/511665-fontsize-and-properties-of-xticklabels-using-figure-handles
ax.YAxis.FontSize = 16; %Ytick fontsize
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
%    text(x,row,num2str(row'),'vert','bottom','horiz','center','FontSize',18,'FontWeight','bold');
%end
%str = {'P_{inj} = 1000bar';'m_{inj} = 67.93mg'};
%text(0.9,20,str,'FontSize',16,'FontWeight','normal',BackgroundColor=[1 1 1]);

set(gca,'fontname','Carial','FontSize',16); % Set it to times
set(gca,'LineWidth',1.5);
set(gca,'fontweight','bold');

%grid on
hold on
