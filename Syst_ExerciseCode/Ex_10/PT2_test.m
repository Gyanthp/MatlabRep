clc
clear

Ts = 0.01; %Abtaste rate
t= 1:0.5:30; %simulation time in s
u=ones(size(t));    % einheit sprung
%% konstante a,b,c
a=(1+Ts)^2;
b=(2+2*Ts);
c=3*(Ts)^2;


y(1)=c/a;
y(2)=y(1)+ y(1)*(b/a);
for i=3:59
    y(i) = (c/a)*u(i)+ (b/a)*y(i-1)- (1/a)*y(i-2);
    
end
plot(t,y),title("Sprungantwort eines PT2-Systems(Ts=0.5s)"),xlabel("Time in s-->"),...
    ylabel("h(t)-->"),grid on,hold on;



%%% Aufgabe 2
p=struct("a2",4,"a1",2,"a0",1,"b0",3,"Ts",0.5,"xo",[0;0]);
%%initialize
[nu,ny,acc,Ts,xo] = mPT2   ('init', t,[],[], p);






