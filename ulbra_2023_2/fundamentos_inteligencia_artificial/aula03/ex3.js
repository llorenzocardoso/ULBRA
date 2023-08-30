function limite_rapido(x) {
    if (x > 0) {
        return 1;
    } else {
        return -1;
    }
}

function funcao_rampa(x) {
    if (x < 0) {
        return 0;
    } else if (x >= 0 && x <= 1) {
        return x;
    } else {
        return 1;
    }
}

function funcao_sigmoide(x) {
    if (x >= 0) {
        return 1 - 1 / (1 + Math.exp(x));
    } else {
        return -1 + 1 / (1 - Math.exp(x));
    }
}

function main() {
    const entrada = parseFloat(prompt("Digite a primeira entrada: "));
    const peso1 = parseFloat(prompt("Digite o peso 1 para o primeiro neurônio: "));
    const peso2 = parseFloat(prompt("Digite o peso 2 para o segundo neurônio: "));
    
    const opc = parseInt(prompt(`
MENU:
1 - Limite rápido
2 - Função rampa
3 - Função Sigmoide
Digite a função desejada: `));
    
    let saida_neuronio1, resultado;
    if (opc === 1) {
        saida_neuronio1 = limite_rapido(entrada * peso1);
        resultado = limite_rapido(saida_neuronio1 * peso2);
    } else if (opc === 2) {
        saida_neuronio1 = funcao_rampa(entrada * peso1);
        resultado = funcao_rampa(saida_neuronio1 * peso2);
    } else if (opc === 3) {
        saida_neuronio1 = funcao_sigmoide(entrada * peso1);
        resultado = funcao_sigmoide(saida_neuronio1 * peso2);
    } else {
        console.log("Escolha de função inválida.");
        return;
    }
    
    console.log("Saída calculada:", resultado);
}

main();
