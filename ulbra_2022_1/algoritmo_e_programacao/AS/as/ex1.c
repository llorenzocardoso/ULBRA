#include<stdio.h>

int main()
{
    int num, i, menor = 0, iguais;
    int vet [10];

    for ( i = 0; i < 10; i++){
        printf("Digite um numero: \n");
        scanf("%d%*c", &vet[i]);
    }
    printf("Digite um valor para usar de referencia: \n");
    scanf("%d%*c", &num);

    for(i = 0; i < 10; i++){
        if(vet[i] > num){
            printf("%i e maior que %i\n", vet[i], num);
        }
        else if(vet[i] < num){
            menor++;
        }else{
            iguais++;
        }
    }
    printf("%i numeros sao menores que %i\n", menor, num); 
    printf("O numero %d aparece %d vezes", num, iguais);     
}