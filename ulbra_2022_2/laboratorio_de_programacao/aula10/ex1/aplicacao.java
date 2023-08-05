package ex1;
public class aplicacao {
    public static void main(String[] args) {
        relogio r1 = new relogio();
        
        r1.acertarRelogio(1, 4, 35);

        System.out.println("Posição da hora: " + r1.ponteiroHora.posicao);
        System.out.println("Posição do minuto: " + r1.ponteiroMinuto.posicao);
        System.out.println("Posição do segundo: " + r1.ponteiroSegundo.posicao);

        int hora = r1.lerHora();
        int minuto = r1.lerMinuto();
        int segundo = r1.lerSegundo();

        System.out.println("Hora: " + hora);
        System.out.println("Minuto: " + minuto);
        System.out.println("Segundo: " + segundo);
    }
}
