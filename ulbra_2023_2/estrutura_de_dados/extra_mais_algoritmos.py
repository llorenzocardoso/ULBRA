# 1 - lista os numeros validos
# numeros_validos = []

# print("Digite uma lista de numeros separados por espaco: ")
# entrada = input().split()

# for i in entrada:
#     try:
#         numero = int(i)
#         numeros_validos.append(numero)
#     except ValueError:
#         print(f"Valor ({i}) invalido! Digite um numero inteiro valido!!")

# soma = 0
# for i in numeros_validos:
#     soma += i
    
# print("Numeros validos: ", numeros_validos)
# print("Soma: ", soma)

# 2 - lista os numeros validos
# numeros_validos = []

# print("Digite uma lista de numeros separados por espaco: ")
# entrada = input().split()

# def somas_pares(lista):
#     soma = 0
#     for i in lista:
#         if i % 2 == 0:
#             soma += i
#     return soma

# for i in entrada:
#     try:
#         numero = int(i)
#         numeros_validos.append(numero)
#     except ValueError:
#         print(f"Valor ({i}) invalido! Digite um numero inteiro valido!!")

    
# print("Numeros validos: ", numeros_validos)
# print("Soma: ", somas_pares(numeros_validos))

# 2 - Escreva um algoritmo que calcule o IMC de uma pessoa, ele deverá receber o peso (em quilogramas) e a altura (em metros) e retornar o seu índice de massa corporal (IMC). Utilize a fórmula imc = peso / altura2. O algoritmo deverá usar duas funções uma para calcular outra para classificar o imc Imprima no terminal as duas saídas, valor do imc e classificação.

# def calcular_imc(peso, altura):
#     imc = peso/(altura ** 2)
#     return imc
    
# def classificar_imc(imc):
#     if imc <= 18.5:
#         return "Abaixo do peso!"
#     elif imc > 18.5 and imc <= 24.9:
#         return "Peso normal!"
#     elif imc >= 25.0 and imc <= 29.9:
#         return "Acima do peso (sobrepeso)"
#     elif imc >= 30.0 and imc <= 34.9:
#         return "Obesidade I"
#     elif imc >= 35.0 and imc <= 39.9:
#         return "Obesidade II"
#     else:
#         return "Obesidade III"
            
# peso = float(input("Digite seu peso: "))
# altura = float(input("Digite sua altura: "))

# imc_calculado = calcular_imc(peso, altura)
# classificacao = classificar_imc(imc_calculado)

# print("IMC calculado: ", imc_calculado)
# print("Seu resultado: ", classificacao)