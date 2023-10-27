deque = []

def add_inicio(item):
    deque.insert(0, item)

def add_final(item):
    deque.append(item)

def exibir_primeiro():
    if not deque:
        return "O deque está vazio."
    else:
        return deque[0]

def exibir_ultimo():
    if not deque:
        return "O deque está vazio."
    else:
        return deque[-1]

def remover_primeiro():
    if not deque:
        return "O deque está vazio."
    else:
        return deque.pop(0)

def remover_ultimo():
    if not deque:
        return "O deque está vazio."
    else:
        return deque.pop()

def exibir_tudo():
    if not deque:
        return "O deque está vazio."
    else:
        print(deque)

while True:
    print("\nMENU:")
    print("1- Adicionar no início")
    print("2- Adicionar no final")
    print("3- Exibir primeiro")
    print("4- Exibir ultimo")
    print("5- Remover primeiro")
    print("6- Remover ultimo")
    print("7- Exibir lista completa")
    print("0- Sair")

    escolha = input("Escolha uma opção: ")

    if escolha == "1":
        item = input("Digite o item para adicionar no início: ")
        add_inicio(item)
    elif escolha == "2":
        item = input("Digite o item para adicionar no final: ")
        add_final(item)
    elif escolha == "3":
        print("Primeiro item:", exibir_primeiro())
    elif escolha == "4":
        print("Último item:", exibir_ultimo())
    elif escolha == "5":
        removed_item = remover_primeiro()
        print("Item removido do início:", removed_item)
    elif escolha == "6":
        removed_item = remover_ultimo()
        print("Item removido do final:", removed_item)
    elif escolha == "7":
        exibir_tudo()
    elif escolha == "0":
        break
    else:
        print("Opção inválida. Tente novamente.")