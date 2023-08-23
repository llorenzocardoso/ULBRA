import random

def adicionar_lista(valor):
    entrada = valor.split(",")
    for item in entrada:
        lista.append(int(item))
        
def lista_aleatoria(quantidade):
    for _ in range(quantidade):
        numero_aleatorio = random.randint(1,1000)
        lista.append(numero_aleatorio)
    
lista = []

while True:
    print("""MENU
1 - ADICIONAR NA LISTA
2 - CRIAR LISTA ALEATORIA
9 - IMPRIME LISTA
10 - LIMPA A LISTA
0 - SAIR""")
    
    opc = int(input("Opcao desejada: "))
    
    if opc == 0:
        break
    elif opc == 1:
        valor = input("Digite um valor: ")
        entrada = adicionar_lista(valor)
    elif opc == 2:
        quantidade = int(input("Digite a quantidade de parametros da lista: "))
        lista_aleatoria(quantidade)
    elif opc == 9:
        print(f"Lista: {lista}")
    elif opc == 10:
        print("Lista deletada!")
        lista.clear()
    else:
        print("Escolha uma opcao valida!!")