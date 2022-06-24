% LU com pivotamento
% ------------------

# Apaga todas as variavis
clear all;

% Amazena o tempo de CPU inicial
t=cputime;

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

% LU com pivotamento; lu e uma funcao interna; Decompoem a matriz A
y = L \ (P*b);

% Calcula as matrizes decomposta; Metodo gauss
x = U \ y

% Tempo Total de execução
printf('Tempo total de CPU: %f seconds\n', cputime-t);
