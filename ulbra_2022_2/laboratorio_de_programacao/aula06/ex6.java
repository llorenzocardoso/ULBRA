import java.util.Scanner;

public class ex6 {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        int[] vetor_A = new int[10];
        int[] vetor_B = new int[10];
        int[] vetor_C = new int[10];

        for(int i=0;i<vetor_A.length;i++){
            System.out.println("Valor na posicao: "+i);
            vetor_A[i] = scan.nextInt();
        }

        System.out.println("Vetor A =");

        for (int i=0; i< vetor_A.length;i++){
            System.out.println(vetor_A[i]+"");
        }

        System.out.println();

        for(int i=0;i<vetor_B.length;i++){
            System.out.println("Entrar com um valor do vetor B: "+i);
            vetor_B[i] = scan.nextInt();
        }
        System.out.println("Vetor B =");
        for (int i=0;i< vetor_B.length;i++){
            System.out.println(vetor_B[i]+"");
        }

        System.out.println("Soma dos vetores A e B = ");
        for (int i=0;i<vetor_C.length;i++){
            vetor_C[i]= vetor_A[i] + vetor_B[i];
            System.out.println("A Soma e = "+ vetor_C[i]);
        }
    }
}