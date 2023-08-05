package exercicio_3;
public class Main {
    
    public static void main(String[] args) {
        Quadrado q = new Quadrado(4);
        Circunferencia c = new Circunferencia(4);
        Retangulo r = new Retangulo(4, 2);

        System.out.println("Quadrado: " + q.calcularArea());
        System.out.println("Circunferencia: " + c.calcularArea());
        System.out.println("Retangulo: " + r.calcularArea());
    }
}
