
function [x,t]=DASMEH_MODEL(x0,timelimit,p)

import Gillespie.*



%% Initial state
tspan = [0, timelimit];  % seconds
% x0    = [0, 1, 0, 0, 0 ,0];     % mRNA

%% Specify reaction network
pfun = @propensities_2state;

            
stoich_matrix = [-1  1 -1  0  0    0  0;
                  1  0  0 -1 -1	   0  0;
                  0	 0	0  1  0	  -1  0;
                  0	-1	1  0  1    1  0;
                  0	 0	0  0  0	   1 -1]';

         

%% Run simulation
[t,x] = directMethod(stoich_matrix, pfun, tspan, x0, p);


end


function a = propensities_2state(x, p)
% Return reaction propensities given current state x
PIC   = x(1);
Pini  = x(2);
Peng  = x(3);
Pfree = x(4);
mRNA  = x(5);


 a=[p.kini*PIC;
    p.kon*Pfree;
    p.koff*PIC;
    p.kesc*Pini;
    p.kabort*Pini;
    p.kterm*Peng;
    p.kexp*mRNA];
 
end




  