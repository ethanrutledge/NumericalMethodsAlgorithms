%%
%Simpson's 1/3 Rule function
%Made by: Ethan Rutledge
%For: Mech105
%-------------------------------------------------------------------------
%Numerically integrates a given set of data using Simpson's 1/3 Rule
%INPUTS:
%x-given manipulated data
%y-given function value with respect to x
%OUTPUT:
%I-solved integral value
%WARNINGS:
%x & y must be the same length
%x must be evenly spaced
%if odd number of intervals Trapezoidal Method will be used on last
%interval
%-------------------------------------------------------------------------
%%

function I=Simpson(x,y)

if length(x)~=length(y) %checks that x an y are the same length
    error('x and y must be the same length')
end

if abs(x-linspace(x(1),x(end),length(x)))<eps(1) %checks that x is an evenly spaced vector
    
    if rem((length(x)-1),2)==1 %checks if odd number of intervals
        warning('There are an odd number of intervals so the Trapezoidal Method will be used on the last interval')
        
        %define variables to make Simpson's 1/3 rule and Trapezoidal method
        %equations cleaner
        n=length(x);
        fx0=y(1);
        fx1=y(ceil((n-1)/2));
        fx2=y(n-1);
        h=(x(n-1)-x(1))/2;
        
        %solves Simpson's 1/3 rule and Trapezoidal method equations
        IS=(h/3)*(fx0+(4*fx1)+fx2)/2;
        ITZ=(x(n)-x(n-1))*(y(n)+y(n-1));
        
        %computes total integral
        I=IS+ITZ;
        
    elseif rem((length(x)-1),2)==0 %check if even number of intervals
        
        %define variables to make Simpson's 1/3 rule equation cleaner
        n=length(x);
        fx0=y(1);
        fx1=y(ceil((n)/2));
        fx2=y(n);
        h=(x(n)-x(1))/2;
        
        %computes integral
        I=(h/3)*(fx0+(4*fx1)+fx2);
    end
else
    error('x must be an evenly spaced vector')
end



 