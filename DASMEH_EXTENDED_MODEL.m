
function [x,t]=DASMEH_MODEL(x0,timelimit,p)
% Simulate a two-state model of gene expression
import Gillespie.*

%% Network:
%   1. transcription:       0       --kR--> mRNA
%   2. translation:         mRNA    --kP--> mRNA 
%   3. mRNA decay:          mRNA    --gR--> 0
%

%% Rate constants
% p.kon  = 0.1; % kon     
% p.koff  = 0.1; % koff                      
% p.kdeg  = 0.25;  % kdeg                      
% p.kexp  = 0.5;   % ksyn
% p.kini   = 1;   % kini 
% p.kabort = 0.1;
% 
% p.kon  = 0.75; % kon     
% p.koff  = 0.25; % koff                      
% p.kdeg  = 0.15;  % kdeg                      
% p.ksyn  = 0.5;   % ksyn
% p.kini   = 0.5;   % kini 
% p.kabort = 0.1;
% 
% 
% p.kout  = 0.1;
% p.kin   = 0.1;
% 
% p.k     = 1;
% 
% timelimit =1000;

%% Initial state
tspan = [0, timelimit];  % seconds
% x0    = [0, 1, 0, 0, 0 ,0];     % mRNA

%% Specify reaction network
pfun = @propensities_2state;


stoich_matrix =[-1	1	-1	0	0	0	0	0;
                 1	0	0	-1	-1	0	0	0;
                 0	0	0	1	0	-1	0	0;
                 0	-1	1	0	1	1	0	0;
                 0	0	0	0	0	0	1	-1]';


         

%% Run simulation
[t,x] = directMethod(stoich_matrix, pfun, tspan, x0, p);

% %[t,x] = firstReactionMethod(stoich_matrix, pfun, tspan, x0, p);
% 
% % Plot time course
% figure(1);
% 
% plot(t,x(:,end),'-'); set(gca,'XLim',tspan);



end


function a = propensities_2state(x, p)
% Return reaction propensities given current state x
PIC   = x(1);
Pini  = x(2);
Peng  = x(3);
Pfree = x(4);
mRNA  = x(5);


a =[p.kini*PIC;
    p.kon*Pfree;
    p.koff*PIC;
    p.kesc*Pini;
    p.kabort*Pini;
    p.kterm*Peng;
    p.kexp*Peng;
    p.kdeg*mRNA];

 
end




  