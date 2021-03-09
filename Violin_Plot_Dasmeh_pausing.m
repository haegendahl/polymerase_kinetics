A=[cellstr(repmat('1',size(Pfree_end))); cellstr(repmat('2',size(Pfree_end))); cellstr(repmat('3',size(Pfree_end)));....
    cellstr(repmat('4',size(Pfree_end)));cellstr(repmat('5',size(Pfree_end)));cellstr(repmat('6',size(Pfree_end)))];


DATA = [PIC_end;Pini_end;Peng_end;Pfree_end;Paused_end;mRNA_end];
DATA = DATA(:);



vs = violinplot(DATA,A,'Width',0.3,'Bandwidth',1,'ShowData',false);

labels = {'PIC','Pol2 Initiated','Pol2 Engaged','Pol2 FREE','Paused','mRNA'};
labels = cellfun(@(x) strrep(x,' ','\newline'), labels,'UniformOutput',false);
a = gca;
a.XTickLabel = labels;

ylabel('Steady state level');


FINAL_IMAGE = a;

exportgraphics(FINAL_IMAGE,[FILE_PATH,'/','EXPERIMENT_',num2str(jj),'_V','.png'])