#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(){

    srand(time(NULL));
    
    int vetor[99];
    int i = 0;
    int randomNumber = 0;
    int escolha = 0;
    int maior = 0;

    printf("Adicionando numeros aleatorios ao vetor (0 - 1000)\n");

    do{
        randomNumber = rand() % 1000;
        if(randomNumber == 999){
            printf("%i Detectato encerrando programa\n", randomNumber);
            break;
        }else{
            vetor[i] = randomNumber;
            if(maior < vetor[i]){
                maior = vetor[i];
            }
        }
        i++;
    }while(i < 100);

    do{
        printf("1 - Mostrar os valores do vetor\n");
        printf("2 - Imprimir o vetor na ordem inversa\n");
        printf("3 - Exibir o maior numero\n");
        printf("4 - Exibir quantos numeros foram sorteados\n");
        printf("5 - Encerrar o programa\n");
        scanf("%i%*c", &escolha);

        switch(escolha)
        {
        case 1:
            printf("Mostrando os valores do vetor\n");
            for(int j = 0; j < i; j++){
                printf("Vetor[%i] = %i\n", j, vetor[j]);
            }
            break;
        
        case 2:
            for(int j = i-1; j >= 0; j--){
                printf("Vetor[%i] = %i\n", j, vetor[j]);
            }
            break;

        case 3:
            printf("Maior numero = %i\n", maior);
            break;
        case 4:
            printf("Quantidade de numeros sorteados = %i\n", i);
            break;
        case 5:
            break;
        default:
            printf("Opcao invalida\n");
            break;
        }

    }while(escolha != 5);
    
    return 0;
}