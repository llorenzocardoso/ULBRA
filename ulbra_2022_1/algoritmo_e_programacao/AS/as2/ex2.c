#include <stdio.h>

int main(){

    float notaPrimeiraProva[10], notaSegundaProva[10], mediaNota[10];
    float media, notaInformada;
    int op = 0, i = 0, adicionarAlunos = 0, numeroAlunos = 0, posicaoAluno;
    char alunos[10][20];

    do{
        printf("Nota da primeira prova: ");
        scanf("%f%*c", &notaPrimeiraProva[numeroAlunos]);
        printf("Nota da segunda prova: ");
        scanf("%f%*c", &notaSegundaProva[numeroAlunos]);
        printf("Nome do aluno: ");
        scanf("%s%*c", &alunos[numeroAlunos]);

        media = (notaPrimeiraProva[numeroAlunos] + notaSegundaProva[numeroAlunos]) / 2;
        
        mediaNota[numeroAlunos] = media;

        do{
            printf("Deseja adicionar mais algum aluno?\n");
            printf("1 - Sim\n");
            printf("2 - Nao\n");
            scanf("%i%*c", &adicionarAlunos);
        }while (adicionarAlunos != 1 && adicionarAlunos != 2);

        
        numeroAlunos++;
    }while (adicionarAlunos == 1 && numeroAlunos < 10);


    do{
        printf("1 - Listar todos os alunos aprovados\n");
        printf("2 - Listar todos os alunos reprovados\n");
        printf("3 - Listar todos os alunos com nota maior que uma nota informada pelo usuário.\n");
        printf("4 - Informar uma posicao e o programa exibir os dados e notas do aluno.\n");
        printf("5 - Encerrar o programa.\n");
        scanf("%i%*c", &op);
        switch (op){
            case 1:
                printf("Alunos aprovados:\n");
                for(i = 0; i < numeroAlunos; i++){
                    if(mediaNota[i] >= 7){
                        printf("%s aprovado | Media = %.2f\n", alunos[i], mediaNota[i]);
                    }
                }
                break;

            case 2:
                printf("Alunos reprovados:\n");
                for(i = 0; i < numeroAlunos; i++){
                    if(mediaNota[i] < 7){
                        printf("%s reprovado | Media = %.2f\n", alunos[i], mediaNota[i]);
                    }
                }
                break;

            case 3:
                do{
                    printf("Digite uma nota entre 0 e 10:\n");
                    scanf("%f%*c", &notaInformada);
                }while(notaInformada < 0 && notaInformada > 10);
                
                for(i = 0; i < numeroAlunos; i++){
                    if(mediaNota[i] > notaInformada){
                        printf("%s tem a nota maior que %.2f\n", alunos[i], notaInformada);
                    }
                }
                break;

            case 4:
                printf("Informe uma posicao para ver os dados do respectivo aluno\n");
                for(int i = 0; i < numeroAlunos; i++){
                    printf("[%i] - %s\n", i, alunos[i]);
                }
                printf("Posicao: ");
                scanf("%i%*c", &posicaoAluno);

                printf("Nome: %s\n", alunos[posicaoAluno]);
                printf("Media: %.2f\n", mediaNota[posicaoAluno]);
                printf("Status: %s\n", mediaNota[posicaoAluno] >= 7 ? "aprovado" : "reprovado");
                break;

            case 5:
                printf("Encerrando o programa");
                break;

            default:
                printf("Escolha uma opcao valida!\n");
                break;
        }
    }while(op != 5);

    return 0;
}