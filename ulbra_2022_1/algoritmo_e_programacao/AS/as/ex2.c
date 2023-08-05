#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(){

    int vetor[10];
    int findNumber, containsNumber, pos;

    srand(time(NULL)); 

    printf("[");
    for(int i = 0; i < 10; i++){

        int randomValue = rand() % 100;
        vetor[i] = randomValue;
        printf(" %i ", vetor[i]);
    }
    printf("]");
    printf("\nDigite um numero inteiro para descobrir se ele se encontra dentro do vetor:\n");
    scanf("%i%*c", &findNumber);

    for(int i = 0; i < 10; i++){
        if(vetor[i] == findNumber){
            containsNumber = 1;
            pos = i;
            break;
        }else{
            containsNumber = 0;
        }
    }
    
    if(containsNumber == 1){
        printf("Numero %i encontrado na posicao %i | vetor[%i] = %i", findNumber, pos, pos, vetor[pos]);
    }else{
        printf("O numero %i nao se encontra dentro do vetor", findNumber);
    }
    return 0;
}