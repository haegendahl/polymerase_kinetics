% COLORS
hold all
A=[cellstr(repmat('1',size(Pfree_end))); cellstr(repmat('2',size(Pfree_end))); cellstr(repmat('3',size(Pfree_end)));....
    cellstr(repmat('4',size(Pfree_end)));cellstr(repmat('5',size(Pfree_end)));cellstr(repmat('6',size(Pfree_end)));cellstr(repmat('7',size(Pfree_end)));cellstr(repmat('8',size(Pfree_end)))];


DATA = [PIC_end;Pini_end;Peng_end;Pfree_end;Paused_end;mRNAn_end;mRNA_end;mRNAn_end+mRNA_end ];
DATA = DATA(:);



violin = violinplot(DATA,A,'Width',0.3,'Bandwidth',1,'ShowData',false);

labels = {'PIC','Pol2 Initiated','Pol2 Engaged','Pol2 FREE','Paused','mRNA_n','mRNA_c','mRNA_t'};
labels = cellfun(@(x) strrep(x,' ','\newline'), labels,'UniformOutput',false);
c = brighten(parula(10),0.5);

violin(1).ViolinColor = c(1,:); %[0         0.4470    0.7410];
violin(2).ViolinColor = c(2,:); %[0.8500    0.3250    0.0980];
violin(3).ViolinColor = c(3,:); %[0.9290    0.6940    0.1250]; 
violin(4).ViolinColor = c(4,:); %[0.4940    0.1840    0.5560]; 
violin(5).ViolinColor = c(5,:); %[0.4660    0.6740    0.1880]; 
violin(6).ViolinColor = c(6,:); %[0.3010    0.7450    0.9330];
violin(7).ViolinColor = c(7,:); %[0.6350    0.0780    0.1840];
violin(8).ViolinColor = c(8,:); %[0.9290    0.6940    0.1245];

a = gca;
a.XTickLabel = labels;

ylabel('Steady state level');
ylim([0 35])


FINAL_IMAGE = a;

exportgraphics(FINAL_IMAGE,[FILE_PATH,'/','EXPERIMENT_',num2str(jj),'_V','.png'])