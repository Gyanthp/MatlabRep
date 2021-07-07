clc
close all
phi =0:10:70;
v=[0.148 0.149 0.135 0.128 0.113 0.093 0.073 0.051]; %% gemessene
vv= v.*cosd(phi); %% theory
plot(phi,v,phi,vv,'.-'),grid on,xlabel("Winkel in grad--->"),ylabel("Geschwindigkeit v in m/S-->"),...
    legend("Gemessen","Theoretisch");


%% 
ort=[13.7 13.6 13.5 13.4 13.3 13.2 13.1 13 12.8 12.6 12.4 12.2 12 11.8 11.6 11.4 11.2 11 10.8...
    10.6 10.4 10.2 10 9.80 9.6 9.4 9.19 9 8.80 8.6 8.4 8.2 8.1 8.0 7.9 7.8];
V=[0.473 0.451 0.521 0.593 0.653 0.673 0.715 0.717 0.762 0.784 0.806 0.818 0.838 0.845 0.848...
    0.850 0.852 0.847 0.844 0.843 0.852 0.850 0.848 0.842 0.834 0.829 0.808 0.799 0.778 0.740 0.713...
    0.649 0.591 0.528 0.470 0.505]

plot(ort,V),grid on,xlabel("Ort in mm"),ylabel("V in m/s"),hold on ;
v_mittel=ones(1,36)*0.148;
hold on;
plot(ort,v_mittel)
