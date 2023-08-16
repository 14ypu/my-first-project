%<<<<<<< HEAD
close all;
fig2 = figure;
Oxy21 = [9.4 11.1 8.6];
Oxy16 = [12.8 13.6 12];
Oxy11 = [15.1 19.7 17.8];
y = [Oxy21; Oxy16; Oxy11];
%err = 0.3*y;
%y = [Oxy21 Oxy16 Oxy11];
%x = categorical({'Oxy21%','Oxy16%','Oxy11%'});
%x = reordercats(x,{'Oxy21%','Oxy16%','Oxy11%'});
%ylim([0 5]);


%bp = bar(x,y,'BarWidth',1); %Acceptable range [0 1] 
bp = bar(y,'BarWidth',1,'LineWidth',1.5); %Acceptable range [0 1] 

hold on
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
A = hatchfill2(bp(1),'single','HatchAngle',0,'hatchcolor',[1 0 0],'HatchLineWidth',1.5);
B = hatchfill2(bp(2),'cross','HatchAngle',45,'hatchcolor',[0 1 0],'HatchLineWidth',1.5);
C = hatchfill2(bp(3),'single','HatchAngle',45,'hatchcolor',[0 0 1],'HatchLineWidth',1.5);
for i = 1:numel(bp)
    bp(i).FaceColor = 'none';
end
hold on
%bp(1).FaceColor = 'r';
%bp(2).FaceColor = 'g';
%bp(3).FaceColor = 'b';


legend([A B C],{'1200K' '1000K' '800K'},'FontSize',16);

%set(gca,'YTick',0:1:4,'YTickLabel',0:1:5)
set(gca,'YLim',[0 22]);
set(gca,'YTick',0:2:22);
set(gca, 'XTickLabel', {'21% O2','15% O2','10% O2'});
ax = gca;
ax.XAxis.FontSize = 18; %Xtick fontsize %https://www.mathworks.com/matlabcentral/answers/511665-fontsize-and-properties-of-xticklabels-using-figure-handles
ax.YAxis.FontSize = 18; %Ytick fontsize
%text(,num2str(y(:,1)),'HorizontalAlignment','center','VerticalAlignment','bottom');
%errhigh = 0.1*y;
%errlow  = (-0.1)*y;
%er = errorbar(x,y,errlow,errhigh);   

%xCnt = vertcat(bp.XEndPoints);
%text(xCnt(:),y(:),compose('%d',y(:)),'HorizontalAlignment','center','VerticalAlignment','bottom');
%text(1:length(y),y,num2str(y),'vert','bottom','horiz','center')

width = bp.BarWidth;
for i=1:length(y(:, 1))
    row = y(i, :);
    % 0.5 is approximate net width of white spacings per group
    offset = ((width + 0.3) / length(row)) / 2;
    x = linspace(i-offset, i+offset, length(row));
    text(x,row,num2str(row'),'vert','bottom','horiz','center','FontSize',18,'FontWeight','bold');
end

set(gca,'fontname','Carial','FontSize',20); % Set it to times
set(gca,'LineWidth',1.5);
set(gca,'fontweight','bold');


grid on
hold on

%%
%{
y = [10,20,30,15];

a = bar(y);

labels = {'A', 'B', 'C', 'D'};

xt = get(gca, 'XTick');
text(xt, y, labels, 'HorizontalAlignment','center', 'VerticalAlignment','bottom')
%}
%%
%>>>>>>> 80f885e613e8607bba27c92f8697fb82d91db572
