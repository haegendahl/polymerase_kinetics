clear all
close all

FILE_PATH = './RESULTS/EXTENDED_WITH_PAUSING';

% Intialization of components
N_cell = 15e0; % number of cells to simulate
timelimit= 10000; % how much time to simulate each cell
d=10; % number of DNA molecules


r_end=zeros(N_cell,1);

%% Rate constants

timespan = 0:1:timelimit;

%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%

NUM_EXPERIMENTS=9;


for jj = 1:NUM_EXPERIMENTS
    
    
    FILENAME=['EXPERIMENT_DASMEH_',num2str(jj)];
    
    run(['EXPERIMENTS/EXTENDED_WITH_PAUSING/',FILENAME]);
    
    %% Initial state
    
    
    x0=d*[1,0,0,1,0,0]; 
    
    for i=1:N_cell
        fprintf('Calculating species for cell %g/%g...\n',i,N_cell);
        [x,t] = DASMEH_EXTENDED_MODEL_with_pausing(x0,timelimit,p);       
        
        
        PIC_end(i,:)    = x(end,end-5);
        Pini_end(i,:)   = x(end,end-4);
        Peng_end(i,:)   = x(end,end-3);
        Pfree_end(i,:)  = x(end,end-2);
        Paused_end(i,:) = x(end,end-1);
        mRNA_end(i,:)   = x(end,end);
        
        PIC_evolve(i,:)   = floor(pchip(t,x(:,end-5),timespan));
        Pini_evolve(i,:)  = floor(pchip(t,x(:,end-4),timespan));
        Peng_evolve(i,:)  = floor(pchip(t,x(:,end-3),timespan));
        Pfree_evolve(i,:) = floor(pchip(t,x(:,end-2),timespan));
        Paused_evolve(i,:)= floor(pchip(t,x(:,end-1),timespan));
        mRNA_evolve(i,:)  = floor(pchip(t,x(:,end),timespan));
        
                
    end
    

disp(['DONE!']);



figure(1)
clf
Plot_time_series_PAUSING

figure(2)
clf
Plot_histogram_pausing

figure(3)
clf
Violin_Plot_Dasmeh_pausing


save([FILE_PATH,'/',FILENAME,'.mat'], 'timespan', 'Pfree_end','Pini_end','Peng_end','Paused_end','mRNA_end') 
end