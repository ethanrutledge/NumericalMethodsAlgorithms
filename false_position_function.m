%%-------------------------------------------------------------------------
%Ethan Rutledge
%falseposition function
%mech105
%%-------------------------------------------------------------------------
clear
clc

format long

%ask for inputs
func=input('function:')
xl=input('lower bound:')
xu=input('upper bound:')

function [root,fx,ea,iter] = falseposition(func,xl,xu,es,maxiter)

%define variables
root=0;
fx=0;
ea=1;
fxUP=func(xu);
fxLOW=func(xl);
iter=0;
n=1;

 %check number of inputted arguments to determine if defaults are needed
if nargin == 3
    es=.0001;
    maxiter=200;
elseif nargin == 4
    maxiter=200;
end

%check if a root is within given bounds

if func(xl)*func(xu)>0
    errror('There is no root within the given bounds')
end

% continue until reaches maximum number of iterations
while iter<maxiter && abs(ea)>es
    iter=iter+1
    
    %determine value after the first iteration
    if n == 1
        fxLOW= func(xl)
     elseif n == 0
         fxUP= func(xu)
    end
    
    %determine rate of change and y-intercept
    rc= (fxUP-fxLOW)/(xu-xl);
    yI=fxUP-(rc*xu);
    
    %determine root at estimated location and value of this root
    root=-yI/rc;
    fx=func(root);
    
    %determine error
    ea=fx*100
    
    
   %determine which bound to replace
   
   if (fx*fxLOW)>0
       xl=root;
       N=1;
   else
       xu=root;
       N=0;
   end
end
end
    
    

