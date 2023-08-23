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
    entrada1 = float(input("Digite a primeira entrada: "))
    entrada2 = float(input("Digite a segunda entrada: "))
    peso1 = float(input("Digite o peso 1: "))
    peso2 = float(input("Digite o peso 2: "))
    
    opc = int(input("""
MENU:
1 - Limite rapido
2 - Funcao rampa
3 - Funcao Sigmoide
Digite a funcao desejada: """))
    
    if opc == 1:
        resultado = limite_rapido(entrada1 * peso1 + entrada2 * peso2)
    elif opc == 2:
        resultado = funcao_rampa(entrada1 * peso1 + entrada2 * peso2)
    elif opc == 3:
        resultado = funcao_sigmoide(entrada1 * peso1 + entrada2 * peso2)
    else:
        print("Escolha de função inválida.")
        return
    
    print("Saída calculada:", resultado)

if __name__ == "__main__":
    main()