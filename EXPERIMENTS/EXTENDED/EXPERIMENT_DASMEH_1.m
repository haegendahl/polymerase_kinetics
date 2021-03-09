% ---- EXPERIMENT 01 ---
% Intialization of components
%N_cell = 1e3; % number of cells to simulate
%timelimit= 1000; % how much time to simulate each cell
%d=10; % number of PIC molecules

p.kini   = 0.216;
p.kon    = 0.003;
p.koff   = 0.145;
p.kesc   = 0.00159;
p.kabort = 0.0176;
p.kterm  = 0.0016;

p.kdeg   = 0.0058; % ***

p.kexp   = p.kesc*(p.kini/(p.kesc+p.kabort)); % steady state (PIC/mRNA)==1
