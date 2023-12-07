class Fila:
    def __init__(self):
        self.itens = []

    def vazia(self):
        return len(self.itens) == 0

    def tamanho(self):
        return len(self.itens)

    def enfileirar(self, item):
        self.itens.append(item)

    def desenfileirar(self):
        if not self.vazia():
            return self.itens.pop(0)
        else:
            return None

    def proximo(self):
        if not self.vazia():
            return self.itens[0]
        else:
            return None

# Função para exibir o menu
def exibir_menu():
    print("\nMenu:")
    print("1. Adicionar nome à fila")
    print("2. Remover próximo da fila")
    print("3. Chamar próximo a ser atendido")
    print("4. Sair")

# Exemplo de uso com um menu interativo
minha_fila = Fila()

while True:
    exibir_menu()
    opcao = input("Escolha uma opção: ")

    if opcao == "1":
        nome = input("Digite o nome a ser adicionado à fila: ")
        minha_fila.enfileirar(nome)
        print(f"{nome} foi adicionado à fila.")

    elif opcao == "2":
        nome_removido = minha_fila.desenfileirar()
        if nome_removido:
            print(f"{nome_removido} foi removido da fila.")
        else:
            print("A fila está vazia.")

    elif opcao == "3":
        proximo_nome = minha_fila.proximo()
        if proximo_nome:
            print(f"Próximo a ser atendido: {proximo_nome}")
        else:
            print("A fila está vazia.")

    elif opcao == "4":
        print("Saindo do programa.")
        break

    else:
        print("Opção inválida. Tente novamente.")
