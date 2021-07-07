clc
close all;
clear ;
%%-----------------------Aufgabe 1------------

load 'statistic_data.mat';          %% loads data from file
n = length(cdata);                  %% loads data from file
a = find(cdata<= chigh);
aval = cdata(a);
aa = find(aval>=clow);
aaval = aval(aa);       %% Zulässige Messbereich
b = find(cdata< clow);
bb = find(cdata > chigh) ;
ung = [cdata(b) , cdata(bb)];  %% Unzulässige werte bereich.
l_ung = length(ung) ;           %% länge der unzulässige Messwerte
d = find(-ung>=clow);
dval = ung(d);                  %% korrektur fähig
dval = -dval ;                  %% korrigierte messwerte
l_dval = length(dval);          %% länge korrigierte messwerte

%% ---------------Aufgabe 3---------------
m = mean(aaval);
v = var(aaval);

%%----------------Aufgabe 4---------------
mm = m *ones(1,500);
vvp = (m+v).*ones(1,500);
vvn = (m-v).*ones(1,500);
mmax =chigh*ones(1,500);      %% vector of size 1*500 containing max value of cdata
mmin = clow.*ones(1,500);      
plot(mmax,'r--'),hold,plot(mmin,'--r');  % plot
dd = setdiff(ung,-dval);
e = find(dd(1)==cdata);                 %% index von nicht korrigierbar messwerte
ee = find(dd(2)==cdata);                    %% index von nicht korrigierbar messwerte
f = find(ung(2)==cdata);
ff= find(ung(3)==cdata);
cdata(f)= -cdata(f);
cdata(ff) = -cdata(ff);
plot(cdata);
plot(mm,'r');                     %% plots mean of cdata
plot(vvp,'g-.') ,plot(vvn,'g-.');      %% plots variance under and above mean value
plot(e,cdata(e),'ro'),plot(ee,cdata(ee),'ro'),grid;  %nicht korrigierbar messwerte
cdata(e)= -cdata(e);
cdata(ee) = -cdata(ee);
title('Script:Statistic.m');




