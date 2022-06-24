% LU com pivotamento
% ------------------

# Apaga todas as variavis
clear all;

% Amazena o tempo de CPU inicial
t=cputime;

% Funcoes
% -------

function [x]=solveL(L,b)   #L: matriz triangular inferior
  n=size(L,1);              #b: vetor
  x(1)=b(1)/L(1,1);

  for i=2:n
      x(i)=(b(i)-L(i,1:i-1)*x(1:i-1)')/L(i,i);
  end
  x'(i);
endfunction

function [x]=solveUP(U,b)    #U: matriz triangular superior
   n=length(b);              #b: vetor
   x=zeros(n,1);
   for k=n:-1:1;
   x(k)=b(k)/U(k,k);
    for i=1:k-1
        b(i)=b(i)-x(k)*U(i,k);
    end
   end
endfunction


printf('\n\n Fatoracao LU sem Pivotamento \n')
fprintf('-------------------------------- \n')

% Matriz
A = [ 11 -6  -2   0   0   0   0;
      -1  3   0  -2   0   0   0;
      -4  0   9  -2  -3   0   0;
       0  -6 -1  10   0  -3   0;
       0   0 -5   0  19  -10  0;
       0   0  0  -6  -3  13  -4;
       0   0  0   0   0  -5   8];

%Vetor Coluna
b = [ 60; 0; 0; 0; 0; 0; 0];

% LU com pivotamento ; lu e uma funcao interna
[L, U, P] = lu(A);

%y=solveL(L,P*b);
%x=solveUP(U,y)

y = L \ (P*b);
x = U \ y

% Tempo Total de execução
printf('Tempo total de CPU: %f seconds\n', cputime-t);
