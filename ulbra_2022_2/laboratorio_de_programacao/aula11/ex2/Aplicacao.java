package ex2;
public class Aplicacao {
    public static void main(String[] args) {
        //Cria a turma
        Turma turma = new Turma();

        //Criação dos alunos
        Aluno aluno1 = new Aluno();
        Aluno aluno2 = new Aluno();
        Aluno aluno3 = new Aluno();

        //Associação dos alunos e a turma
        turma.aluno1 = aluno1;
        turma.aluno2 = aluno2;
        turma.aluno3 = aluno3;

        //Criar as provas para cada aluno e definir as notas
        //Aluno1
        Prova aluno1Prova1 = new Prova();
        aluno1Prova1.notaParte1 = 4.0;
        aluno1Prova1.notaParte2 = 2.5;
        aluno1.prova1 = aluno1Prova1;
        Prova aluno1Prova2 = new Prova();
        aluno1Prova2.notaParte1 = 1.0;
        aluno1Prova2.notaParte2 = 7.0;
        aluno1.prova2 = aluno1Prova2;

        //Aluno2
        Prova aluno2Prova1 = new Prova();
        aluno2Prova1.notaParte1 = 6.0;
        aluno2Prova1.notaParte2 = 1.5;
        aluno2.prova1 = aluno2Prova1;
        Prova aluno2Prova2 = new Prova();
        aluno2Prova2.notaParte1 = 2.0;
        aluno2Prova2.notaParte2 = 3.0;
        aluno2.prova2 = aluno2Prova2;

        //Aluno3
        Prova aluno3Prova1 = new Prova();
        aluno3Prova1.notaParte1 = 5.0;
        aluno3Prova1.notaParte2 = 2.5;
        aluno3.prova1 = aluno3Prova1;
        Prova aluno3Prova2 = new Prova();
        aluno3Prova2.notaParte1 = 1.0;
        aluno3Prova2.notaParte2 = 8.0;
        aluno3.prova2 = aluno3Prova2;

        //Imprimir a média de cada aluno
        System.out.println("Média do aluno 1 é: " + turma.aluno1.calcularMedia());
        System.out.println("Média do aluno 2 é: " + turma.aluno2.calcularMedia());
        System.out.println("Média do aluno 3 é: " + turma.aluno3.calcularMedia());

        //Imprimir a média da turma
        System.out.println("Média da turma é: "+ turma.calcularMedia());

        
    }
}
