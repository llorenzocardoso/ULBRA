#include <stdio.h>
#include <string.h>

int main(){

    int len;
    char palavraTemp[1][20];

    printf("Digite uma palavra: ");
    scanf("%s%*c", &palavraTemp[0]);

    len = strlen(palavraTemp[0]);

    char *palavra = palavraTemp[0];

    for(int i = 0; i < len; i++){
        if(palavra[i] == 97 || palavra[i] == 101 || palavra[i] == 105 || palavra[i] == 111 || palavra[i] == 117){
            printf("Vogal = %c\n", palavra[i]);
        }
    }
    printf("Tamanho da palavra: %i\n", len);

    return 0;
}