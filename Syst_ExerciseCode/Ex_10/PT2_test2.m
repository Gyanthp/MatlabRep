clc

clear


%%Parameters
p= struct("a0",1 ,"a1", 2 ,"a2",4 ,"b0",3 ,"Ts",0.01,"xo",[0 0]);
%%Simulation time t in s
t=1:p.Ts:30;
%%Engangsgröße
u=ones(size(t));

%initialize
 [nu,ny,acc,Ts,x] = mPT2   ('init', t,[],[], p);
 
 %%simulate for t sec
 for i=1:length(t)
     [y(i), x] = mPT2   ('output', t, x, u(i), p);
     
 end
 
 plot(t,y),grid on;
 
