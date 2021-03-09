hold on
histogram(PIC_end,'Normalization','probability');
histogram(Pini_end,'Normalization','probability');
histogram(Peng_end,'Normalization','probability');
histogram(Pfree_end,'Normalization','probability');
histogram(mRNA_end,'Normalization','probability');

line([mean(mRNA_end),mean(mRNA_end)], ylim, 'LineWidth', 2, 'Color', 'k');
legend('PIC','Pol2 Initiated','Pol2 Engaged','Pol2 FREE','mRNA');
xlabel('steady state level');
ylabel('Probability Density');

a = gca;

FINAL_IMAGE = a;


exportgraphics(FINAL_IMAGE,[FILE_PATH,'/','EXPERIMENT_',num2str(NUM_EXPERIMENTS),'_H','.png'])