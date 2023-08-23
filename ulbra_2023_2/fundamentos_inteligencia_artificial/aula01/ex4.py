import math

def limite_rapido(x):
    if x > 0:
        return 1
    else:
        return -1
    
def funcao_rampa(x):
    if x < 0:
        return 0
    elif x >= 0 and x <= 1:
        return x
    else:
        return 1
    
def funcao_sigmoide(x):
    if x >= 0:
        return 1 -1 / (1 + math.exp(x))
    else:
        return -1 + 1 / (1 - math.exp(x))
    
def main():
    num_entradas = int(input("Digite o número de entradas: "))
    entradas = [float(input(f"Digite a entrada {i + 1}: ")) for i in range(num_entradas)]
    
    pesos1 = [float(input(f"Digite o peso {i + 1} para o primeiro neurônio: ")) for i in range(num_entradas)]
    pesos2 = [float(input(f"Digite o peso {i + 1} para o segundo neurônio: ")) for i in range(num_entradas)]
    
    opc = int(input("""
MENU:
1 - Limite rapido
2 - Funcao rampa
3 - Funcao Sigmoide
Digite a funcao desejada: """))
    
    if opc == 1:
        saida_neuronio1 = limite_rapido(sum(entrada * peso for entrada, peso in zip(entradas, pesos1)))
        resultado = limite_rapido(saida_neuronio1 * sum(entrada * peso for entrada, peso in zip(entradas, pesos2)))
    elif opc == 2:
        saida_neuronio1 = funcao_rampa(sum(entrada * peso for entrada, peso in zip(entradas, pesos1)))
        resultado = funcao_rampa(saida_neuronio1 * sum(entrada * peso for entrada, peso in zip(entradas, pesos2)))
    elif opc == 3:
        saida_neuronio1 = funcao_sigmoide(sum(entrada * peso for entrada, peso in zip(entradas, pesos1)))
        resultado = funcao_sigmoide(saida_neuronio1 * sum(entrada * peso for entrada, peso in zip(entradas, pesos2)))
    else:
        print("Escolha de função inválida.")
        return
    
    print("Saída final:", resultado)

if __name__ == "__main__":
    main()