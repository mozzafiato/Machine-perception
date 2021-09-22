function [W,Ms, MM]=f_lda(X,c,n)

SB=0; SW=0;
MM=mean(X,2); %overall mean

for i=1:c
    Ms(:,i)=mean(X(:,(i-1)*n+1:i*n),2); %class means
    SB=SB+n*(Ms(:,i)-MM)*(Ms(:,i)-MM)'; % between class scatter m.
    for j=1:n % within class scatter matrix
        SW=SW+(X(:,(i-1)*n+j)-Ms(:,i))*(X(:,(i-1)*n+j)-Ms(:,i))';
    end
end

% the solution of a generalized eigenproblem:
[W, ~] = eigs(SW\SB, c-1,'LM');
Ms=W'*Ms; %map means into the LDA space