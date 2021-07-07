function varargout = mFluidValve(flag, t, x,u,p)
%MFLUIDVALVE Summary of this function goes here
%   Detailed explanation goes here

switch flag
    case 'init' 
        varargout{1} = 3 ;
        varargout{2} = 1 ;
        varargout{3} = 1 ;
        varargout{4} = -1 ;
        varargout{5} = [];
    case 'output'
        p1 = u(1);
        y = u(2) ;
        p2 = u(3);
        
        y =  min(100,max(0,y));
        q = p.qN * 0.01*y*sqrt(max(0,(p1-p2)/p.dpN));
        varargout{1} = q;
        varargout {2} = x;
end

