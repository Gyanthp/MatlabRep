clc
clear
close 
p = struct("dpN",0.2,"qN",10);
t = 0;
figure(1),clf, set(gcf,'Color','white')
p2 = 1; Nstep = 10 ;
dp = 0:p.dpN/Nstep:p.dpN;
y= 0:100/Nstep:100;
[nu,ny,acc,Ts,X]=mFluidValve('init',t,[],[],p);
