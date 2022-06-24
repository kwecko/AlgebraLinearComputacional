%clear all
%clc
format short

% Amazena o tempo de CPU inicial
t=cputime;

%% Com pivotamento
%------------------

fprintf(' Metodo de eliminacao de Gauss com Pivotamento \n')
fprintf('----------------------------------------------- \n\n')

% Matriz
A = [ 11 -6 -2    0   0  0   0;
      -1  3  0   -2   0  0   0;
      -4  0  9   -2  -3  0   0;
       0  -6 -1  10   0  -3  0;
       0   0 -5   0  19  -10 0;
       0   0  0  -6  -3  13 -4;
       0   0  0   0   0  -5  8];

%Vetor Coluna
b = [ 60; 0; 0; 0; 0; 0; 0];

%Calculo Gauss com pivotamento; \ Funcao interna
S = A\b

% Tempo Total de execução
printf('Tempo total de CPU: %f seconds\n', cputime-t);
