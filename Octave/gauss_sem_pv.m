clear all
#clc
format long

% Amazena o tempo de CPU inicial
t=cputime;

#printf('\n Eliminacao de Gauss sem Pivotamento \n')
#fprintf('----------------------------------------------- \n\n')

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

%matriz extentida
E =[A b];

# Tamanho da matriz
z=size(E,1);

# Monta a matriz como uma triangular
for i=2:z
    # Para cada multiplicador determindo, aplica em todas as linhas
    for l=i:z
       # Da um passo na coluna, e assim zera o valor abaixo;
       # Criando a matriz triangular
       M = E(l,i-1)/E(i-1,i-1);
       E(l,:) = E(l,:) - M * E(i-1,:);
    end
end


disp(E)

# Determina o valor da tensão de forma recursiva
V7 = E(7,8)/E(7,7);
V6 = [E(6,8) + E(6,7) * V7 * -1]/E(6,6);
V5 = [E(5,8) + E(5,7) * V7 * -1 + E(5,6) * V6 * -1]/E(5,5);
V4 = [E(4,8) + E(4,7) * V7 * -1 + E(4,6) * V6 * -1 + E(4,5) * V5 * -1 ]/E(4,4);
V3 = [E(3,8) + E(3,7) * V7 * -1 + E(3,6) * V6 * -1 + E(3,5) * V5 * -1 + E(3,4) * V4 * -1 ]/E(3,3);
V2 = [E(2,8) + E(2,7) * V7 * -1 + E(2,6) * V6 * -1 + E(2,5) * V5 * -1 + E(2,4) * V4 * -1 + E(2,3) * V3 * -1 ]/E(2,2);
V1 = [E(1,8) + E(1,7) * V7 * -1 + E(1,6) * V6 * -1 + E(1,5) * V5 * -1 + E(1,4) * V4 * -1 + E(1,3) * V3 * -1 + E(1,2) * V2 * -1]/E(1,1);

disp(V1)
disp(V2)
disp(V3)
disp(V4)
disp(V5)
disp(V6)
disp(V7)

% Tempo Total de execução
printf('Tempo total de CPU: %f seconds\n', cputime-t);
