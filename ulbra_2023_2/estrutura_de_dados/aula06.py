import os
import time

fila = []

def enfileirar(fila, valor):
    fila.append(valor)

def desenfileirar(fila):
    if not fila:
        print("A Fila está vazia!")
    else:
        fila.pop(0)

def exibir_primeiro(fila):
    if not fila:
        print("A fila está vazia!")
    else:
        print(f"Primeiro elemento: {fila[0]}")

def exibir_fila(fila):
    if not fila:
        print("A fila está vazia!")
    else:
        for i in fila:
            print(i)

def menu():
    print("""
    _______ _________ _        _______ 
    (  ____ \\__   __/( \      (  ___  )
    | (    \/   ) (   | |      | (   ) |
    | (__       | |   | |      | (___) |
    |  __)      | |   | |      |  ___  |
    | (         | |   | |      | (   ) |
    | )      ___) (___| (____/\| )   ( |
    |/       \_______/(_______/|/     \|
                                    
    """)
    print("""MENU:
    1 - ENFILEIRAR
    2 - DESENFILEIRAR
    3 - EXIBIR PRIMEIRO
    4 - EXIBIR FILA
    0 - SAIR
    """)

def limpa_tela():
    time.sleep(1.5)
    sistema = os.name
    if sistema == "nt":
        os.system("cls")
    else:
        os.system("clear")

while True:
    limpa_tela()
    menu()   
    try:
        opc = int(input("Digite uma opção: "))
    except ValueError:
        print("Opção inválida. Digite um número válido.")
        continue

    if opc == 1:
        entrada = input("Digite os valores para enfileirar (separados por vírgula): ")
        valores_separados = entrada.split(",")
    
        for valor_str in valores_separados:
            enfileirar(fila, valor_str)

    elif opc == 2:
        desenfileirar(fila)
        pass
    elif opc == 3:
        exibir_primeiro(fila)
    elif opc == 4:
        exibir_fila(fila)
    elif opc == 0:
        break