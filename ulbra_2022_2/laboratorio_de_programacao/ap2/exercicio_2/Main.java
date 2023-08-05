public class Main {
    public static void main(String[] args) {
        veiculo v = new veiculo(false);
        Automovel a = new Automovel(false);
        Motocicleta m = new Motocicleta(false);
        Onibus o = new Onibus(false);
        
        System.out.println("Inicio... ");
        System.out.println(v.itsOn());
        System.out.println(a.itsOn());
        System.out.println(m.itsOn());
        System.out.println(o.itsOn());

        System.out.println("Ligando... ");
        System.out.println(v.start());
        System.out.println(a.start());
        System.out.println(m.start());
        System.out.println(o.start());

        System.out.println("Desligando... ");
        System.out.println(v.off());
        System.out.println(a.off());
        System.out.println(m.off());
        System.out.println(o.off());
    }

   
}
