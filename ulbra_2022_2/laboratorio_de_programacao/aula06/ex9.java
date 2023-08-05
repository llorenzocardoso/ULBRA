import java.util.Scanner;

public class ex9 {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        double[] vetor_A = new double[3];
        double[] vetor_B = new double[3];
        double[] vetor_C = new double[3];

        for(int i=0;i<vetor_A.length;i++){
            System.out.println("Valor na posicao: "+i);
            vetor_A[i] = scan.nextDouble();
        }

        System.out.println("Vetor A =");

        for (int i=0; i< vetor_A.length;i++){
            System.out.println(vetor_A[i]+"");
        }

        System.out.println();

        for(int i=0;i<vetor_B.length;i++){
            System.out.println("Entrar com um valor do vetor B: "+i);
            vetor_B[i] = scan.nextDouble();
        }
        System.out.println("Vetor B =");
        for (int i=0;i< vetor_B.length;i++){
            System.out.println(vetor_B[i]+"");
        }

        System.out.println("A divisao dos vetores A e B = ");
        for (int i=0;i<vetor_C.length;i++){
            vetor_C[i]= vetor_A[i] / vetor_B[i];
            System.out.println("A divisao e = "+vetor_C[i]);
        }
    }
}