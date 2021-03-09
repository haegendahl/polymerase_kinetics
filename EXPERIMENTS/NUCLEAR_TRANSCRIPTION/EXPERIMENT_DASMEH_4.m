% ---- EXPERIMENT 04 ---
% EXPERIMENT: (1). For instance, increase 100 fold kexp and kdeg to work in the low mRNA count limit.
% Intialization of components
% N_cell = 1e3; % number of cells to simulate
timelimit= 2e5; % how much time to simulate each cell
timespan = 0:1:timelimit;
%d=10; % number of PIC molecules

p.kini   = 0.216;
p.kon    = 0.003;
p.koff   = 0.145;
p.kesc   = 1;
p.kabort = 0.0176;
p.kdeg   = 0.0003; 

p.kexp = 100*(0.0003);   

p.kp     = 0.0001;
p.kq     = 0.001;

p.kterm0  = 0.0016;
p.kterm = p.kterm0.*(1+(p.kp)/(p.kq));  