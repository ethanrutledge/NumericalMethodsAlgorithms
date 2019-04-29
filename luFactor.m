%%
%LU Factorization with partial pivoting
%Ethan Rutledge
%mech 105
%-------------------------------------------------------------------------
%Lu Factorization with partial pivoting such that P*A=L*U
%Inputs:
%A matrix of size n by n
%Outputs:
%L Matrix
%U Matrix
%P Matrix
%%


function [L,U,P]=luFactor(A)

%define starting variables

[n,m]=size(A);
L=eye(n);
P=L;
U=A;

%make sure that A is square matrix
if m~=n
    error('The matrix A must be square')
elseif nargin>1
    error('too many inputs')
end


for i=1:n
    % find largest absolute value in the column
    [~,j]=max(abs(U(i:n,i)));
    j=j+i-1;
   
    if j~=i
        % switch rows j and i in P
        ap=P(i,:);
        P(i,:)=P(j,:);
        P(j,:)=ap;
        % switch rows j and i in U
        ap=U(i,:);
        U(i,:)=U(j,:);
        U(j,:)=ap;
        
        if i >= 2
            ap=L(i,1:i-1);
            L(i,1:i-1)=L(j,1:i-1);
            L(j,1:i-1)=ap;
        end
    end
    for j=i+1:n
        L(j,i)=U(j,i)/U(i,i);
        U(j,:)=U(j,:)-L(j,i)*U(i,:);
    end
end

end
