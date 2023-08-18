# 1 - Faça um algoritmo que receba em uma lista uma sequência de números separados por “vírgula” e após a sua digitação imprima no terminal a soma de todos os números pares presentes na lista. Utilize uma função para realizar a soma dos números (soma_pares()).
# lista os numeros validos
# numeros_validos = []

# print("Digite uma lista de numeros separados por espaco: ")
# entrada = input().split(",")

# def somas_pares(lista):
#     soma = 0
#     for i in lista:
#         if i % 2 == 0:
#             soma += i
#     return soma

# def soma_geral(lista):
#     soma = 0
#     for i in lista:
#         soma += i
#     return soma

# for i in entrada:
#     try:
#         numero = int(i)
#         numeros_validos.append(numero)
#     except ValueError:
#         print(f"Valor ({i}) invalido! Digite um numero inteiro valido!!")

    
# print("Numeros validos: ", numeros_validos)
# print("Soma: ", soma_geral(numeros_validos))
# print("Soma dos pares: ", somas_pares(numeros_validos))

# 2 - Escreva um algoritmo que calcule o IMC de uma pessoa, ele deverá receber o peso (em quilogramas) e a altura (em metros) e retornar o seu índice de massa corporal (IMC). Utilize a fórmula imc = peso / altura2. O algoritmo deverá usar duas funções uma para calcular outra para classificar o imc Imprima no terminal as duas saídas, valor do imc e classificação.

# def verifica(mensagem):
#     while True:
#         try:
#             valor = float(input(mensagem))
#             return valor
#         except ValueError:
#             print("Entrada invalida. Digite o valor em numero!")

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

# 3 - Escreva um algoritmo que receba uma lista de números utilizando um separador de sua escolha e retorne o valor máximo e mínimo da lista. Utilize uma função para a tarefa de verificar os números.

# def encontrar_maximo_minimo(lista):
#     numeros = lista.split()
#     numeros = [float(num) for num in numeros]

#     maximo = max(numeros)
#     minimo = min(numeros)

#     return maximo, minimo

# entrada = input("Digite a lista de numeros separados por espaco: ")

# maximo, minimo = encontrar_maximo_minimo(entrada, )
# print("Valor máximo:", maximo)
# print("Valor mínimo:", minimo)

# 4 - Escreva uma função chamada conta_vogais que recebe uma string e retorna o número de vogais (a, e, i, o, u) presentes na string.

# def conta_vogais(texto):
#     vogais = "aeiouAEIOU"
#     contador = 0
   
#     for letra in texto:
#         if letra in vogais:
#             contador += 1
           
#     return contador

# texto = input("Digite uma string: ")
# resultado = conta_vogais(texto)
# print("Numero de vogais:", resultado)