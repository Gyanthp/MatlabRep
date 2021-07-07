%% Modell Simulation for a mechanical system block mSMD2
clear
p=struct('m1',0.2,'m2',0.3,'k1',2.3,'k2',5.0,'k3',3.1,'b',0.5,'xo',[0 0 0 0],'Ts',0.1);
Tsim = 20;
t=0:p.Ts:Tsim;

%%Block function Test
[nu,ny,acc,Ts,x]= mSMD2('init',0,[],[],p);


for i=1:length(t)
    u=1.0*t(i)>=0;   %% Unit step 
    [y(i,:),x] = mSMD2('output',0,x,u,p);
end


%%plot result
figure(1),clf,set(gcf,'Color','White');
plot(t,y(:,1),'k-',t,y(:,2),'k','Linewidth',2),grid on;