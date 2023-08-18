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

# 3- Escreva um algoritmo que receba uma lista de números utilizando um separador de sua escolha e retorne o valor máximo e mínimo da lista. Utilize uma função para a tarefa de verificar os números.

# def encontrar_maximo_minimo(lista):
#     numeros = lista.split()
#     numeros = [float(num) for num in numeros]

#     maximo = max(numeros)
#     minimo = min(numeros)

#     return maximo, minimo

# entrada = input("Digite a lista de números separados pelo caractere desejado: ")

# maximo, minimo = encontrar_maximo_minimo(entrada, )
# print("Valor máximo:", maximo)
# print("Valor mínimo:", minimo)

# 4-Escreva uma função chamada conta_vogais que recebe uma string e retorna o número de vogais (a, e, i, o, u) presentes na string.

# def conta_vogais(texto):
#     vogais = "aeiouAEIOU"  # Incluindo vogais maiúsculas e minúsculas
#     contador = 0
   
#     for letra in texto:
#         if letra in vogais:
#             contador += 1
           
#     return contador

# texto = input("Digite uma string: ")
# resultado = conta_vogais(texto)
# print("Número de vogais:", resultado)