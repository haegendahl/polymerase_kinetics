clear all
close all

FILE_PATH = './RESULTS/EXTENDED';

% Intialization of components
N_cell = 10e3; % number of cells to simulate
timelimit= 1000; % how much time to simulate each cell
d=10; % number of DNA molecules


r_end=zeros(N_cell,1);

%% Rate constants

timespan = 0:1:timelimit;

%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%

NUM_EXPERIMENTS=1;


for jj = 1:NUM_EXPERIMENTS
    
    
    FILENAME=['EXPERIMENT_DASMEH_',num2str(jj)];
    
    run(['EXPERIMENTS/EXTENDED/',FILENAME]);
    
    %% Initial state
    
    
    x0=d*[1,0,0,0,0]; 
    
    for i=1:N_cell
        fprintf('Calculating species for cell %g/%g...\n',i,N_cell);
        [x,t] = DASMEH_EXTENDED_MODEL(x0,timelimit,p);       
        
        
        PIC_end(i,:)   = x(end,end-4);
        Pini_end(i,:)  = x(end,end-3);
        Peng_end(i,:)  = x(end,end-2);
        Pfree_end(i,:) = x(end,end-1);
        mRNA_end(i,:)  = x(end,end);
        
        PIC_evolve(i,:)   = floor(pchip(t,x(:,end-4),timespan));
        Pini_evolve(i,:)  = floor(pchip(t,x(:,end-3),timespan));
        Peng_evolve(i,:)  = floor(pchip(t,x(:,end-2),timespan));
        Pfree_evolve(i,:) = floor(pchip(t,x(:,end-1),timespan));
        mRNA_evolve(i,:)  = floor(pchip(t,x(:,end),timespan));
        
                
    end
    

disp(['DONE!']);



% Plotting results

figure(1)
clf
Plot_time_series_EXTENDED

figure(2)
clf
Plot_histogram_EXTENDED

figure(3)
clf
Violin_Plot_EXTENDED

% Save variables of each experiment

save([FILE_PATH,'/',FILENAME,'.mat'], 'timespan', 'Pfree_end','Pini_end','Peng_end','mRNA_end') 
end