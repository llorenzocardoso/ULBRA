import random
import time

def enfileirar(lista, valor):
    lista.append(valor)

def aleatorio(lista, valor):
    while len(lista) < valor:
        aleatorio = random.randint(1, 100)
        if aleatorio not in lista:
            enfileirar(lista, aleatorio)

def selection_sort(lista):
    for i in range(len(lista)):
        for j in range(i + 1, len(lista)):
            if lista[j] < lista[i]:
                temp = lista[i]
                lista[i] = lista[j]
                lista[j] = temp
    return lista

def cronometro(alg):
    inicio = time.time()
    alg
    fim = time.time()
    tempo = fim - inicio
    print(f'Tempo de execução: {tempo:.100f} segundos')

def bubble_sort(lista):
    for i in range(len(lista)):
        for j in range(len(lista) - 1, i, -1):
            if lista[j] < lista[j - 1]:
                temp = lista[j]
                lista[j] = lista[j-1]
                lista[j-1] = temp
    print(lista)
    
def insertion_sort(lista):
    for i in range(1, len(lista)):
        chave = lista[i]
        j = i - 1
        while j >= 0 and chave < lista[j]:
            lista[j + 1] = lista[j]
            j -= 1
        lista[j + 1] = chave

    
    return lista
    
def merge_sort(lista):
    if len(lista) > 1:
        meio = len(lista) // 2
        metade_esquerda = lista[:meio]
        metade_direita = lista[meio:]

        merge_sort(metade_esquerda)

        merge_sort(metade_direita)

        i = j = k = 0

        while i < len(metade_esquerda) and j < len(metade_direita):
            if metade_esquerda[i] < metade_direita[j]:
                lista[k] = metade_esquerda[i]
                i += 1
            else:
                lista[k] = metade_direita[j]
                j +=1
            k+= 1

        while i < len(metade_esquerda):
            lista[k] = metade_esquerda[i]
            i += 1
            k += 1

        while j < len(metade_direita):
            lista[k] = metade_direita[j]
            j += 1
            k += 1
    
def quick_sort(lista):
    if len(lista) <= 1:
        return lista
    else:
        pivot = lista[0]
        menores = []
        maiores = []
        
        for x in lista [1:]:
            if x <= pivot:
                menores.append(x)
            else:
                maiores.append(x)
        
        menores_ordenados = quick_sort(menores)
        maiores_ordenados = quick_sort(maiores)
        
        ordenados = menores_ordenados + [pivot] + maiores_ordenados
        return ordenados

lista_original = []

while True:
    print("""MENU
1 - DIGITAR NÚMERO
2 - CRIAR LISTA ALEATÓRIA
3 - IMPRIMIR LISTA
4 - SELECTION SORT
5 - BUBBLE SORT
6 - INSERTION SORT
7 - MERGE SHOT
9 - LIMPAR LISTA
0 - SAIR""")
    
    opc = int(input("Digite uma opção: "))

    if opc == 0:
        break

    elif opc == 1:
        num = int(input("Digite um valor para enfileirar: "))
        enfileirar(lista_original, num)

    elif opc == 2:
        num = int(input("Digite quantos valores deseja na lista: "))
        aleatorio(lista_original, num)

    elif opc == 3:
        print(lista_original)

    elif opc == 4:
        cronometro(selection_sort(lista_original.copy()))

    elif opc == 5:
        cronometro(bubble_sort(lista_original.copy()))

    elif opc == 6:
        cronometro(insertion_sort, lista_original)
        
    elif opc == 7:
        cronometro(merge_sort, lista_original)
        
    elif opc == 8:
        cronometro(quick_sort, lista_original)

    elif opc == 9:
        lista_original.clear()

    else:
        print("Escolha uma opção válida")