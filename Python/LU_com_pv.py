import numpy as np
from scipy.linalg  import lu, lu_factor, lu_solve   # Biblioteca com funções para resolução LU
from time import process_time

# Imprime as saídas 
PRINT = False

# Imprime a Matriz formatada
def printMatrix(A, b):
    y = 0 
    for i in A:
        print("|", end='')
        for j in i:
            # Mostra os valores apena com 2 casas decimais
            v = "{:.2f}".format(j)
            print(f'{v:^8}', end="")
        # Mostra os valores apena com 2 casas decimais
        v = "{:.2f}".format(b[y])
        print("|", f'{v:^7}', end="|\n")
        y += 1

# Registra o tempo de inicio da execução
t1_start = process_time() 

# Array usado na validação 
A = np.array([ [11, -6,  -2,  0,  0,  0,  0],
            [-1,  3,   0, -2,  0,  0,  0],
            [-4,  0,   9, -2, -3,  0,  0],
            [ 0, -6,  -1, 10,  0, -3,  0],
            [ 0,  0,  -5,  0, 19,-10,  0],
            [ 0,  0,   0, -6, -3, 13, -4],
            [ 0,  0,   0,  0,  0, -5,  8]], float) 

b = np.array([60, 0, 0, 0, 0, 0, 0], float )

# Imprime as matrizes
if PRINT:
    printMatrix(A,b)

# Função que decompõem a Matriz; P Matriz permutada, L triangular Inferior e U triangular superior
# P, L, U = lu(A)

# LU contém as matrizes Triangular U e L; piv contém a matriz de permutação 
LU, piv = lu_factor(A) 

# Resolve a matriz usando a fatoração LU 
R = lu_solve((LU, piv), b)

# Imprime a resposta
print(R)

# Testa a solução com base na resposta encontrada em R 
#print(np.allclose(np.dot(A, R), b))
#print(np.allclose(A @ R - b, np.zeros((len(A),))))

# Registra o tempo de final da execução
t1_stop = process_time()
print("Tempo decorrido do processamento [em segundos]:",
                                         t1_stop-t1_start) 
