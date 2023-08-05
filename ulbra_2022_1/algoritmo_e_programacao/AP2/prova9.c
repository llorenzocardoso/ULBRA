#include <stdio.h>
#include <math.h>

int main()
{
    float not1,not2,med;
    printf("Insira as duas notas: \n");
    scanf("%f%*c", not1);
    scanf("%f%*c", not2);
    med=(not1+not2)/2;
    printf("Sua nota é %.2f, você ", med);
    if (med>7)
    {
        printf("foi aprovado(a)");
    }else if (med>=4 && med<7)
    {
        printf("está de exame");
    }else{
        printf("foi reprovado (a)");
    }
    
    

    return 0;
}
