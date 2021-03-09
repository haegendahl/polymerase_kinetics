hold on
plot(timespan, mean(PIC_evolve));
plot(timespan, mean(Pini_evolve));
plot(timespan, mean(Peng_evolve));
plot(timespan, mean(Pfree_evolve));
plot(timespan, mean(Paused_evolve));
plot(timespan, mean(mRNAn_evolve));
plot(timespan, mean(mRNA_evolve));

legend('PIC','Pol2 Initiated','Pol2 Engaged','Pol2 FREE','Paused','mRNAn','mRNA');
xlabel('time, sec')
ylabel('molecules')

a = gca;

FINAL_IMAGE = a;

jj

exportgraphics(FINAL_IMAGE,[FILE_PATH,'/','EXPERIMENT_',num2str(jj),'_T','.png'])

