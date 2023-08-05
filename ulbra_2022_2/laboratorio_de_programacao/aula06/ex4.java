import java.util.Scanner;

public class ex4 {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        double[] vetor_A = new double[3];
        double[] vetor_B = new double[vetor_A.length];

        for(int i=0;i<vetor_A.length;i++){
            System.out.println("Valor na posicao: "+i);
            vetor_A[i] = scan.nextDouble();
            vetor_B[i] = Math.sqrt(vetor_A[i]);
        }

        System.out.println("Vetor A = _");

        for (int i=0; i< vetor_A.length;i++){
            System.out.println(vetor_A[i]+"");
        }

        System.out.println();

        System.out.println("Valores da raiz quadrada =");
        for (int i=0;i< vetor_B.length;i++){
            System.out.println(vetor_B[i]);
        }
    }
}