#include <stdio.h>
#include <math.h>

int main(int argc, char const *argv[])
{
    int numero;
    printf("Digite o numero\n");
    scanf("%d%*c", &numero);

    if (numero%2==0){
        printf("Numero par %d", numero);
    }else{
        printf("Numero impar %d", numero);
    }
    


    return 0;
}
