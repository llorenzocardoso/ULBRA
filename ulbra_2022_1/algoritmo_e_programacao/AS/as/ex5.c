#include <stdio.h>

int main(){

    int A[10], B[10], C[10];
    int num;

    for(int i = 0; i < 10; i++){
        printf("Digite um valor para o vetor A: ");
        scanf("%i%*c", &A[i]);
    }
    for(int i = 0; i < 10; i++){
        printf("Digite um valor para o vetor B: ");
        scanf("%i%*c", &B[i]);
    }
    for(int i = 0; i < 10; i++){
        num = A[i] - B[i];
        C[i] = num;

        printf("%i - %i = %i\n", A[i], B[i], C[i]);
    }
    printf("Vetor C = [");
    for(int i = 0; i < 10; i++){
        printf(" %i ", C[i]);
    }
    printf("]");

    return 0;
}