#include <stdio.h>

int main(){

    float vetorReais[5];
    int cod;

    for(int i = 0; i < 5; i++){
        printf("Digite um valor para o vetor: ");
        scanf("%f%*c", &vetorReais[i]);
    }
    do{
        printf("Escolha uma opcao:\n");
        printf("0 - Encerra o programa");
        printf("1 - Mostrar na ordem direta\n");
        printf("2 - Mostrar na ordem inversa\n");
        scanf("%i%*c", &cod);

        switch (cod){
            
        case 1:
            printf("Ordem direta\n");
            printf("[");
            for(int i = 0; i < 5; i++){
                printf("%.2f ", vetorReais[i]);
            }
            printf("]\n");
            break;

        case 2:
            printf("Ordem inversa\n");
            printf("[");
            for(int i = 4; i >= 0; i--){
                printf("%.2f ", vetorReais[i]);
            }
            printf("]\n");
            break;

        case 0:
            break;

        default:
            printf("Codigo invalido\n");
            break;
        }

    }while(cod != 0);
    

    return 0;
}