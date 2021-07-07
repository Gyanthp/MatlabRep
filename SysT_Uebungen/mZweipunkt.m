function varargout = mZweipunkt(flag, t, x, u, p)
% mBlock_: M-Block template file (execution part)
%   [nu,ny,acc,Ts,xo] = mZweipunkt('init'  ,   t,[],[], p)
%   [y, x]            = mZweipunkt('output',   t, x, u, p)
%                       mZweipunkt('terminate',t, x)
% Definitions:
% flag    : M-block mode: 'init', 'output', 'terminate'
% t       : simulation time in s
% x       : inner state; for size see xo
% u(nu=2) : [u1 u2] input signals
% p-struct: Ts      sampling rate in s or -1 for inherited conds.
%           a       coeff
%           b       coeff
%           xo      initial outputs [y1(t=0) y2(t=0)]
% y(ny=2) : [y1 y2] output signals
% acc     : 1 (direct access)
%

switch flag
    
case 'init'     % [nu,ny,acc,Ts,xo]=mBlock('init',t,[],[],p)
    varargout{1} = 2;  % fill in the number of inputs
    varargout{2} = 2;  % fill in the number of outputs
    varargout{3} = 1;  % if direct access then 1 else 0
    varargout{4} = p.Ts; % sampling rate in s or -1 for inherited
    varargout{5} = struct('y1',p.xo(1),'y2',p.xo(2));  % initial state;
                                                       % may be a struct
    
case 'output'   % [y, x]=mBlock('output',t,x,u,p)
    y(1)=p.a*x.y1 + p.b*u(1);
    y(2)=u(2) - x.y2;
    x.y1 = y(1);
    x.y2 = y(2);

    varargout{1} = y;
    varargout{2} = x;
    
case 'terminate'    % mBlock('terminate',t,x)
    % do some finalizing things
    
otherwise % Unexpected flags
    error(['Unexpected flag: ' flag])
end
