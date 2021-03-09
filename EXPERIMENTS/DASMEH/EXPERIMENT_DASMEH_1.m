% ---- EXPERIMENT 01 ---

p.kini   = 0.216; % kon     
p.kon    = 0.003;  % koff
p.koff   = 0.145;
p.kesc   = 0.00159;  
p.kabort = 0.0176; 
p.kterm  = 0.0016; 

p.kdeg   = 0.0058; % ***



p.kexp   = p.kesc*(p.kini/(p.kesc+p.kabort)); % steady state (PIC/mRNA)==1
%p.kexp   = 0.01
p.kp     = 0.006;
p.kq     = 0.0058;
