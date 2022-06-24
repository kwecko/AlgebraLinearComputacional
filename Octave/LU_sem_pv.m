% LU sem pivotamento
% -------------------

# Apaga todas as variavis
clear all

% Amazena o tempo de CPU inicial
t=cputime;

% Funcoes
% -------

function [L,U]=fatoraLUsemPivot(M)
  n=size(M,1);
  L=eye(n,n);  % Start L off as identity and populate the lower triangular half slowly
  for k = 1:n
        % For each row k, access columns from k+1 to the end and divide by
        % the diagonal coefficient at A(k ,k)
      L(k + 1:n,k) = M(k + 1: n,k)/M(k, k);

      % For each row k+1 to the end, perform  Gaussian elimination
      % In the end, A will contain U
      for l = k + 1: n
          M(l, :) = M(l, :) - L(l, k) * M(k, :);
      end
  end
  U = M;
endfunction


function [x]=solveL(L,b)    #L: matriz triangular inferior
  n=size(L,1);              #b: vetor
  x(1)=b(1)/L(1,1);

  for i=2:n
      x(i)=(b(i)-L(i,1:i-1)*x(1:i-1)')/L(i,i);
  end
  x'(i)
endfunction

function [x]=solvesUP(U,b)    #U: matriz triangular superior
   n=length(b);               #b: vetor
   x=zeros(n,1);
   for k=n:-1:1;
   x(k)=b(k)/U(k,k);
    for i=1:k-1
        b(i)=b(i)-x(k)*U(i,k);
    end
   end
endfunction


fprintf('\n\n Fatoracao LU sem Pivotamento \n')
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

%% fatoraLUnopivot sem pivotamento; Func externa
[L,U]=fatoraLUsemPivot(A);

%% SolveL Matriz Triangular Super; Func externa
y=solveL(L,b);

%% SolveUp Matriz Triangular Inferior; Func externa
x=solvesUP(U,y)

% Tempo Total de execução
printf('Tempo total de CPU: %f seconds\n', cputime-t);
