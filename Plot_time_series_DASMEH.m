hold on
plot(timespan, mean(PIC_evolve));
plot(timespan, mean(Pini_evolve));
plot(timespan, mean(Peng_evolve));
plot(timespan, mean(Pfree_evolve));
plot(timespan, mean(mRNA_evolve));

legend('PIC','Pol2 Initiated','Pol2 Engaged','Pol2 FREE','mRNA');
xlabel('time, sec')
ylabel('molecules')

a = gca;

FINAL_IMAGE = a;


exportgraphics(FINAL_IMAGE,[FILE_PATH,'/','EXPERIMENT_',num2str(NUM_EXPERIMENTS),'_T','.png'])