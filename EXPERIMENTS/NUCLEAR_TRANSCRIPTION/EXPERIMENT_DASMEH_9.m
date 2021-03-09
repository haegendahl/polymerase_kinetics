% ---- EXPERIMENT 09 ---
% Intialization of parameters

N_cell = 15e1; % number of cells to simulate
timelimit= 2e5; % how much time to simulate each cell
timespan = 0:1:timelimit;
d=10; % number of PIC molecules

p.kini   = 0.216;
p.kon    = 0.003;
p.koff   = 0.145;

p.kabort = 0.0176;
p.kdeg   = 0.0003; 

p.kexp = 0.0003;  % we have the right to choose whichever export rate we want

p.kterm0  = 0.0016;
p.kesc   = 3*p.kterm0;

p.kp     = 1000*p.kterm0;
p.kq     = 0.001;

p.kterm = p.kterm0.*(1+(p.kp)/(p.kq));  