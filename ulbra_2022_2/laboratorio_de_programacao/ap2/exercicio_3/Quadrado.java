package exercicio_3;
public class Quadrado extends AreaCalculavel{
    double lado;

    public Quadrado(double lado){
        super();
        this.setSide(lado);
    }

    public double getSide(){
        return lado;
    }

    public void setSide(double lado){
        this.lado = lado;
    }

    public double calcularArea(){
        return Math.pow(this.getSide(),2);
    }
}
