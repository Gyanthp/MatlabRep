clc
close all
clear


p = struct('Xsd',0.4,'Xsh',2,'xo',0,'Ts',0.5);
t = 0:0.001:4*pi;

[nu,ny,acc,Ts,x] = mZweipunkt('init'  ,t,[],[], p);

for i = 1:length(t)
    u(i) = 2*p.Xsh*sin(t(i));
    [y(i),x] = mZweipunkt('output',0,x,u(i),p);
end

plot(u,y),grid on;