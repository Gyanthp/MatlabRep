clc
close all
clear
%% sinus annähren taylor reihe
%x0=0.75*pi;
%x=linspace(0,2*pi);
%y=sin(x);
%t=0;

%for k=0:10
%t=t+derivativ(k)*(x-x0).^k/factorial(k);
%figure(1);

%plot(x,y,x,t);
%legend('f(x)','taylor');
%pause(1);

%end

%%uebung 2 ss2015
%q1=0.2e-9;
%q2=0.5e-9;
%p1=[-0.2 -0.2];
%p2=[0.3 -0.2];
%X=linspace(-2.5,2.5);
%k=1/(4*pi*8.85e-12);
%r1=sqrt((X-p1(1)).^2+p1(2)^2);
%r2=sqrt((X-p2(1)).^2+p2(2)^2);
%v1=k*q1./r1;
%v2=k*q2./r2;
%vg=v1+v2;
%subplot(3,1,1)
%plot(X,v1);
%subplot(3,1,2);
%plot(X,v2);
%subplot(3,1,3)
%plot(X,vg);
%%
%%aufgabe 3
x=1:10;
y=[1 4 3 2 5 8 10 9 6 5];
xp=linspace(1,10);
p=polyfit(x,y,5);
pval=polyval(p,xp);


%fehler=abs(y-pval);
int=polyint(p);
area=diff(polyval(int,[1 10]));
g=[-0.8 10];
gval=polyval(g,xp);
plot(x,y,xp,pval,xp,gval);
legend('function','polyfit','gerade');
ind=find(abs(gval-pval)<0.5);
minind=find(min(pval(ind)));

hold on;
plot(xp(minind),pval(minind),'*');










%%




















