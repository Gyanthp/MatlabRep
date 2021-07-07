function ret = mySpline(xdata, ydata, x)
% MYSPLINE(xdata, ydata, x)
% Cubic spline interpolation for data set (xdata,ydata) at x
% Call: y = mySpline([0.2 0.4 0.5], [2 3 1], 0:.1:1)
%       returns the interpolated values for y=f(x)

n=length(xdata)-1;

% find p, q and g:
for i=1:n-1
    p(i)=(xdata(i+1)-xdata(i)) / (xdata(i+2)-xdata(i));
    q(i)=1-p(i);
    g(i)=6/(xdata(i+2)-xdata(i))*(...
        (ydata(i+2)-ydata(i+1))/(xdata(i+2)-xdata(i+1))...
      - (ydata(i+1)-ydata(i))/(xdata(i+1)-xdata(i)) );
end

% find coeffs by solving M * a' = g':
M=diag(2*ones(n-1,1),0) + diag(q(1:n-2),1) + diag(p(2:n-1),-1);
a=M\g';
a=[0; a; 0];

% find c and b:
for i=0:n-1
    c(i+1)=ydata(i+1) - a(i+1)*((xdata(i+2)-xdata(i+1))^2)/6.0;
    b(i+1)=(ydata(i+2)-ydata(i+1))/(xdata(i+2)-xdata(i+1))...
           - (xdata(i+2)-xdata(i+1))/6.0*(a(i+2)-a(i+1));
end

% interpolate at positions x:
for ix=1:length(x)
    isec=1;
    for i=1:n
        if x(ix)>xdata(i), isec=i; end
    end
    ret(ix)=a(isec)*(xdata(isec+1)-x(ix))^3/...
            6.0/(xdata(isec+1)-xdata(isec)) ...
            +a(isec+1)*(x(ix)-xdata(isec))^3/...
            6.0/(xdata(isec+1)-xdata(isec))...
            +b(isec)*(x(ix)-xdata(isec)) + c(isec);
end
