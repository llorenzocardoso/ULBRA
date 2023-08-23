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
    const entrada1 = parseFloat(prompt("Digite a primeira entrada: "));
    const entrada2 = parseFloat(prompt("Digite a segunda entrada: "));
    const peso1 = parseFloat(prompt("Digite o peso 1: "));
    const peso2 = parseFloat(prompt("Digite o peso 2: "));
    
    const opc = parseInt(prompt(`
MENU:
1 - Limite rápido
2 - Função rampa
3 - Função Sigmoide
Digite a função desejada: `));
    
    let resultado;
    if (opc === 1) {
        resultado = limite_rapido(entrada1 * peso1 + entrada2 * peso2);
    } else if (opc === 2) {
        resultado = funcao_rampa(entrada1 * peso1 + entrada2 * peso2);
    } else if (opc === 3) {
        resultado = funcao_sigmoide(entrada1 * peso1 + entrada2 * peso2);
    } else {
        console.log("Escolha de função inválida.");
        return;
    }
    
    console.log("Saída calculada:", resultado);
}

main();
