function varargout = mPT2(flag, t, x, u, p)
% odeblock: ODE-M-Block (execution part)
%   [nu,ny,acc,Ts,xo] = mPT2('init'  ,   t,[],[], p)
%   [y, x]            = mPT2('output',   t, x, u, p)
%                       mPT2('terminate',t, x)
% Definitions:
% flag    : M-block mode: 'init', 'output', 'terminate'
% t       : simulation time in s (not used)
% x       : inner state; for size see xo
% u(nu=1) : u       Eingangsgröße
% p-struct: Ts      sampling rate in s
%           c1      Koeffizient 1
%           c2      Koeffizient 2
%           xo      initial state [v(0) dv/dt(0)] in m/s, m/s^2
% y(ny=1) : [v]
%           v        Ausgangsgröße
% acc     : 1 (direct access)
%
% Editor: L.Billmann    02/16/2013
%
switch flag
case 'init'     % [nu,ny,acc,Ts,x] = mPT2   ('init', t,[],[], p)
    varargout{1} = 1;    % fill in the number of inputs
    varargout{2} = 1;    % fill in the number of outputs
    varargout{3} = 1;    % if direct access behavior then set to 1 else 0
    varargout{4} = p.Ts; % sampling rate in s or -1 for inherited
    varargout{5} = struct('old',p.xo);         % initial state

case 'output'   % [y, x] = mPT2   ('output', t, x, u, p)
    varargout{1} = x.old(1);                              % output equation
    % .............  add here the possible feedtrough quotas to the outputs
    [tt,xx] = ode23(@fxdot,[0 p.Ts],x.old,[],p,u);
    x.old = xx(end,:);
    varargout{2} = x;

case 'terminate'    % mPT2   ('terminate',t, x)
    % do some finalizing things
otherwise % Unexpected flags
    error(['Unexpected flag: ' flag])
end

% dynamic model
function [xdot]=fxdot(t,x,p,u)
v   = x(1);
dv = x(2);
x1dot = dv;
x2dot = (p.b0/p.a2)*u - (p.a1/p.a2)*dv - (p.a0/p.a2)*v ;
xdot=[x1dot; x2dot];
return 