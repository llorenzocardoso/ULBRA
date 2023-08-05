#include <stdio.h>

int main(){
    
    int vetor[10], iguais = 0, i, j;

    for (int i = 0; i < 10; i++)
    {     
        do{       
            printf("Digite numeros DIFERENTES: \n");
            scanf("%d%*c", &vetor[i]);
            for(j = 0; j < i; j++){
                if(vetor[j] == vetor[i]){
                    iguais = 1;
                    printf("Valor duplicado. Digite outro!\n");
                    break;
                }else{
                    iguais = 0;
                }
            }
        }while(iguais == 1);
    } 
    printf("[");
    for(i = 0; i < 10; i++){
        printf(" %i ", vetor[i]);
    }
    printf("]");
}