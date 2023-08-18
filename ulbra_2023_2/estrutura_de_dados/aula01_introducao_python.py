lista = []

while True:
    print("""1 - INSERIR UM NOVO NUMERO
2 - INSERIR UM NUMERO NO INICIO DA LISTA
3 - DELETAR O PRIMEIRO NUMERO
4 - DELETAR O ULTIMO NUMERO
5 - IMPRIMIR A LISTA
6 - DELETAR O NÚMERO PELA POSICAO DA LISTA
0 - SAIR""")
    
    opc = int(input("Digite a opcao desejada: "))
    if opc == 0:
        break
    if opc == 1:
        num = int(input("Digite um numero para inserir na lista: "))
        lista.append(num)
    elif opc == 2:
        num = int(input("Digite o numero para inserir no inicio da lista: "))
        lista.insert(0, num)
    elif opc == 3:
        lista.pop(0)
        print("Primeiro numero removido.") 
    elif opc == 4:
        lista.pop()
        print("Ultimo numero removido.")
    elif opc == 5:
        print((f"Os numeros da lista sao: {lista}"))
    elif opc == 6:
        pos = int(input("Lembrando que a lista começa na posicao 0, digite a posicao da lista a ser removida: "))
        if 0 <= pos < len(lista):
            num_removido = lista.pop(pos)
            print(f"O numero {num_removido} foi removido da posicao {pos} da lista")
        else: print("Posicao invalida. A lista nao foi alterada!")
    else: 
        print("Opcao invalida!!!!!")