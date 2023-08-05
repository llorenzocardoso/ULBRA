lista = []

while True:
    print("""1 - INSERIR UM NOVO NUMERO
2 - INSERIR UM NÚMERO NO INÍCIO DA LISTA
3 - DELETAR O PRIMEIRO NUMERO
4 - DELETAR O ULTIMO NUMERO
5 - IMPRIMIR A LISTA
6 - DELETAR O NÚMERO PELA POSIÇÃO DA LISTA
0 - SAIR""")
    
    opc = int(input("Digite a opção desejada: "))
    if opc == 0:
        break
    if opc == 1:
        num = int(input("Digite um número para inserir na lista: "))
        lista.append(num)
    elif opc == 2:
        num = int(input("Digite o número para inserir no início da lista: "))
        lista.insert(0, num)
    elif opc == 3:
        lista.pop(0)
        print("Primeiro número removido.") 
    elif opc == 4:
        lista.pop()
        print("Último número removido.")
    elif opc == 5:
        print((f"Os números da lista são: {lista}"))
    elif opc == 6:
        pos = int(input("Lembrando que a lista começa na posição 0, digite a posição da lista a ser removida: "))
        if 0 <= pos < len(lista):
            num_removido = lista.pop(pos)
            print(f"O número {num_removido} foi removido da posição {pos} da lista")
        else: print("Posição inválida. A lista não foi alterada!")
    else: 
        print("Opção inválida!!!!!")