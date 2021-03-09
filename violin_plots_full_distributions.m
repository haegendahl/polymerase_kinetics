addpath('./distributionPlot/')
FILE_PATH = './EXPERIMENTS'
load('data_fixed_full_distributions.mat')
clf
figure(3)
distributionPlot(Pfree_end','histOpt',2,'widthDiv',[6 1])
distributionPlot(Pini_end','histOpt',2,'widthDiv',[6 2])
distributionPlot(Peng_end','histOpt',2,'widthDiv', [6 3])
distributionPlot(Penl_end','histOpt',2,'widthDiv', [6 4])
distributionPlot(Pause_end','histOpt',2,'widthDiv',[6 5])
distributionPlot(mRNA_end','histOpt',2,'widthDiv', [6 6])


xlim([0.5, 1.5])
ylim([-5 100])

x = 0.625;
xticks([x 0.775 0.925 1.075 1.225 1.375])
%xticklabels({'Pol2 Free','Pol2 Ini','Pol2 Eng','Pol2 Enl','Pol2 Paused','mRNA'})

labels = {'Pol2 Free','Pol2 Initiated','Pol2 Engaged','Pol2 Enlongated','Pol2 Paused','mRNA'};
labels = cellfun(@(x) strrep(x,' ','\newline'), labels,'UniformOutput',false);
a = gca;
a.XTickLabel = labels;
ylabel('Steady state level');