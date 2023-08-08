# 1 Faça um programa que receba quatro números inteiros, calcule e mostre a soma desses números.
# n1 = int(input("Digite um número: "))
# n2 = int(input("Digite um número: "))
# n3 = int(input("Digite um número: "))
# n4 = int(input("Digite um número: "))
# soma = n1 + n2 + n3 + n4
# print(f"O resultado de {n1} + {n2} + {n3} + {n4} é: {soma}")

# 2 Faça um programa que receba três notas, calcule e mostre a média aritmética.
# n1 = float(input("Digite a primeira nota: "))
# n2 = float(input("Digite a segunda nota: "))
# n3 = float(input("Digite a terceira nota: "))
# media  = (n1 + n2 +n3)/3
# print(f"A média aritmética é: {media}")

# 3 Faça um programa que receba três notas e seus respectivos pesos, calcule e mostre a média ponderada.
# n1 = float(input("Digite sua nota: "))
# n2 = float(input("Digite sua nota: "))
# n3 = float(input("Digite sua nota: "))
# p1 = 10
# p2 = 10
# p3 = 10
# media = (n1*p1 + n2*p2 + n3*p3)/(p1 + p2 + p3)
# print(f"A média ponderada é: {media}")

# 4 Faça um programa que receba o salário de um funcionário, calcule e mostre o novo salário, sabendo-se que este sofreu um aumento de 25%.
# salario_antigo = int(input("Digite seu salário: "))
# salario_novo = salario_antigo * 0.25
# print (f"Seu novo salário é de: {salario_antigo + salario_novo}")

# 5 Faça um programa que receba o salário de um funcionário e o percentual de aumento, calcule e mostre o valor do aumento e o novo salário.
# salario = int(input("Digite seu salário: "))
# perc = int(input("Digite o percentual de aumento: "))
# aumento  = salario * perc/100
# salario_novo = salario + aumento
# print(f"O seu salário teve um aumento de {perc}% ({aumento} reais) e seu novo salário agora é de: {salario_novo}")

# 6 Faça um programa que receba o salário base de um funcionário, calcule e mostre o salário a receber, sabendo-se que o funcionário tem gratificação de 5% sobre o salário base e paga imposto de 7% também sobre o salário base.
# salario_base = int(input("Digite seu salário: "))
# imposto = salario_base * 7/100
# grat = salario_base * 5/100
# salario_receber = salario_base + grat - imposto
# print(f"Você tem ${salario_receber} para receber!")

# 7 Faça um programa que receba o salário base de um funcionário, calcule e mostre seu salário a receber, sabendo-se que o funcionário tem gratificação de R$ 50 e paga imposto de 10% sobre o salário base.
# salario_base = int(input("Digite seu salário: "))
# grat = 50
# imposto = salario_base * 10/100
# salario_receber = salario_base + grat - imposto
# print(f"Você tem ${salario_receber} para receber!")

# 8 Faça um programa que receba o valor de um depósito e o valor da taxa de juros, calcule e mostre o valor do rendimento e o valor total depois do rendimento.
# valor_deposito = int(input("Digite o valor do seu depósito: "))
# valor_juros = int(input("Digite o valor da taxa de juros: "))
# valor_rendimento = valor_deposito * valor_juros/100
# valor_total = valor_deposito + valor_rendimento
# print(f"Você teve {valor_rendimento} de rendimento e {valor_total} como valor no total!")

# 9 Faça um programa que calcule e mostre a área de um triângulo. Sabe-se que: Área = (base * altura)/2.
# base = int(input("Digite a base do triangulo: "))
# altura = int(input("Digite a altura do triangulo: "))
# area = (base * altura)/2
# print(f"O triangulo de base {base} e altura {altura}, tem a área de: {area}")

# 10 Faça um programa que calcule e mostre a área de um círculo. Sabe-se que: Área = p * R2
# raio = float(input("Digite o raio do círculo: "))
# pi = 3.14
# area = pi * (raio * raio)
# print(f"A área do circulo de raio {raio} é: {area}")