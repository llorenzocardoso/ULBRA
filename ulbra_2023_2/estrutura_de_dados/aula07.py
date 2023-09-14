lista = []

def menu():
    print("""MENU:
1- ADICIONAR ITEM NA LISTA
2- EXIBIR LISTA
3- EXCLUIR ITEM POR ID  
0- SAIR""")

def adicionar(lista, valor):
    lista.append(valor)
    print(f"Valor {valor} adicionado à lista.")

def print_lista(lista):
    if not lista:
        print("A lista está vazia.")
    else:
        print("LISTA DE COMPRAS:")
        for i in lista:
            print(i)

def excluir_item(lista, id):
    for item in lista:
        if item [0] == id:
            lista.remove(item)

if __name__ == "__main__":

    while True:
        menu()   
        try:
            opc = int(input("Digite uma opção: "))
        except ValueError:
            print("Opção inválida. Digite um número válido.")
            continue

        if opc == 1:
            item = input("Digite um item para adicionar na lista: ")
            quantidade = input("Digite a quantidade para colocar na lista: ")
            if not lista:
                id = 1
            else:
                id = lista[-1][0] + 1
                
            valor = [id,item, quantidade]
            adicionar(lista, valor)
                
        elif opc == 2:
            print_lista(lista)
        elif opc == 3:
            id_remove = int(input("Digite o ID para excluir: "))
            excluir_item(lista, id_remove)
        elif opc == 0:
            break
        else:
            print("Escolha uma opção do MENU!")