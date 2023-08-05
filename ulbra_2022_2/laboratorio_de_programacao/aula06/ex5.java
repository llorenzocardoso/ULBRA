import java.util.Scanner;

public class ex5 {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        int[] vetor_A = new int[10];
        int[] vetor_B = new int[vetor_A.length];

        for(int i=0;i<vetor_A.length;i++){
            System.out.println("Valor na posicao: "+i);
            vetor_A[i] = scan.nextInt();
            vetor_B[i] = vetor_A[i];
        }

        System.out.println("Vetor A =");

        for (int i=0; i< vetor_A.length;i++){
            System.out.println(vetor_A[i]+"");
        }

        System.out.println();

        System.out.println("Valores multiplicados = _");
        for (int i=0;i< vetor_B.length;i++){
            int [] multi = new int[vetor_B.length];
            multi[i] = vetor_B[i] * i;
            System.out.println(multi[i]+"");
        }
    }
} 
