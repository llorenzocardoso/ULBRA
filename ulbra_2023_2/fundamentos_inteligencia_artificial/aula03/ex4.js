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
    const num_entradas = parseInt(prompt("Digite o número de entradas: "));
    
    const entradas = [];
    for (let i = 0; i < num_entradas; i++) {
        entradas.push(parseFloat(prompt(`Digite a entrada ${i + 1}: `)));
    }
    
    const pesos1 = [];
    for (let i = 0; i < num_entradas; i++) {
        pesos1.push(parseFloat(prompt(`Digite o peso ${i + 1} para o primeiro neurônio: `)));
    }
    
    const pesos2 = [];
    for (let i = 0; i < num_entradas; i++) {
        pesos2.push(parseFloat(prompt(`Digite o peso ${i + 1} para o segundo neurônio: `)));
    }
    
    const opc = parseInt(prompt(`
MENU:
1 - Limite rápido
2 - Função rampa
3 - Função Sigmoide
Digite a função desejada: `));
    
    let saida_neuronio1, resultado;
    if (opc === 1) {
        saida_neuronio1 = limite_rapido(entradas.map((entrada, index) => entrada * pesos1[index]).reduce((acc, val) => acc + val, 0));
        resultado = limite_rapido(saida_neuronio1 * entradas.map((entrada, index) => entrada * pesos2[index]).reduce((acc, val) => acc + val, 0));
    } else if (opc === 2) {
        saida_neuronio1 = funcao_rampa(entradas.map((entrada, index) => entrada * pesos1[index]).reduce((acc, val) => acc + val, 0));
        resultado = funcao_rampa(saida_neuronio1 * entradas.map((entrada, index) => entrada * pesos2[index]).reduce((acc, val) => acc + val, 0));
    } else if (opc === 3) {
        saida_neuronio1 = funcao_sigmoide(entradas.map((entrada, index) => entrada * pesos1[index]).reduce((acc, val) => acc + val, 0));
        resultado = funcao_sigmoide(saida_neuronio1 * entradas.map((entrada, index) => entrada * pesos2[index]).reduce((acc, val) => acc + val, 0));
    } else {
        console.log("Escolha de função inválida.");
        return;
    }
    
    console.log("Saída final:", resultado);
}

main();
