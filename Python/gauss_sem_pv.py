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
            print(f'{j:^7}', end="")
        print("|", f'{b[y]:^7}', end="|\n")
        y += 1

# Função que calcula via métodos de GAUSS
def Gauss(A, b) :
    n = len(b)
    x = np.zeros(n, float)
  
    if PRINT:
        print( '= ' * 30)
        print('\t\t Após a analise PV ')
        print( '= ' * 30)
        printMatrix(A,b)

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
    
    if PRINT:
        f = 'SOLUCAO DO SISTEMA'
        print( '= ' * (len(f)+15)) 
        print( f'{ f :^50}')
        print( '= ' * (len(f)+15)) 
        print('Onde: ')
        for c in range(0, len(x)):
            print(f'\t x[{c}] = {x[c]} \n') 

    # Retona a Resposta
    return x

# Registra o tempo de inicio da execução 
t1_start = process_time()

# Array usado na validação
A = np.array([ [11, -6,  -2,  0,  0,  0,  0],
            [-1,  3,   0, -2,  0,  0,  0],
            [-4,  0,   9, -2, -3,  0,  0],
            [ 0, -6,  -1, 10,  0, -3,  0],
            [ 0,  0,  -5,  0, 19,-10,  0],
            [ 0,  0,   0, -6, -3, 13, -4],
            [ 0,  0,   0,  0,  0, -5,  8]],float) 

b = np.array([60, 0, 0, 0, 0, 0, 0],float)

if PRINT:
    printMatrix(A,b)

print(Gauss(A, b))

# Registra o tempo de final da execução 
t1_stop = process_time()
print("Tempo decorrido do processamento [em segundos]:",
                                         t1_stop-t1_start) 
