def f(v, n):
    if n == 0:
        return 0
    else:
        s = f(v, n-1)
        if v[n-1] > 0:
            s = s + v[n-1]
        return s

# Parâmetros de entrada
v = [2, -4, 7, 0, -1, 4]
n = 6

# Chamada da função e impressão do resultado
resultado = f(v, n)
print(f"O resultado da função f() é: {resultado}")