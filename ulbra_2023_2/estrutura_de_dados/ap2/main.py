caminhoneiros = []
total = 0

def inicializa():
    global total
    total = 0

def estaVazia():
    return total == 0

def estaCheia():
    return total >= 10

def enfileirar(caminhoneiro):
    global total
    if not estaCheia():
        total += 1
        caminhoneiros.append(caminhoneiro)
    else:
        print("a fila ta cheia")

def desenfileirar():
    if not estaVazia():
        print(f"{caminhoneiros[0]} removido!")
        caminhoneiros.pop(0)
    else:
        print("sem caminhoneiros na fila")

def mostrar_fila():
    print(caminhoneiros)

# Exemplo de uso
inicializa()
enfileirar("Caminhão 1")
enfileirar("Caminhão 2")
mostrar_fila()  # Mostra a fila atual
desenfileirar()  # Remove o primeiro caminhoneiro da fila
mostrar_fila()  # Mostra a fila atualizada