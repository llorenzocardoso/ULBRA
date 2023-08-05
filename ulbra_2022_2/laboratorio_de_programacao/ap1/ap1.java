import java.util.Scanner;

public class ap1 {
    public static void main(String[] args) {
        int opcao, mes;
        String[] meses = {"Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"};
        String[] month = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};

        Scanner sc = new Scanner(System.in);
        System.out.println("Escolha o idioma:\n1) Português\n2) Inglês");
        opcao = sc.nextInt();
        System.out.println("Escolha o mês:");
        mes = sc.nextInt();

        switch (opcao){
            case 1:
                System.out.println(meses[mes-1]);
                break;
            case 2:
                System.out.println(month[mes-1]);
                break;
            default:
                System.out.println("Opção inválida!!!");
                break;
        }
    }
}
