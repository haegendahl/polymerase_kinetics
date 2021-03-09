
function [x,t]=DASMEH_EXTENDED_MODEL_with_pausing(x0,timelimit,p)
% Simulate a two-state model of gene expression
import Gillespie.*


%% Initial state
tspan = [0, timelimit];  % seconds
% x0    = [0, 1, 0, 0, 0 ,0];     % mRNA

%% Specify reaction network
pfun = @propensities_2state;
               

stoich_matrix = [-1	1	-1	0	0	0	0	0	0	0
1	0	0	-1	-1	0	0	0	0	0
0	0	0	1	0	-1	-1	1	0	0
0	-1	1	0	1	1	0	0	0	0
0	0	0	0	0	0	1	-1	0	0
0	0	0	0	0	0	0	0	1	-1]';



%% Run simulation
[t,x] = directMethod(stoich_matrix, pfun, tspan, x0, p);



end


function a = propensities_2state(x, p)
% Return reaction propensities given current state x
PIC   = x(1);
Pini  = x(2);
Peng  = x(3);
Pfree = x(4);
Paused = x(5);
mRNA  = x(6);


a=[ p.kini*PIC;
    p.kon*Pfree;
    p.koff*PIC;
    p.kesc*Pini;
    p.kabort*Pini;
    p.kterm*Peng;
    p.kp*Peng;
    p.kq*Paused;
    p.kexp*Peng;
    p.kdeg*mRNA];


end




  