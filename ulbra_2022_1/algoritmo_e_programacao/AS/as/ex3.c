#include<stdio.h>

int main()
{
    int array[10], i, igual;

    for ( int i = 0; i < 10; i++){
        printf("Digite um numero: \n");
        scanf("%d%*c", &array[i]);
    }
    
    for ( i = 0; i < 10; i++){
        igual = 0;
        for(int j = 0; j < 10; j++){
            if(array[i] == array[j]){
                igual++;
            }
        }
        if(igual > 1){
            printf("Numeros iguais: %i\n", array[i]);
        }

    }

}   