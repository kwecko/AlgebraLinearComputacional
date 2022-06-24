import numpy as np
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

# Função que calcula via métodos de GAUSS
def gauss(A, b) :
    n = len(b)
    x = np.zeros(n, float)
  
    # Eliminação progressiva
    for k in range(0,n-1):                
        for i in range(k+1, n):                          
            # fator de multiplicação 
            fator=A[i,k]/A[k,k] 
            # Aplica o multiplicador 
            for j in range(k, n):
                A[i, j]=A[i, j] - A[k, j] * fator 
            b[i] = b[i] - b[k] * fator
                  
    # Substituição regressiva
    x[n-1] = b[n-1] / A[n-1, n-1] 
    for i in range(n-2, -1, -1):
        sum_ax = 0
        for j in range(i+1, n):
            sum_ax+=A[i, j] * x[j]
        x[i] = (b[i] - sum_ax) / A[i, i] 

    return x    # Retorna a Resposta


# Resolve um sistema Linear via fatoração LU 
def resolve_LU(A, b): 
    m = len(A)
    y = np.zeros(m) 
    x = np.zeros(m)
    U = A
    L = np.zeros([m, m])
    for k in range(0, m):
        for r in range(0, m):
            if (k == r):
                L[k,r]=1 
            if(k<r):
                factor = (A[r, k]/A[k, k]) 
                L[r, k] = factor
                for c in range(0, m):
                    U[r, c] = A[r, c] - (factor * A[k, c])

    A = np.zeros([m, m])
    for r in range(0, m):
        for c in range(0, m):
            for k in range(0, m):
                A[r, c] += (L[r, k] * U[k, c])

    # Possível usar a função np.linalg.solve
    y = gauss(L, b) 
    return  gauss(U, y)     # Retorna a resposta


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

# Resolve a matriz usando a fatoração LU 
R = resolve_LU(A, b)

# Imprime a resposta
print(R)

# Testa a solução com base na resposta encontrada em R 
#print(np.allclose(np.dot(A, R), b))
#print(np.allclose(A @ R - b, np.zeros((len(A),))))     # ou

# Registra o tempo de final da execução
t1_stop = process_time()
print("Tempo decorrido do processamento [em segundos]:",
                                         t1_stop-t1_start) 
